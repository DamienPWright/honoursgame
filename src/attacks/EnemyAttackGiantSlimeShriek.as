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
			effectanim = [
				[9, 11, 13, 15],
				[8, 10, 12, 14],
				[0, 2, 4, 6],
				[1, 3, 5, 7]
			];
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
				[-1,0]
			]
			attackTimer = 0;
			attackEndTime = 90; //frames
			attackComplete = false;
			resetAnims();
		}
		
		override public function update():void
		{
			
			var curanim = [];
			var curanimloop = false;
			
			if (attackTimer < telegraphLength) {
				curanim = telegraphAnimFrames;
				curanimloop = telegraphAnimLoop;
			}else {
				curanim = attackAnimFrames;
				curanimloop = attackAnimFramesLoop;
			}
			if (attackTimer == telegraphLength) {
				currentFrame = 0;
			}
			
			var d = 0;
			
			switch(actor.currentFacing) {
				case FlxObject.UP:
					d = 1;
					effect.x = actor.x - effect.width / 4;
					effect.y = actor.y - effect.height;
					break;
				case FlxObject.DOWN:
					d = 0;
					effect.x = actor.x - effect.width / 4;
					effect.y = actor.y + effect.height / 2;
					break;
				case FlxObject.LEFT:
					d = 2;
					effect.x = actor.x - effect.width;
					effect.y = actor.y - effect.height / 4;
					break;
				case FlxObject.RIGHT:
					d = 3;
					effect.x = actor.x + effect.width / 2;
					effect.y = actor.y - effect.height / 4;
					break;
			}
			trace(d);
			if (currentFrame > curanim[0].length) {
				if (curanimloop) {
					currentFrame = 0;
				}else{
					currentFrame = curanim[0].length;
				}
			}
			actor.frame = curanim[d][currentFrame];
			if (curanim[4][currentFrame] != -1) {
				(FlxG.state as TmxLevel).recycleEffectClass(EffectGiantSlimeShriek,actor,this,SpriteList.sprite_eff_giantslime_shriek, true, false, 64, 64);
			}
			currentFrame += 1;
			attackTimer += 1;
			if (attackTimer > attackEndTime) {
				attackComplete = true;
			}
			
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
			effect = (FlxG.state as TmxLevel).recycleEffectClass(EffectGiantSlimeShriek,actor,this,SpriteList.sprite_eff_giantslime_shriek, true, false, 64, 64);
		}
		
		override public function exit():void {
			attackTimer = 0;
			effect.kill();
		}
	}

}