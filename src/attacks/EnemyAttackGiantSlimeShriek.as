package attacks 
{
	import org.flixel.*;
	import effects.*;
	/**
	 * ...
	 * @author Raujinn
	 */
	public class EnemyAttackGiantSlimeShriek extends Attack 
	{
		
		
		public function EnemyAttackGiantSlimeShriek(a:Actor) 
		{
			super(a);
			effectsList = [
				[EffectGiantSlimeShriek,SpriteList.sprite_eff_giantslime_shriek, true, false, 64, 64]
			]
			telegraphAnimLoop = false;
			telegraphAnimFrames = [
				[2],
				[7],
				[12],
				[17],
				[-1]
			]
			attackAnimFramesLoop = false;
			attackAnimFrames = [
				[3,3],
				[8,8],
				[13,13],
				[18,18],
				[0,-1]
			]
			attackTimer = 0;
			attackEndTime = 90; //frames
			telegraphLength = 45;
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
		
		override public function getAttackComplete():Boolean {
			return attackComplete;
		}
		
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