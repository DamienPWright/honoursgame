package {
	import flash.display.InteractiveObject;
	import org.flixel.*;
	import states.PlayerIdle;
	import weapons.*;
	
	public class Player extends Actor {
		
		public function Player(startX:int, startY:int) {
			super(startX, startY);
			
			maxVelocity.x = movespeed;
			maxVelocity.y = movespeed;
			
			faction = "player";

			
			loadGraphic(SpriteList.sprite_player, true, false, 32, 32);
			
			maxHp = 100;
			curHp = maxHp;
			width = 20;
			height = 32;
			offset.x = 6;
			
			addAnimation("idle_north", [3], 4, false); 
			addAnimation("idle_south", [0], 4, false); 
			addAnimation("idle_east", [6], 4, false); 
			addAnimation("idle_west", [9], 4, false); 
			addAnimation("walk_north", [4, 4, 3, 5, 5, 3], 12, true); 
			addAnimation("walk_south", [1, 1, 0, 2, 2, 0], 12, true); 
			addAnimation("walk_east", [7, 7, 6, 8, 8, 6], 12, true); 
			addAnimation("walk_west", [10, 10, 9, 11, 11, 9], 12, true); 
			addAnimation("swipe_north", [15, 15, 16, 17], 12, false);
			addAnimation("swipe_south", [12, 12, 13, 14], 12, false);
			addAnimation("swipe_east", [18, 18, 19, 20], 12, false);
			addAnimation("swipe_west", [21, 21, 22, 23], 12, false);
			//default weapon for now, may add more in future iterations of the game
			weapon = new Weapon(this);
			//playerWalk = new PlayerWalk(this)
			fsm.changeState(new PlayerIdle(this))
		}
		
		override public function update():void
		{
			super.update();
		}
		
		override public function destroy():void {
			
		}
	}
}