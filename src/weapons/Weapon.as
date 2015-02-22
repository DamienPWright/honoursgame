package weapons 
{
	import attacks.PlayerAttackSword;
	import org.flixel.*;
	
	public class Weapon 
	{
		private var wielder:Actor;
		private var weaponAnimHandler:PlayerAttackSword;
		
		//stat values here
		public var attack:int;
		public var slashingDmg:int;
		public var piercingDmg:int;
		public var bluntDmg:int;
		public var magicDmg:int;
		public var element:int;
		
		public function Weapon(a:Actor) 
		{
			wielder = a;
			weaponAnimHandler = new PlayerAttackSword(wielder);
		}
		
		public function update():void {
			weaponAnimHandler.update();
		}
		
		public function getWeaponAttackAnimComplete():Boolean {
			var b = weaponAnimHandler.getAttackComplete();
			return b;
		}
		
		public function resetAnims():void {
			weaponAnimHandler.resetAnims();
		}
		
		public function exit():void {
			weaponAnimHandler.exit();
		}
	}

}