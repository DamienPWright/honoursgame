package items 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Raujinn
	 */
	public class ItemResource extends Item
	{
		protected var points:int = 0;
		public function ItemResource(X:Number=0, Y:Number=0) 
		{
			super(X, Y);
		}
		
		override public function onPickup():void 
		{
			updateScoreFromItem();
			super.onPickup();
		}
		
		protected function updateScoreFromItem():void {
			GameManager.updateScore(points);
		}
	}

}