package attacks 
{
	import org.flixel.*;
	import effects.*;
	/**
	 * ...
	 * @author Raujinn
	 */
	public class EnemyAttackSlimeSlap extends Attack 
	{
		
		
		public function EnemyAttackSlimeSlap(a:Actor) 
		{
			super(a);
			effectsList = [
				[EffectSlimeSlap,SpriteList.sprite_eff_slime_slap, true, false, 32, 32]
			]
			telegraphAnimLoop = false;
			telegraphAnimFrames = [
				[8],
				[10],
				[12],
				[14],
				[-1]
			]
			attackAnimFramesLoop = false;
			attackAnimFrames = [
				[9,9,9,9,9,9,8],
				[11,11,11,11,11,11,10],
				[13,13,13,13,13,13,12],
				[15,15,15,15,15,15,14],
				[-1,0,-1,-1,-1,-1,-1]
			]
			attackTimer = 0;
			attackEndTime = 35; //frames
			telegraphLength = 25;
			attackComplete = false;
			//initAnims();
			resetAnims();
			
			attackMod = 10.0;
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
		
		override public function resetAnims():void {
			attackTimer = 0;
			attackCurFrame = 0;
			attackPrevFrame = 0;
			attackComplete = false;
			//generate effect
			//effect = (FlxG.state as TmxLevel).recycleEffectClass(EffectGiantSlimeShriek,actor,this,SpriteList.sprite_eff_giantslime_shriek, true, false, 64, 64);
		}
		
		override public function exit():void {
			attackTimer = 0;
			//effect.kill();
		}
	}

}