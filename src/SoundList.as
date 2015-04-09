package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Raujinn
	 */
	public class SoundList 
	{
		[Embed(source = "assets/snd/itmPickupResourceSM.mp3")] static public var snd_pickup_resource_sm:Class;
		[Embed(source = "assets/snd/itemPickupResourceLarge.mp3")] static public var snd_pickup_resource_l:Class;
		[Embed(source = "assets/snd/itmHealth.mp3")] static public var snd_pickup_health:Class;
		[Embed(source = "assets/snd/swordslash.mp3")] static public var snd_combat_sword_slash:Class;
		[Embed(source = "assets/snd/cmbPlayerHit.mp3")] static public var snd_combat_player_hit:Class;
		[Embed(source = "assets/snd/cmbEnemyHit.mp3")] static public var snd_combat_enemy_hit:Class;
		[Embed(source = "assets/snd/cmbStomp.mp3")] static public var snd_combat_stomp:Class;
		
		public function SoundList() 
		{
			
		}
		
	}

}