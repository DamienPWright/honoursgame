package enemies {
	import states.EnemyWander;
	public class Enemy extends Actor {
		
		private var target:Actor;
		
		public function Enemy(X:int, Y:int, t:Actor) {
			super(X, Y);
			target = t;
			movespeed = 25;
			loadGraphic(SpriteList.sprite_en_slime , true, false, 32, 32);
			
			fsm.changeState(new EnemyWander(this, target));
		}
		
		public override function update():void {
			super.update();
			fsm.update();
		}
		
		
	}
}