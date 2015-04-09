package items 
{
	/**
	 * ...
	 * @author Raujinn
	 */
	public class ItemResourceCircuitBoard extends ItemResource 
	{
		
		public function ItemResourceCircuitBoard(X:Number=0, Y:Number=0) 
		{
			super(X, Y);
			
		}
		
		override public function setItem(X:Number=0, Y:Number=0):void {
			loadGraphic(SpriteList.sprite_item_board, true, false, 32, 32);
			points = 75;
			x = X;
			y = Y;
		}
	}

}