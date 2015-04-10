package states 
{
	import enemies.Enemy;
	import attacks.*;
	/**
	 * ...
	 * @author Raujinn
	 */
	public class EnemyLizidPlateAttack implements ActorState 
	{
		private var fsm:FiniteStateMachine;
		private var self:Enemy;
		private var target:Actor;
		
		private var attack:Attack;
		
		public function EnemyLizidPlateAttack(e:Enemy) 
		{
			self = e;
			fsm = self.getStateMachine();
			attack = new EnemyLizidPlateNibble(self);
		}
		
		/* INTERFACE states.ActorState */
		
		public function onEnter():void 
		{
			self.velocity.x = 0;
			self.velocity.y = 0;
			self.immovable = true;
		}
		
		public function update():void 
		{
			attack.update();
			if (attack.getAttackComplete()) {
				//attack ends
				attack.exit();
				fsm.changeState(new EnemyLizidPlatePersue(self));
			}
		}
		
		public function onExit():void 
		{
			self.immovable = false;
			attack.exit();
		}
		
	}

}