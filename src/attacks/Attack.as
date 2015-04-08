package attacks 
{
	import org.flixel.*;
	import effects.Effect;
	public class Attack extends FlxSprite
	{
		protected var actor:Actor;
		protected var actoranim:Array;
		protected var attackanim:Array;
		protected var effectanim:Array;
		protected var attackTimer:Number;
		protected var attackEndTime:Number;
		protected var attackCurFrame:Number = 0;
		protected var attackPrevFrame:Number = 0;
		protected var attackComplete:Boolean;
		protected var effect:Effect;
		//new system
		protected var effectsList:Array;
		protected var telegraphAnimFrames:Array;
		protected var telegraphAnimLoop:Boolean = false;
		protected var attackAnimFrames:Array;
		protected var attackAnimFramesLoop:Boolean = false;
		protected var attackAnimLength:int = 0;
		protected var telegraphAnimLength:int = 0;
		protected var curanim:Array;
		protected var curanimloop = false;
		
		protected var currentFrame:int = 0;
		protected var endFrame:int = 0;
		protected var telegraphFrame:int = 0;
		protected var attackFrame:int = 1;
		protected var telegraphLength:int = 0;
		
		private var attackMod:Number = 1.0;
		
		public function Attack(a:Actor) 
		{
			actor = a;
		}
		
		override public function update():void {
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
			//trace(curanim);
			var d = 0;
			
			switch(actor.currentFacing) {
				case FlxObject.UP:
					d = 1;
					break;
				case FlxObject.DOWN:
					d = 0;
					break;
				case FlxObject.LEFT:
					d = 2;
					break;
				case FlxObject.RIGHT:
					d = 3;
					break;
			}
			//trace(d);
			if (currentFrame >= curanim[0].length) {
				if (curanimloop) {
					currentFrame = 0;
				}else{
					currentFrame = curanim[0].length - 1;
				}
			}
			
			actor.frame = curanim[d][currentFrame];
			//trace("curframe:" + curanim[d][currentFrame]);
			if ((curanim[4][currentFrame] != -1) && (curanim[4][currentFrame] != undefined)) {
				var eff = curanim[4][currentFrame];
				//trace("created");
				(FlxG.state as TmxLevel).recycleEffectClass(effectsList[eff][0],actor,this,effectsList[eff][1], effectsList[eff][2], effectsList[eff][3], effectsList[eff][4], effectsList[eff][5]);
			}
			currentFrame += 1;
			attackTimer += 1;
			if (attackTimer > attackEndTime) {
				attackComplete = true;
			}
		}
		
		public function attackAnimUpdate(currentFrame:Number):void {
			
		}
		
		public function getDamage():int {
			return actor.attack * attackMod;
		}
		
		public function getAttackComplete():Boolean {
			return attackComplete;
		}
		
		public function resetAnims():void {
			attackTimer = 0;
			attackCurFrame = 0;
			attackPrevFrame = 0;
			attackComplete = false;
		}
		
		public function exit():void {
			attackTimer = 0;
			if(effect != null){
				effect.kill();
			}
		}
	}

}