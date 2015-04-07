package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Raujinn
	 */
	public class HUD 
	{
		public player:Player;
		
		public healthbarLength = 100;
		public healthbarPos:FlxPoint = new FlxPoint(0, 0); 
		public scoreCounterPos:FlxPoint = new FlxPoint (0, 0);
		
		public function HUD(_player:Player)
		{
			player = _player;
		} 
		
	}

}