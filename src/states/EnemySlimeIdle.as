package states 
{
	import enemies.Enemy;
	import org.flixel.*;
	public class EnemySlimeIdle implements ActorState
	{
		private var fsm:FiniteStateMachine;
		private var self:Enemy;
		private var target:Actor;
		private var dir:int = 0;
		private var idleTimer:Number = 0;
		private var idleTime:Number = 3;
		
		private var seekbox:HitBox;
		private var seekbox_size:int;
		private var seekbox_pos:FlxPoint;
		
		public function EnemySlimeIdle(e:Enemy) 
		{
			self = e;
			fsm = self.getStateMachine();
			seekbox_size = 100;
			seekbox_pos = new FlxPoint(self.getMidpoint().x - (seekbox_size / 2), self.getMidpoint().y - (seekbox_size / 2));
			seekbox = (FlxG.state as TmxLevel).createHitBox(seekbox_pos.x, seekbox_pos.y, seekbox_size, seekbox_size, 1, 0);
		}
		
		public function update():void {
			idleTimer += FlxG.elapsed;
			//self.velocity.x = 0;
			//self.velocity.y = 0;
			if (idleTimer > idleTime) {
				fsm.changeState(new EnemySlimeWander(self));
			}
			
			seekbox.setHitBoxPos(self.getMidpoint().x - (seekbox_size / 2), self.getMidpoint().y - (seekbox_size / 2));
			if ((FlxG.state as TmxLevel).checkHitboxActorOverlap(seekbox, (FlxG.state as TmxLevel).getPlayer())){
				self.setTarget((FlxG.state as TmxLevel).getPlayer());
				fsm.changeState(new EnemySlimePersue(self));
			}
		}
		
		public function onExit():void {
			seekbox.killHitBox();
			idleTimer = 0;
		}
		
		public function onEnter():void {
		}
	}

}