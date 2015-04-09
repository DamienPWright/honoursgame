package 
{
	import org.flixel.*;
	[SWF(width = "640", height = "480", backgroundColor = "#000000")]
	[Frame(factoryClass = "Preloader")]
		
	/**
	 * ...
	 * @author Raujinn
	 */
	public class ProceduralContentTestGame extends FlxGame
	{
		public function ProceduralContentTestGame():void 
		{
			super(320, 240, PlayStateTitle, 2);
			forceDebugger = true;
			FlxG.volume = 0.5;
		}
	}
}