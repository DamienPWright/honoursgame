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
			self.velocity.x = 0;
			self.velocity.y = 0;
			var angle = 0;
			var anim:String;
			
			if (FlxG.keys.A){
				self.velocity.x = -self.movespeed;
				self.currentFacing = FlxObject.LEFT;
			}else if (FlxG.keys.D){
				self.velocity.x = self.movespeed;
				self.currentFacing = FlxObject.RIGHT;
			}
			if (FlxG.keys.W){
				self.velocity.y = -self.movespeed;
				self.currentFacing = FlxObject.UP;
			}else if (FlxG.keys.S){
				self.velocity.y = self.movespeed;
				self.currentFacing = FlxObject.DOWN;
			}
			
			if (FlxG.keys.A && FlxG.keys.W) {
				angle = 1.25 * Math.PI;
			}else if (FlxG.keys.A && FlxG.keys.S)  {
				angle = 0.75 * Math.PI;
			}else if (FlxG.keys.D && FlxG.keys.W)  {
				angle = 1.75 * Math.PI;
			}else if (FlxG.keys.D && FlxG.keys.S)  {
				angle = 0.25 * Math.PI;
			}
			if (self.velocity.x != 0 && self.velocity.y != 0) {
				self.velocity.x = self.movespeed * Math.cos(angle);
				self.velocity.y = self.movespeed * Math.sin(angle);
			}
			
			if (self.velocity.x == 0 && self.velocity.y == 0) {
				//back to idle state
				fsm.changeState(new PlayerIdle(self))
			}
			
			//attack
			if (FlxG.keys.SHIFT) {
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
			
		}
		
		public function onEnter():void {
			
		}
	}
}