package enemies {
	import states.EnemySeekTarget;
	public class EnemyGiantSlime extends Enemy {
		
		private var target:Actor;
		
		public function EnemyGiantSlime(X:int, Y:int, t:Actor) {
			super(X, Y, target);
			
			fsm.changeState(new EnemySeekTarget(this));
		}
	}
}