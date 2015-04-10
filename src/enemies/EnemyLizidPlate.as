package enemies 
{
	import org.flixel.*;
	import states.*;
	/**
	 * ...
	 * @author Raujinn
	 */
	public class EnemyLizidPlate extends Enemy 
	{
		//private var target:Actor;
		private var immuneToDamage:Boolean = false;
		
		public function EnemyLizidPlate(X:int, Y:int, t:Actor) 
		{
			super(X, Y, t);
			
			movespeed = 10;
			loadGraphic(SpriteList.sprite_en_lizid_plate, true, false, 32, 32);
			maxHp = 5;
			curHp = maxHp;
			
			addAnimation("walk_n", [0, 1, 0, 2], 4);
			addAnimation("walk_s", [6, 7, 6, 8], 4);
			addAnimation("walk_e", [18, 19, 18, 20], 4);
			addAnimation("walk_w", [12, 13, 12, 14], 4);
			
			fsm.changeState(new EnemyLizidPlateWander(this));
		}
		
		override public function onHit(hb:HitBox):void 
		{
			
			if (target) {
				immuneToDamage = false;
				if ((currentFacing == FlxObject.UP) && (target.getMidpoint().y < getMidpoint().y + 8)) {
					immuneToDamage = true;
				}
				if ((currentFacing == FlxObject.DOWN) && (target.getMidpoint().y > getMidpoint().y - 8)) {
					immuneToDamage = true;
				}
				if ((currentFacing == FlxObject.LEFT) && (target.getMidpoint().x < getMidpoint().x + 8)) {
					immuneToDamage = true;
				}
				if ((currentFacing == FlxObject.RIGHT) && (target.getMidpoint().x > getMidpoint().x - 8)) {
					immuneToDamage = true;
				}
				
			}
			if (immuneToDamage) {
				//play immune sound
				var snd:FlxSound = FlxG.play(SoundList.snd_combat_invuln);
			}else{
				super.onHit(hb);
			}
		}
	}

}