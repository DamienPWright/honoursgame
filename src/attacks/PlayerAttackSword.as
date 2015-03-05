package attacks {
	import effects.Effect;
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
			
			attackTimer = 0;
			attackEndTime = 0.25; //seconds
			attackComplete = false;
		}
		
		override public function update():void
		{
			var currentFrame = Math.floor(attackTimer / 0.0333); //0.0833
			
			if (attackPrevFrame != currentFrame) {
				attackAnimUpdate(currentFrame);
				attackPrevFrame = currentFrame;
			}
			
			//anim
			switch((actor as Player).currentFacing) {
				case FlxObject.UP:
					actor.frame = actoranim[0][currentFrame];
					effect.frame = effectanim[0][currentFrame];
					break;
				case FlxObject.DOWN:
					actor.frame = actoranim[1][currentFrame];
					effect.frame = effectanim[1][currentFrame];
					break;
				case FlxObject.LEFT:
					actor.frame = actoranim[2][currentFrame];
					effect.frame = effectanim[2][currentFrame];
					break;
				case FlxObject.RIGHT:
					actor.frame = actoranim[3][currentFrame];
					effect.frame = effectanim[3][currentFrame];
					break;
			}
			effect.x = actor.x - (effect.width / 3) - 6;
			effect.y = actor.y - (effect.height / 3);
			
			
			attackTimer += FlxG.elapsed;
			
			if (attackTimer > attackEndTime) {
				attackComplete = true;
			}
		}
		
		override public function attackAnimUpdate(currentFrame:Number):void {
			
			
			
			
			if (currentFrame == 2) {
				switch((actor as Player).currentFacing) {
					case FlxObject.UP:
						(FlxG.state as TmxLevel).createHitBoxAttack(this, actor.x-32, actor.y-24, 96, 48, 2, 1);
						break;
					case FlxObject.DOWN:
						(FlxG.state as TmxLevel)..createHitBoxAttack(this, actor.x-32, actor.y+24, 96, 48, 2, 1);
						break;
					case FlxObject.LEFT:
						(FlxG.state as TmxLevel)..createHitBoxAttack(this, actor.x-24, actor.y-32, 48, 96, 2, 1);
						break;
					case FlxObject.RIGHT:
						(FlxG.state as TmxLevel)..createHitBoxAttack(this, actor.x+24, actor.y-32, 48, 96, 2, 1);
						break;
				}
				
			}
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
			effect = (FlxG.state as TmxLevel).recycleEffect(SpriteList.sprite_eff_sword_slash, true, false, 96, 96);
		}
		
		override public function exit():void {
			attackTimer = 0;
			effect.kill();
		}
	}
}