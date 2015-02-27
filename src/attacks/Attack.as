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
		
		public function Attack(a:Actor) 
		{
			
		}
		
		public function attackAnimUpdate(currentFrame:Number):void {
			
		}
		
		public function getDamage():int {
			return actor.attack
		}
		
	}

}