package states {
	import states.ActorState;
	import org.flixel.*;
	public class PlayerAttackCharge implements ActorState {
		private var fsm:FiniteStateMachine;
		private var self:Player;
		private var count:int;
		private var attack_length:int;
		
		public function PlayerAttackCharge(a:Player, chrg:int = 0) {
			self = a;
			fsm = self.getStateMachine();
			count = 0;
			attack_length = 25;
		}
		
		public function update():void {
			self.velocity.x = 0;
			self.velocity.y = 0;
			var anim:String;
			
			//anim
			
			self.weapon.update();
			if (self.weapon.getWeaponAttackAnimComplete()) {
				//attack ends
				fsm.changeState(new PlayerIdle(self));
			}
		}
		
		public function onExit():void {
			self.weapon.exit();
		}
		
		public function onEnter():void {
			self.weapon.resetAnims();
		}
	}
}