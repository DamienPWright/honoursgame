package states 
{
	import attacks.Attack;
	import attacks.EnemyAttackGiantSlimeShriek;
	import enemies.Enemy;
	/**
	 * ...
	 * @author Raujinn
	 */
	public class EnemyGiantSlimeShriek implements ActorState 
	{
		private var fsm:FiniteStateMachine;
		private var self:Enemy;
		private var count:int;
		private var attack:Attack;
		private var attack_length:int;
		
		public function EnemyGiantSlimeShriek(a:Enemy ) 
		{
			self = a;
			fsm = self.getStateMachine();
			count = 0;
			attack_length = 25;
			attack = new EnemyAttackGiantSlimeShriek(self);
		}
		
		/* INTERFACE states.ActorState */
		
		public function onEnter():void 
		{
			self.velocity.x = 0;
			self.velocity.y = 0;
			var anim:String;
			self.immovable = true;
		}
		
		public function update():void 
		{
			//anim
			
			attack.update();
			if (attack.getAttackComplete()) {
				//attack ends
				attack.exit();
				fsm.changeState(new EnemyGiantSlimePersue(self));
			}
		}
		
		public function onExit():void 
		{
			self.immovable = false;
		}
		
	}

}