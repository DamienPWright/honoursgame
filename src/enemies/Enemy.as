package enemies {
	import org.flixel.*;
	import items.*;
	import states.EnemyWander;
	public class Enemy extends Actor {
		
		protected var target:Actor;
		protected var dir:int;
		protected var dropList:Array;
		
		public function Enemy(X:int, Y:int, t:Actor) {
			super(X, Y);
			target = t;
			movespeed = 25;
			loadGraphic(SpriteList.sprite_en_giantslime , true, false, 32, 32);
			
			fsm.changeState(new EnemyWander(this, target));
			faction = "enemy";
			
			onHitSound = SoundList.snd_combat_enemy_hit;
		}
		
		public override function update():void {
			super.update();
		}
		
		public function setTarget(newtarget:Actor):void {
			target = newtarget;
		}
		
		public function getTarget():Actor {
			return target;
		}
		
		override public function onHit(hb:HitBox):void 
		{
			super.onHit(hb);
		}
		
		override public function onDeath():void 
		{
			dropItem();
			super.onDeath();
		}
		
		public function dropItem():void {
			var itm:Class;
			var roll:Number = 0;
			
			roll = Math.round(Math.random() * 100);
			trace(roll);
			if (roll < 5) {
				itm = ItemResourceLarge;
			}else if (roll < 25) {
				itm = ItemResourceMedium;
			}else if (roll < 45) {
				itm = ItemResourceSmall;
			}else if (roll < 95) {
				itm = null; //Drop nothing.
			}else {
				itm = ItemHeart;
			}
			if(itm){
				(FlxG.state as TmxLevel).spawnItemFromClass(itm, x, y);
			}
		}
	}
}