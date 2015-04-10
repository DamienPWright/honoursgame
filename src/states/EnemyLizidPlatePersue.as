package states 
{
	import enemies.*;
	import org.flixel.*;
	/**
	 * ...
	 * @author Raujinn
	 */
	public class EnemyLizidPlatePersue implements ActorState 
	{
		private var fsm:FiniteStateMachine;
		private var self:Enemy;
		private var target:Actor;
		
		private var seekbox:HitBox;
		private var seekbox_size:int;
		private var seekbox_pos:FlxPoint;
		
		private var dir = 0;

		public function EnemyLizidPlatePersue(e:Enemy) 
		{
			self = e;
			target = self.getTarget();
			fsm = self.getStateMachine();
			seekbox_size = 50;
			seekbox_pos = new FlxPoint(self.getMidpoint().x - (seekbox_size / 2), self.getMidpoint().y - (seekbox_size / 2));
			seekbox = (FlxG.state as TmxLevel).createHitBox(seekbox_pos.x, seekbox_pos.y, seekbox_size, seekbox_size, 1, 0);
		}
		
		/* INTERFACE states.ActorState */
		
		public function onEnter():void 
		{
			
		}
		
		public function update():void 
		{
			if(target != null){
				dir = Math.atan2(target.y - self.y, target.x - self.x);
				self.velocity.x = self.movespeed * Math.cos(dir) * 3;
				self.velocity.y = self.movespeed * Math.sin(dir) * 3;
			}

			dir = dir / Math.PI + 1;
			if (dir >= 0.75 && dir <= 1.25) {
				self.play("walk_e");
				self.currentFacing = FlxObject.RIGHT;
			}else if (dir >= 1.25 && dir <= 1.75) {
				self.play("walk_s");
				self.currentFacing = FlxObject.DOWN;
			}else if ((dir >= 1.75 && dir <= 2) || (dir >= 0 && dir <= 0.25)) {
				self.play("walk_w");
				self.currentFacing = FlxObject.LEFT;
			}else if (dir >= 0.25 && dir < 0.75) {
				self.play("walk_n");
				self.currentFacing = FlxObject.UP;
			}
			//use a seekbox to determine if target is close enough
			seekbox.setHitBoxPos(self.getMidpoint().x - (seekbox_size / 2), self.getMidpoint().y - (seekbox_size / 2));
			
			//if so, pick an attack
			if ((FlxG.state as TmxLevel).checkHitboxActorOverlap(seekbox, target)){
				fsm.changeState(new EnemyLizidPlateAttack(self));
			}
		}
		
		public function onExit():void 
		{
			seekbox.killHitBox();
		}
		
	}

}