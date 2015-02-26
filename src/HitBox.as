package  
{
	import org.flixel.*;
	public class HitBox extends FlxSprite
	{
		private var timeAlive:int = 0;
		private var lifeSpanInFrames:int = 0;
		private var drawHitbox:Boolean = false;
		private var parity:int = 0;
		
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
			if(lifeSpanInFrames != 0){
				if (timeAlive >= lifeSpanInFrames) {
					timeAlive = 0;
					kill();
				}
			}
		}
		
		/**
		 * Use to initialise a hitbox object
		 * @param	X	The x position of the hitbox
		 * @param	Y	The y position of the hitbox
		 * @param	_width	The width of the hitbox in pixels
		 * @param	_height	The height of the hitbox in pixels
		 * @param	lifeSpan	Number of frames the hitbox will persist for. Use 0 for infinite. 
		 */
		public function resetHitBox(X:Number, Y:Number, _width:uint, _height:uint, _parity:int = 0,lifeSpan:int=1):void {
			reset(X, Y);
			width = _width;
			height = _height;
			parity = _parity;
			lifeSpanInFrames = lifeSpan;
			makeHitBox(drawHitbox);
		}
		
		/**
		 * Use to update the hitbox position
		 * @param	X
		 * @param	Y
		 */
		public function setHitBoxPos(X:Number, Y:Number) {
				x = X;
				y = Y;
		}
		
		/**
		 * Draws a hitbox if draw is set to true. Otherwise it's invisible.
		 * @param	draw
		 */
		private function makeHitBox(draw:Boolean):void {
			if(draw){
				makeGraphic(width, height, 0xffff0000);
			}
		}
		
		public function killHitBox():void{
			kill();
		}
		/**
		 * Sets the parity of the hitbox. Determines what things the hitbox interacts with 
		 * @param newparity		0: No target.1: Can hit player. 2: Can hit enemies. 3: Can hit all actors
		 */
		public function setParity(newparity:int):void {
			parity = newparity;
		}
		/**
		 * Gets the parity of the hitbox. 
		 * 0: No target.1: Can hit player. 2: Can hit enemies. 3: Can hit all actors
		 */
		public function getParity():int{
			return parity;
		}
	}
}