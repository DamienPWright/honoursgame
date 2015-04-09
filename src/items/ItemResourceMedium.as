package items 
{
	/**
	 * ...
	 * @author Raujinn
	 */
	public class ItemResourceMedium extends ItemResource 
	{
		
		public function ItemResourceMedium(X:Number=0, Y:Number=0) 
		{
			super(X, Y);
			
		}
		
		override public function setItem(X:Number=0, Y:Number=0):void {
			loadGraphic(SpriteList.sprite_item_capsule_m, true, false, 32, 32);
			points = 25;
			x = X;
			y = Y;
		}
	}

}