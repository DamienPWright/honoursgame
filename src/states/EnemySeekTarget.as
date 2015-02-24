package states 
{
	import enemies.Enemy;
	import flash.text.engine.ElementFormat;
	import org.flixel.*;
	
	public class EnemySeekTarget implements ActorState
	{
		private var fsm:FiniteStateMachine;
		private var self:Enemy;
		private var target:Actor;
		private var seekbox:HitBox;
		private var seekbox_size:int;
		private var seekbox_pos:FlxPoint;
		
		public function EnemySeekTarget(e:Enemy) 
		{
			self = e;
			fsm = self.getStateMachine();
			seekbox_size = 200;
			seekbox_pos = new FlxPoint(self.x - seekbox_size / 2, self.y - seekbox_size / 2);
			seekbox = (FlxG.state as TmxLevel).createHitBox(seekbox_pos.x, seekbox_pos.y, seekbox_size, seekbox_size, 1, 0);
		}
		
		public function update():void {
			seekbox.setHitBoxPos(self.x - seekbox_size / 2,  self.y - seekbox_size / 2);
			if ((FlxG.state as TmxLevel).checkHitboxActorOverlap(seekbox, (FlxG.state as TmxLevel).getPlayer())){
				self.setTarget((FlxG.state as TmxLevel).getPlayer());
				fsm.changeState(new EnemyWander(self, self.getTarget()));
			}
		}
		
		public function onExit():void {
			seekbox.killHitBox();
		}
		
		public function onEnter():void {
			
		}
	}

}