package attacks {
	import effects.*;
	import org.flixel.*;
	
	public class PlayerAttackSword extends Attack {
		
		public function PlayerAttackSword(a:Actor) {
			super(a);
			//this class will handle the animation for a given attack
			//A weapon will have an animation and attempt to sync up with
			//the actor's animation.
			//actor = a;
			//in future these could be loaded from JSON files

			actoranim = [
				[15, 15, 16, 17, 17, 17, 17, 17],
				[12, 12, 13, 14, 14, 14, 14, 14],
				[21, 21, 22, 23, 23, 23, 23, 23],
				[18, 18, 19, 20, 20, 20, 20, 20]	
			];
			
			effectanim = [
				[4,4,5,6,7,7,7,7],
				[0,0,1,2,3,3,3,3],
				[12,12,13,14,15,15,15],
				[8,8,9,10,11,11,11,11]
			]
			
			effectsList = [
				[EffectPlayerSword, SpriteList.sprite_eff_sword_slash, true, false, 96, 96]
			]
			telegraphLength = 0;
			telegraphAnimLoop = false;
			telegraphAnimFrames = [
				[0],
				[0],
				[0],
				[0],
				[-1]
			]
			attackAnimFramesLoop = false;
			attackAnimFrames = [
				[12, 12, 13, 14, 14, 14, 14, 14],
				[15, 15, 16, 17, 17, 17, 17, 17],
				[21, 21, 22, 23, 23, 23, 23, 23],
				[18, 18, 19, 20, 20, 20, 20, 20],
				[0, -1, -1, -1, -1, -1, -1, -1]
			]
			attackTimer = 0;
			attackEndTime = 15; //frames
			attackComplete = false;
			//initAnims();
			resetAnims();
		}
		
		override public function update():void
		{
			super.update();
		}
		
		override public function attackAnimUpdate(currentFrame:Number):void {
		}
		/**
		 * Use this function to fire any unique "on attack" effects gear might have.
		 * @return	Damage that was dealt by the attack
		 */
		override public function getDamage():int {
			return actor.attack;
		}
		
		override public function resetAnims():void {
			attackTimer = 0;
			attackCurFrame = 0;
			attackPrevFrame = 0;
			attackComplete = false;
			//generate effect
			//effect = (FlxG.state as TmxLevel).recycleEffect(SpriteList.sprite_eff_sword_slash, true, false, 96, 96);
		}
		
		override public function exit():void {
			attackTimer = 0;
			//effect.kill();
		}
	}
}