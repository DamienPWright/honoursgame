package {
		import org.flixel.*
		
		public class GenericLevel extends FlxState {
			var player:Player;
			var debugText:FlxText;
			
			override public function create():void { 
				super.create();
				player = new Player(50, 50);
				
				//FlxG.camera.follow(player, FlxCamera.STYLE_TOPDOWN_TIGHT);
				initDebug();
				add(player);
			}
			
			override public function update():void {
				super.update();
				updateDebug();
			}
			
			private function initDebug():void {
				debugText = new FlxText (10, 10, 200, "Debug Active");
				add (debugText);
			}
			
			private function updateDebug():void {
				//just update any debug text. 
				debugText.text = "X: " + String(Math.floor(player.x)) + " Y: " + String(Math.floor(player.y)) + "\n" + "Facing: " + String(player.currentFacing);
				
			}
		}
}