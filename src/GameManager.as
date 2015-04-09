package {
	import org.flixel.*;
	import states.PlayerIdle;
	
	public class GameManager {
		public static var player:Player = new Player(0, 0);
		public static var playerMapStart:FlxPoint = new FlxPoint(0, 0);
		public static var playerCurHp:int = 0;
		public static var playerMaxHp:int = 0;
		public static var curLevelXml:int = 0;
		public static var nextLevel:int = 0;
		
		public static var score = 0;
		
		public static function getNextLevel():Class {
			nextLevel = curLevelXml + 1;
			if (nextLevel >= TmxList.levels.length) {
				//game complete!
			}else {
				return TmxList.levels[nextLevel];
			}
			return TmxList.levels[0];
		}
		
		public static function goToNextLevel():void {
			curLevelXml = nextLevel;
		}
		
		public static function initPlayer(x, y){
			playerMapStart.x = x;
			playerMapStart.y = y;
			player.x = x;
			player.y = y;
			playerCurHp = player.curHp;
			playerMaxHp = player.maxHp;
			return player;
		}
		
		public static function respawnPlayer(reset:Boolean = false):void {
			if(!reset){
				player.x = playerMapStart.x;
				player.y = playerMapStart.y;
				FlxG.switchState(new TmxLevel(TmxList.levels[curLevelXml]));
				
			}
			player.curHp = playerMaxHp;
			player.exists = true;
			var playerfsm = player.getStateMachine();
			playerfsm.changeState(new PlayerIdle(player));
		}
		
		public static function healPlayer(heal:int):void {
			playerCurHp += heal;
			trace("heal: " + heal);
			trace("playerCurHp " + playerCurHp);
			if (playerCurHp > playerMaxHp) {
				playerCurHp = playerMaxHp;
			}
			player.curHp = playerCurHp;
		}
		
		public static function updateScore(pts:int):void {
			score += pts;
		}
		
		public static function update():void {
			playerCurHp = player.curHp;
			//check if player dead
			if (player.curHp <= 0) {
				FlxG.switchState(new PlayStateGameOver());
			}
		}
		
		public static function loadGame():void {
			
		}
		
		public static function saveGame():void {
			
		}
	}
	
}