package items 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Raujinn
	 */
	public class ItemResourceLarge extends ItemResource 
	{
		
		public function ItemResourceLarge(X:Number=0, Y:Number=0) 
		{
			super(X, Y);
			
		}
		
		override public function setItem(X:Number=0, Y:Number=0):void {
			loadGraphic(SpriteList.sprite_item_capsule_l, true, false, 32, 32);
			points = 75;
			x = X;
			y = Y;
		}
		
		override public function playSoundOnPickup():void {
			var sound:FlxSound = FlxG.play(SoundList.snd_pickup_resource_l);
		}
	}

}