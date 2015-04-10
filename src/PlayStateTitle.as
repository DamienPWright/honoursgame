package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Raujinn
	 */
	public class PlayStateTitle extends FlxState
	{
		private var titleText:String = "Honors Project Game";
		private var footerText:String  = "B00227833 v.0.02.12";
		private var selectorText:String  = ">";
		private var option1Text:String  = "TBA";
		private var option2Text:String  = "TBA";
		private var option3Text:String  = "TMX Map loader test";
		private var option4Text:String  = "Empty Room Control Test";
		
		private var currentOption:int = 0;
		private var numOptions:int = 4;
		private var option1Pos:int = 120;
		private var option2Pos:int = 130;
		private var option3Pos:int = 140;
		private var option4Pos:int = 150;
		//and so on
		private var titleFlxText:FlxText = new FlxText(FlxG.width / 2 - FlxG.width / 3, FlxG.height / 2 - FlxG.height / 4, FlxG.width, titleText);
		private var footerFlxText:FlxText = new FlxText(FlxG.width / 2, FlxG.height - 50, FlxG.width / 2, footerText);
		private var selectorFlxText:FlxText = new FlxText(FlxG.width / 4, 120, FlxG.width, selectorText);
		private var option1FlxText:FlxText = new FlxText(FlxG.width / 4 + 10, 120, FlxG.width, option1Text);
		private var option2FlxText:FlxText = new FlxText(FlxG.width / 4 + 10, 130, FlxG.width, option2Text);
		private var option3FlxText:FlxText = new FlxText(FlxG.width / 4 + 10, 140, FlxG.width, option3Text);
		private var option4FlxText:FlxText = new FlxText(FlxG.width / 4 + 10, 150, FlxG.width, option4Text);
		
		override public function create():void {
			titleFlxText.size = 16;
			footerFlxText.size = 6;
			add(titleFlxText);
			add(footerFlxText);
			add(selectorFlxText);
			add(option1FlxText);
			add(option2FlxText);
			add(option3FlxText);
			add(option4FlxText);
			GameManager.score = 0;
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
				case 1:
					selectorFlxText.y = option2Pos;
					break;
				case 2:
					selectorFlxText.y = option3Pos;
					break;
				case 3:
					selectorFlxText.y = option4Pos;
					break;
				default:
			}
			if (FlxG.keys.justPressed("ENTER")) {
				switch(currentOption) {
					case 2:
						FlxG.switchState(new TmxLevel(TmxList.levels[GameManager.curLevelXml]));
						break;
					case 3:
						FlxG.switchState(new GenericLevel());
						break;
					default:
						//do nothing
				}
			}
		}
	}

}