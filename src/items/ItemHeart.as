package items 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Raujinn
	 */
	public class ItemHeart extends Item 
	{
		private var recoverAmount:int = 20;
		
		public function ItemHeart(X:Number=0, Y:Number=0) 
		{
			super(X, Y);
			
		}
		
		override public function setItem(X:Number=0, Y:Number=0):void {
			loadGraphic(SpriteList.sprite_item_heart, true, false, 32, 32);
			x = X;
			y = Y;
		}
		
		override public function onPickup():void {
			GameManager.healPlayer(recoverAmount);
			super.onPickup();
		}
		
		override public function playSoundOnPickup():void {
			var sound:FlxSound = FlxG.play(SoundList.snd_pickup_health);
		}
	}

}