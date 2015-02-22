import states.ActorState;
package states {
	public class ActorIdle implements ActorState {
		private var fsm:FiniteStateMachine;
		private var self:FlxSprite;
		
		public function ActorIdle(a: FlxSprite) {
			self = a;
			fsm = self.GetStateMachine();
		}
		
		override public function update():void {
			//anim
			switch(a.currentFacing) {
				case UP:
					anim = "idle_north";
					break;
				case DOWN:
					anim = "idle_south";
					break;
				case LEFT:
					anim = "idle_west";
					break;
				case RIGHT:
					anim = "idle_east";
					break;
			}
			a.play(anim);
		}
	}
}