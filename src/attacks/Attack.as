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
		
		public function Attack(a:Actor) 
		{
			actor = a;
		}
		
		public function attackAnimUpdate(currentFrame:Number):void {
			
		}
		
		public function getDamage():int {
			return actor.attack
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