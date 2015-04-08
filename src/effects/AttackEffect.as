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
		
		public function playAnim():void {
			var d = "";
			//anim
			switch(actor.currentFacing) {
				case FlxObject.UP:
					d = "n";
					break;
				case FlxObject.DOWN:
					d = "s";
					break;
				case FlxObject.RIGHT:
					d = "e";
					break;
				case FlxObject.LEFT:
					d = "w";
					break;
			}
			//trace(frameCount);
			play(d, true);
		}
		
		protected function initAnims():void {
			addAnimation("n", attackFrames[0], 30, attackFramesLoop);
			addAnimation("s", attackFrames[1], 30, attackFramesLoop);
			addAnimation("e", attackFrames[2], 30, attackFramesLoop);
			addAnimation("w", attackFrames[3], 30, attackFramesLoop);
			trace("anims init");
		}
		
		override public function update():void {
			super.update();
			//effect anim
			if (frameCount >= attackFrames[0].length){
				if (attackFramesLoop) {
					frameCount = 0;
				}else {
					frameCount = attackFrames[0].length - 1;
				}
			}
			
			if (!(frameCount >= attackFrames[0].length)) {
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
			//updateAnimation();
			//trace(this);
			frameCount += 1;
		}
	}

}