package  
{
	import org.flixel.*;
	public class HitBox extends FlxSprite
	{
		private var timeAlive:int = 0;
		private var lifeSpanInFrames:int = 0;
		private var drawHitbox:Boolean = false;
		
		public function HitBox(draw:Boolean=true) 
		{
			super(0, 0);
			width = 1;
			height = 1;
			lifeSpanInFrames = 1;
			drawHitbox = draw;
			makeHitBox(drawHitbox);
		}
		
		override public function update():void {
			super.update();
			
			timeAlive++;
			if (timeAlive >= lifeSpanInFrames) {
				timeAlive = 0;
				kill();
			}
		}
		
		public function resetHitBox(X:Number, Y:Number, _width:uint, _height:uint, lifeSpan:int=1):void {
			reset(X, Y);
			width = _width;
			height = _height;
			lifeSpanInFrames = lifeSpan;
			makeHitBox(drawHitbox);
		}
		
		private function makeHitBox(draw:Boolean) {
			if(draw){
				makeGraphic(width, height, 0xffff0000);
			}
		}
	}
}