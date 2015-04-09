package items 
{
	/**
	 * ...
	 * @author Raujinn
	 */
	public class ItemResourceSmall extends ItemResource 
	{
		
		public function ItemResourceSmall(X:Number=0, Y:Number=0) 
		{
			super(X, Y);
		}
		
		override public function setItem(X:Number=0, Y:Number=0):void {
			loadGraphic(SpriteList.sprite_item_capsule_s, true, false, 32, 32);
			points = 10;
			x = X;
			y = Y;
		}
	}

}