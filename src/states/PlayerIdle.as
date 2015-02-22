package states {
	import org.flixel.*;
	import states.ActorState;
	
	public class PlayerIdle implements ActorState {
		private var fsm:FiniteStateMachine;
		private var self:Player;
		
		public function PlayerIdle(a:Player) {
			self = a;
			fsm = self.getStateMachine();
		}
		
		public function update():void {
			var anim:String;
			//anim
			switch(self.currentFacing) {
				case FlxObject.UP:
					anim = "idle_north";
					break;
				case FlxObject.DOWN:
					anim = "idle_south";
					break;
				case FlxObject.LEFT:
					anim = "idle_west";
					break;
				case FlxObject.RIGHT:
					anim = "idle_east";
					break;
			}
			self.play(anim);
			
			//attack
			if (FlxG.keys.SHIFT) {
				//attackanim
				fsm.changeState(new PlayerAttack(self))
			}
			
			if (FlxG.keys.A || FlxG.keys.D || FlxG.keys.W || FlxG.keys.S){
				//switch to moving state
				fsm.changeState(new PlayerWalk(self))
			}
		}
		
		public function onExit():void {
			
		}
		
		public function onEnter():void {
			
		}
	}
}