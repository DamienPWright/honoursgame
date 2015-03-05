package attacks 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Raujinn
	 */
	public class EnemyAttackGiantSlimeShriek extends Attack 
	{
		private var currentFrame:int = 0;
		private var endFrame:int = 0;
		private var telegraphFrame:int = 0;
		private var attackFrame:int = 1;
		private var telegraphLength:int = 45;
		
		public function EnemyAttackGiantSlimeShriek(a:Actor) 
		{
			super(a);
			
			actoranim = [
				[2, 3],
				[7, 8],
				[12, 13],
				[17, 18]	
			];
			
			effectanim = [4, 4, 5, 6, 7, 7, 7, 7];
			attackTimer = 0;
			attackEndTime = 90; //frames
			attackComplete = false;
		}
		
		override public function update():void
		{
			attackTimer += 1
			
			if (attackTimer < telegraphLength) {
				currentFrame = telegraphFrame;
			}else {
				currentFrame = attackFrame;
			}
			switch(actor.currentFacing) {
				case FlxObject.UP:
					actor.frame = actoranim[1][currentFrame];
					break;
				case FlxObject.DOWN:
					actor.frame = actoranim[0][currentFrame];
					break;
				case FlxObject.LEFT:
					actor.frame = actoranim[2][currentFrame];
					break;
				case FlxObject.RIGHT:
					actor.frame = actoranim[3][currentFrame];
					break;
			}
			
			if (attackTimer > attackEndTime) {
				attackComplete = true;
			}
		}
		
		override public function attackAnimUpdate(currentFrame:Number):void {
			//get facing
			
			if (currentFrame == 7) {
				//generate hitbox
			}
		}
		/**
		 * Use this function to fire any unique "on attack" effects gear might have.
		 * @return	Damage that was dealt by the attack
		 */
		override public function getDamage():int {
			return actor.attack;
		}
		
		override public function getAttackComplete():Boolean {
			return attackComplete;
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
			effect.kill();
		}
	}

}