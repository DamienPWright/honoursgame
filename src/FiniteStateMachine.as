package {
	import states.ActorState;

	public class FiniteStateMachine {
		private var currentState:ActorState
		private var previousState:ActorState
		private var nextState:ActorState
		
		public function FiniteStateMachine() {
			currentState = null;
			previousState = null;
			nextState = null;
		}
		
		public function setNextState(s:ActorState):void {
			nextState = s;
		}
		
		public function update():void{
			if (currentState) {
				currentState.update();
			}
		}
		
		public function changeState(s:ActorState):void {
			if (currentState) {
				currentState.onExit();
				previousState = currentState;
			}
			currentState = s;
			currentState.onEnter();
		}
		
		public function goToPreviousState():void {
			if(previousState){
				changeState(previousState)
			}
		}
		
		public function goToNextState():void {
			if(nextState){
				changeState(nextState)
			}
		}
	}
}