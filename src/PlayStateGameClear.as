package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Raujinn
	 */
	public class PlayStateGameClear extends FlxState
	{
		private var titleText:String = "Congratulations!";
		private var clearText1:String = "You cleared all available content";
		private var selectorText:String  = ">";
		private var option1Text:String  = "Quit to Title";
		
		private var currentOption:int = 0;
		private var numOptions:int = 1;
		private var option1Pos:int = 120;
		//and so on
		private var titleFlxText:FlxText = new FlxText(FlxG.width / 2 - FlxG.width / 3, FlxG.height / 2 - FlxG.height / 4, FlxG.width, titleText);
		private var clearText1FlxText:FlxText = new FlxText(FlxG.width / 4, FlxG.height / 2 - FlxG.height / 3, FlxG.width, clearText1);
		private var selectorFlxText:FlxText = new FlxText(FlxG.width / 4, 120, FlxG.width, selectorText);
		private var option1FlxText:FlxText = new FlxText(FlxG.width / 4 + 10, 120, FlxG.width, option1Text);
		
		override public function create():void {
			titleFlxText.size = 16;
			add(titleFlxText);
			add(clearText1FlxText);
			add(selectorFlxText);
			add(option1FlxText);
		}
		
		override public function update():void {
			super.update();
			if (FlxG.keys.justPressed("DOWN") || FlxG.keys.justPressed("S")) {
				currentOption = currentOption + 1 < numOptions ? currentOption + 1 : 0;
			}else if (FlxG.keys.justPressed("UP") || FlxG.keys.justPressed("W")) {
				currentOption = currentOption > 0 ? currentOption - 1 : numOptions - 1;
			}
			switch(currentOption) {
				case 0:
					selectorFlxText.y = option1Pos;
					break;
				default:
			}
			if (FlxG.keys.justPressed("ENTER")) {
				switch(currentOption) {
					case 0:
						GameManager.respawnPlayer(true);
						FlxG.switchState(new PlayStateTitle());
						break;
					default:
						//do nothing
				}
			}
		}
	}

}