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
			attackTimer += 1
			effect.frame = 16;
			if (attackTimer < telegraphLength) {
				currentFrame = telegraphFrame;
			}else {
				currentFrame = attackFrame;
			}
			switch(actor.currentFacing) {
				case FlxObject.UP:
					actor.frame = actoranim[1][currentFrame];
					effect.x = actor.x - effect.width / 4;
					effect.y = actor.y - effect.height;
					break;
				case FlxObject.DOWN:
					actor.frame = actoranim[0][currentFrame];
					effect.x = actor.x - effect.width / 4;
					effect.y = actor.y + effect.height / 2;
					break;
				case FlxObject.LEFT:
					actor.frame = actoranim[2][currentFrame];
					effect.x = actor.x - effect.width;
					effect.y = actor.y - effect.height / 4;
					break;
				case FlxObject.RIGHT:
					actor.frame = actoranim[3][currentFrame];
					effect.x = actor.x + effect.width / 2;
					effect.y = actor.y - effect.height / 4;
					break;
			}
			
			if(attackTimer > telegraphLength){ 
				switch(actor.currentFacing) {
					case FlxObject.UP:
					effect.x = actor.x - effect.width / 4;
					effect.y = actor.y - effect.height;
					effect.frame = effectanim[0][attackTimer % 4];
					break;
				case FlxObject.DOWN:
					effect.x = actor.x - effect.width / 4;
					effect.y = actor.y + effect.height / 2;
					effect.frame = effectanim[1][attackTimer % 4];
					break;
				case FlxObject.LEFT:
					effect.x = actor.x - effect.width;
					effect.y = actor.y - effect.height / 4;
					effect.frame = effectanim[2][attackTimer % 4];
					break;
				case FlxObject.RIGHT:
					effect.x = actor.x + effect.width / 2;
					effect.y = actor.y - effect.height / 4;
					effect.frame = effectanim[3][attackTimer % 4];
					break;
				}
				
			}
			
			if((attackTimer % 12 == 0) && (attackTimer > telegraphLength) && (attackTimer < attackEndTime)){
				switch(actor.currentFacing) {
					case FlxObject.UP:
						(FlxG.state as TmxLevel).createHitBoxAttack(this, actor.x-8, actor.y-48, 48, 48, 1, 1);
						break;
					case FlxObject.DOWN:
						(FlxG.state as TmxLevel).createHitBoxAttack(this, actor.x-8, actor.y+32, 48, 48, 1, 1);
						break;
					case FlxObject.LEFT:
						(FlxG.state as TmxLevel).createHitBoxAttack(this, actor.x-48, actor.y-8, 48, 48, 1, 1);
						break;
					case FlxObject.RIGHT:
						(FlxG.state as TmxLevel).createHitBoxAttack(this, actor.x+32, actor.y-8, 48, 48, 1, 1);
						break;
				}
				
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
			effect = (FlxG.state as TmxLevel).recycleEffectClass(EffectGiantSlimeShriek,SpriteList.sprite_eff_giantslime_shriek, true, false, 64, 64);
		}
		
		override public function exit():void {
			attackTimer = 0;
			effect.kill();
		}
	}

}