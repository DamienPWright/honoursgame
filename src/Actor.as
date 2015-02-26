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
		public var spriteflash:Boolean = false;
		
		//lifestats
		public var maxHp:int;
		public var curHp:int;
		public var attack:int;
		
		public function Actor(startX:int, startY:int) {
			super(startX, startY);
			fsm = new FiniteStateMachine();
			
			//default values for testing
			maxHp = 3;
			curHp = maxHp;
			attack = 1;
		}
		
		public function getStateMachine():FiniteStateMachine {
			return fsm;
		}
		/**
		 * Used when the actor is hit by something
		 * @param	hb	The hitbox that collided with it.
		 */
		public function onHit(hb:HitBox):void {
			kill();
			//dealDamage(hb.damage);
		}
		
		public override function update():void {
			super.update();
			fsm.update();
		}
		
		/**
		 * Process damage recieved by the actor.
		 * 
		 * @param	damage
		 */
		public function dealDamage(damage:int) {
			curHp -= damage; //For now. Later may add some checks for damage reduction via SEs, gear etc. 
			//consider adding a damage indicator text. Green for negative damage, red for positive damage. "Guard!" for 0 damage. 
			
			spriteflash = true;
			
			//Dead check!
			if (curHp <= 0) {
				//dead!
				kill();
			}
		}
	}
}