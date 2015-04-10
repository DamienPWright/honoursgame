package attacks 
{
	import org.flixel.*;
	import effects.*;
	/**
	 * ...
	 * @author Raujinn
	 */
	public class EnemyLizidPlateNibble extends Attack 
	{
		
		
		public function EnemyLizidPlateNibble(a:Actor) 
		{
			super(a);
			effectsList = [
				[EffectSlimeSlap,SpriteList.sprite_eff_slime_slap, true, false, 32, 32]
			]
			telegraphAnimLoop = false;
			telegraphAnimFrames = [
				[9],
				[3],
				[15],
				[21],
				[-1]
			]
			attackAnimFramesLoop = false;
			attackAnimFrames = [
				[10,10,10,10,10,10,11],
				[4,4,4,4,4,4,5],
				[16,16,16,16,16,16,17],
				[22,22,22,22,22,22,23],
				[-1,0,-1,-1,-1,-1,-1]
			]
			attackTimer = 0;
			attackEndTime = 90; //frames
			telegraphLength = 30;
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