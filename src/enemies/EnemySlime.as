package enemies {
	import states.EnemySlimeWander;
	import org.flixel.*;
	public class EnemySlime extends Enemy {
		
		private var target:Actor;
		
		public function EnemySlime(X:int, Y:int, t:Actor) {
			super(X, Y, target);
			movespeed = 10;
			loadGraphic(SpriteList.sprite_en_slime , true, false, 16, 32);
			maxHp = 2;
			curHp = 2;
			height = 16;
			offset.y = 16;
			
			fsm.changeState(new EnemySlimeWander(this));
			
			addAnimation("walk_n", [2, 3], 4);
			addAnimation("walk_s", [0, 1], 4);
			addAnimation("walk_e", [6, 7], 4);
			addAnimation("walk_w", [4, 5], 4);
		}
	}
}