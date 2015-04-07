package effects 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author ...
	 */
	public class EffectGiantSlimeShriek extends AttackEffect 
	{
		
		public function EffectGiantSlimeShriek() 
		{
			super();
			hitboxArrayN = [[-8, -48, 48, 48, 1, 1]]
			hitboxArrayS = [[-8, 32, 48, 48, 1, 1]];
			hitboxArrayE = [[32, -8, 48, 48, 1, 1]]; 
			hitboxArrayW = [[-48, -8, 48, 48, 1, 1]];
			
			effectLifeSpanStart = 30;
			effectLifeSpan = effectLifeSpanStart;
			
			attackFramesLoop = true;
			attackFrames = [
				[9, 11, 13, 15],
				[8, 10, 12, 14],
				[0, 2, 4, 6],
				[1, 3, 5, 7],
				[-1,-1,0,-1]
			];
			
			initAnims();
		}
		
		override public function update():void {
			super.update();
			switch(actor.currentFacing) {
				case FlxObject.UP:
					x = actor.x - width / 4;
					y = actor.y - height;
					break;
				case FlxObject.DOWN:
					x = actor.x - width / 4;
					y = actor.y + height / 2;
					break;
				case FlxObject.LEFT:
					x = actor.x - width;
					y = actor.y - height / 4;
					break;
				case FlxObject.RIGHT:
					x = actor.x + width / 2;
					y = actor.y - height / 4;
					break;
			}
		}
	}

}