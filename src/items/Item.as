package items
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Raujinn
	 */
	public class Item extends FlxSprite 
	{
		
		public function Item(X:Number=0, Y:Number=0) 
		{
			super(X, Y);
			addAnimation("base", [0, 0, 0, 1], 12, true);
			play("base");
		}
		
		override public function update():void 
		{
			super.update();
			if ((FlxG.state as TmxLevel).checkItemActorOverlap(this, (FlxG.state as TmxLevel).getPlayer())) {
				onPickup();
			}
		}
		
		public function setItem(X:Number = 0, Y:Number = 0):void {
			
		}
		
		public function onPickup():void {
			kill();
			playSoundOnPickup();
		}
		
		public function playSoundOnPickup():void {
			var sound:FlxSound = FlxG.play(SoundList.snd_pickup_resource_sm);
		}
	}

}