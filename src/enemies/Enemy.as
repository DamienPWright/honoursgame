package enemies {
	import states.EnemyWander;
	public class Enemy extends Actor {
		
		private var target:Actor;
		protected var dir:int;
		
		public function Enemy(X:int, Y:int, t:Actor) {
			super(X, Y);
			target = t;
			movespeed = 25;
			loadGraphic(SpriteList.sprite_en_giantslime , true, false, 32, 32);
			
			fsm.changeState(new EnemyWander(this, target));
			faction = "enemy";
		}
		
		public override function update():void {
			super.update();
		}
		
		public function setTarget(newtarget:Actor):void {
			target = newtarget;
		}
		
		public function getTarget():Actor {
			return target;
		}
		
	}
}