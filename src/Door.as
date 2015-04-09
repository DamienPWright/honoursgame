package  
{
	import org.flixel.*;
	
	public class Door extends Actor
	{
		public var seekbox:HitBox;
		public var opened:Boolean = false;
		public var destination:FlxState;
		
		public function Door(X:int, Y:int, warpto:FlxState ) 
		{
			super(X, Y);
			faction = "door";
			immovable = true;
			loadGraphic(SpriteList.sprite_fu_door, false, false, 32, 32);
			destination = warpto;
		}
		
		
		public function openDoor():void {
			frame = 1;
			solid = false;
			opened = true;
			seekbox = (FlxG.state as TmxLevel).createHitBox(x, y, 32, 8, 4, 0);
		}
		
		public override function update():void {
			super.update();
			if(opened){
				if ((FlxG.state as TmxLevel).checkHitboxActorOverlap(seekbox, (FlxG.state as TmxLevel).getPlayer())){
					(FlxG.state as TmxLevel).triggerWarp(destination);
					GameManager.goToNextLevel();
				}
			}
		}
	}

}