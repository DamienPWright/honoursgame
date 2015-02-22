package attacks {
	import effects.Effect;
	import org.flixel.*;
	
	public class PlayerAttackSword extends FlxSprite {
		private var actor:Actor;
		private var actoranim:Array;
		private var attackanim:Array;
		private var effectanim:Array;
		private var attackTimer:Number;
		private var attackEndTime:Number;
		private var attackComplete:Boolean;
		private var effect:Effect;
		
		public function PlayerAttackSword(a:Actor) {
			//this class will handle the animation for a given attack
			//A weapon will have an animation and attempt to sync up with
			//the actor's animation.
			actor = a;
			//in future these could be loaded from JSON files
			addAnimation("N", [], 12, false);
			addAnimation("S", [], 12, false);
			addAnimation("E", [], 12, false);
			addAnimation("W", [], 12, false);

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
			
			effect.x = actor.x - (effect.width / 3);
			effect.y = actor.y - (effect.height / 3);
			
			if (currentFrame == 2) {
				(FlxG.state as TmxLevel).createHitBox(actor.x, actor.y, 32, 32);
			}
			
			attackTimer += FlxG.elapsed;
			
			if (attackTimer > attackEndTime) {
				attackComplete = true;
			}
		}
		
		public function getAttackComplete():Boolean {
			return attackComplete;
		}
		
		public function resetAnims():void {
			attackTimer = 0;
			attackComplete = false;
			//generate effect
			effect = (FlxG.state as TmxLevel).recycleEffect(SpriteList.sprite_eff_sword_slash, true, false, 96, 96);
		}
		
		public function exit():void {
			attackTimer = 0;
			effect.kill();
		}
	}
}