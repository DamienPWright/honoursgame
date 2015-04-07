package states {
	import states.ActorState;
	import org.flixel.*;
	public class PlayerWalk implements ActorState {
		private var fsm:FiniteStateMachine;
		private var self:Player;
		
		public function PlayerWalk(a:Player) {
			self = a;
			fsm = self.getStateMachine();
		}
		
		public function update():void {
			var angle = 0;
			var dir = 0;
			var anim:String;
			
			if (FlxG.keys.A && FlxG.keys.W) {
				dir = 1.25;
			}else if (FlxG.keys.A && FlxG.keys.S)  {
				dir = 0.75;
			}else if (FlxG.keys.D && FlxG.keys.W)  {
				dir = 1.75;
			}else if (FlxG.keys.D && FlxG.keys.S)  {
				dir = 0.25;
			}else if (FlxG.keys.A) {
				dir = 1;
				self.currentFacing = FlxObject.LEFT;
			}else if (FlxG.keys.D) {
				dir = 0;
				self.currentFacing = FlxObject.RIGHT;
			}else if (FlxG.keys.W) {
				dir = 1.5;
				self.currentFacing = FlxObject.UP;
			}else if (FlxG.keys.S) {
				dir = 0.5;
				self.currentFacing = FlxObject.DOWN;
			}
			
			angle = dir * Math.PI;
			self.velocity.x = self.movespeed * Math.cos(angle);
			self.velocity.y = self.movespeed * Math.sin(angle);
	
			if (!FlxG.keys.W && !FlxG.keys.A && !FlxG.keys.S && !FlxG.keys.D) {
				//back to idle state
				fsm.changeState(new PlayerIdle(self))
			}
			
			//attack
			if (FlxG.keys.SPACE) {
				//attackanim
				fsm.changeState(new PlayerAttack(self))
			}
			//anim
			switch(self.currentFacing) {
				case FlxObject.UP:
					anim = "walk_north";
					break;
				case FlxObject.DOWN:
					anim = "walk_south";
					break;
				case FlxObject.LEFT:
					anim = "walk_west";
					break;
				case FlxObject.RIGHT:
					anim = "walk_east";
					break;
			}
			self.play(anim);
		}
		
		public function onExit():void {
			self.velocity.x = 0;
			self.velocity.y = 0;
		}
		
		public function onEnter():void {
			
		}
	}
}