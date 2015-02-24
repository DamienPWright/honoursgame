package {
	import weapons.*;
	import org.flixel.*;
	
	public class Actor extends FlxSprite {
		protected var fsm:FiniteStateMachine;
		public var currentFacing = RIGHT;
		public var isMoving = false;
		public var isAttacking = false;
		public var movespeed = 100;
		public var weapon:Weapon;
		public var faction:String;
		
		public function Actor(startX:int, startY:int) {
			super(startX, startY);
			fsm = new FiniteStateMachine();
		}
		
		public function getStateMachine():FiniteStateMachine {
			return fsm;
		}
	}
}