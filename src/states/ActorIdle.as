package states {
	import states.ActorState;
	import org.flixel.*;
	
	public class ActorIdle implements ActorState {
		private var fsm:FiniteStateMachine;
		private var self:Actor;
		
		public function ActorIdle(a: Actor) {
			self = a;
			fsm = self.getStateMachine();
		}
		public function onEnter():void {
			
		}
		
		public function onExit():void {
			
		}
		public function update():void {

		}
	}
}