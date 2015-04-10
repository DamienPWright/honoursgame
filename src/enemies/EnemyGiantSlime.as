package enemies {
	import org.flixel.*;
	import states.EnemyGiantSlimeSeek;
	public class EnemyGiantSlime extends Enemy {
		
		//private var target:Actor;
		private var immuneToDamage:Boolean = false;

		
		public function EnemyGiantSlime(X:int, Y:int, t:Actor) {
			super(X, Y, target);
			movespeed = 10;
			loadGraphic(SpriteList.sprite_en_giantslime , true, false, 32, 64);
			maxHp = 5;
			curHp = maxHp;
			height = 32;
			offset.y = 32;
			
			fsm.changeState(new EnemyGiantSlimeSeek(this));
			
			addAnimation("walk_n", [5, 6], 4);
			addAnimation("walk_s", [0, 1], 4);
			addAnimation("walk_e", [15, 16], 4);
			addAnimation("walk_w", [10, 11], 4);
		}
		
		
	}
}