package effects 
{
	import attacks.Attack;
	import org.flixel.*;
	/**
	 * ...
	 * @author ...
	 */
	public class AttackEffect extends Effect 
	{
		protected var attackFrames:Array;
		protected var attackFramesLoop:Boolean;
		protected var hitboxArrayN:Array;
		protected var hitboxArrayS:Array;
		protected var hitboxArrayE:Array;
		protected var hitboxArrayW:Array;
		protected var hitboxArrayPos:int = 0;
		protected var attack:Attack;
		
		public function AttackEffect() 
		{
			super();	
		}
		
		public function setActor(a:Actor):void {
			actor = a;
		}
		
		public function setAttack(atk:Attack):void {
			attack = atk;
		}
		
		override public function update():void {
			super.update();
			var anim = "";
			//effect anim
			if (frameCount >= attackFrames[0].length){
				if (attackFramesLoop) {
					frameCount = 0;
				}else {
					frameCount = attackFrames[0].length - 1;
				}
			}
			
			if (!(frameCount >= attackFrames[0].length)) {
				var d = 0;
				//anim
				switch(actor.currentFacing) {
					case FlxObject.UP:
						d = 0;
						break;
					case FlxObject.DOWN:
						d = 1;
						break;
					case FlxObject.RIGHT:
						d = 3;
						break;
					case FlxObject.LEFT:
						d = 2;
						anim = "l";
						break;
				}
				trace(frameCount);
				frame = attackFrames[d][frameCount];
				if (attackFrames[4][frameCount] != -1) {
					//trace("generate effect");
					var hb = attackFrames[4][frameCount];
					var hba = [];
					switch(actor.currentFacing) {
						case FlxObject.UP:
							hba = hitboxArrayN[hb]
							break;
						case FlxObject.DOWN:
							hba = hitboxArrayS[hb]
							break;
						case FlxObject.RIGHT:
							hba = hitboxArrayE[hb]
							break;
						case FlxObject.LEFT:
							hba = hitboxArrayW[hb]
							break;
					}
					(FlxG.state as TmxLevel).createHitBoxAttack(attack, actor.x + hba[0], actor.y + hba[1], hba[2], hba[3], hba[4], hba[5]); 
				}
			}
			frameCount += 1;
		}
	}

}