package {
	import weapons.*;
	import states.*;
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
			maxHp = 5;
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
			var dmg = hb.getAttack().getDamage();
			if (!hb.checkActorInObjectList(this)) {
				dealDamage(dmg);
			}
			flicker(0.2);
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
		
		public function onDeath():void {
			//remove attack effects
			fsm.changeState(new ActorIdle(this));
			kill();
		}
		 
		 
		public function dealDamage(damage:int) {
			curHp -= damage; //For now. Later may add some checks for damage reduction via SEs, gear etc. 
			//consider adding a damage indicator text. Green for negative damage, red for positive damage. "Guard!" for 0 damage. 
			
			spriteflash = true;
			trace(damage + " damage dealt");
			//Dead check!
			if (curHp <= 0) {
				//dead!
  				onDeath();
			}
		}
	}
}