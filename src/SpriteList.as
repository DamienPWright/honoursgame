package  
{
	/**
	 * ...
	 * @author Raujinn
	 */
	public class SpriteList 
	{
		[Embed(source = "assets/img/sprite_player_b.png")] static public var sprite_player:Class;
		
		//effects
		[Embed(source = "assets/img/eff_sword_slash.png")] static public var sprite_eff_sword_slash:Class;
		[Embed(source = "assets/img/eff_giantslime_shriek.png")] static public var sprite_eff_giantslime_shriek:Class;
		
		//enemies
		[Embed(source = "assets/img/sprite_en_giantslime.png")] static public var sprite_en_giantslime:Class;
		[Embed(source = "assets/img/sprite_en_slime.png")] static public var sprite_en_slime:Class;
		[Embed(source = "assets/img/sprite_en_lizid.png")] static public var sprite_en_lizid:Class;
		[Embed(source = "assets/img/sprite_en_tachibot.png")] static public var sprite_en_tachibot:Class;
		
		//furniture
		[Embed(source = "assets/img/door.png")] static public var sprite_fu_door:Class;

	}

}