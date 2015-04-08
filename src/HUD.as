package  
{
	import org.flixel.*;
	import enemies.Enemy;
	/**
	 * ...
	 * @author Raujinn
	 */
	public class HUD extends FlxSprite
	{
		public var player:Player;
		public var level:TmxLevel;
		public var targetEnemy:Enemy;
		public var spriteContainer:FlxGroup = new FlxGroup();
		public var healthbar:FlxSprite;
		public var scoreText:FlxText;
		public var healthbarLength = 100;
		public var healthbarPos:FlxPoint = new FlxPoint(0, 0); 
		public var scoreCounterPos:FlxPoint = new FlxPoint (0, 0);
		
		public function HUD(_player:Player, _level:TmxLevel)
		{
			player = _player;
			level = _level;
			initialiseHudComponants();
		} 
		
		public function initialiseHudComponants():void {
			var camX = FlxG.camera.scroll.x;
			var camY = FlxG.camera.scroll.y;
			
			healthbar = new FlxSprite(camX + 32, camY + 4);
			healthbar.loadGraphic(SpriteList.sprite_hud_hpbar);
			healthbar.origin.x = healthbar.origin.y = 0;
			
			spriteContainer.add(healthbar);
			spriteContainer.add(new FlxSprite(camX + 0, camY + 0, SpriteList.sprite_hud_hpcontainer));
			spriteContainer.setAll("scrollFactor", new FlxPoint(0, 0));
			
			visible = false;
			
			level.add(this);
			level.add(spriteContainer);
		}
		
		public override function update():void {
			healthbar.scale.x = (player.curHp / player.maxHp) * 1;
		}
	}

}