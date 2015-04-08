package {
	import org.flixel.*;
	
	public class GameManager {
		public static var player:Player = new Player(0, 0);
		public static var playerMapStart:FlxPoint = new FlxPoint(0, 0);
		public static var playerCurHp:int = 0;
		
		public static var score = 0;
		
		public static function initPlayer(x, y){
			playerMapStart.x = x;
			playerMapStart.y = y;
			player.x = x;
			player.y = y;
			playerCurHp = player.curHp;
			return player;
		}
		public static function respawnPlayer(reset:Boolean = false):void {
			player.x = playerMapStart.x;
			player.y = playerMapStart.y;
		}
		
		public static function updateScore(pts:int):void {
			score += pts;
		}
	}
	
}