package effects 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Raujinn
	 */
	public class EffectSlimeSlap extends AttackEffect 
	{
		
		public function EffectSlimeSlap() 
		{
			super();
			hitboxArrayN = [[0, -16, 16, 16, 1, 1]]
			hitboxArrayS = [[0, 16, 16, 16, 1, 1]];
			hitboxArrayE = [[16, 0, 16, 16, 1, 1]]; 
			hitboxArrayW = [[-16, 0, 16, 16, 1, 1]];
			
			effectLifeSpanStart = 6;
			effectLifeSpan = effectLifeSpanStart;
			
			attackFramesLoop = false;
			attackFrames = [
				[0, 1],
				[0, 1],
				[0, 1],
				[0, 1],
				[0,-1]
			];
			
			soundFrames = [0]
			
			soundArray = [SoundList.snd_combat_slime_jump];
			
			initAnims();
		}
		
		
		override public function update():void {
			super.update();
			switch(actor.currentFacing) {
				case FlxObject.UP:
					x = actor.getMidpoint().x - width / 2;
					y = actor.getMidpoint().y - height;
					break;
				case FlxObject.DOWN:
					x = actor.getMidpoint().x - width / 2;
					y = actor.getMidpoint().y;
					break;
				case FlxObject.LEFT:
					x = actor.getMidpoint().x - width;
					y = actor.getMidpoint().y - height / 2;
					break;
				case FlxObject.RIGHT:
					x = actor.getMidpoint().x; 
					y = actor.getMidpoint().y - height / 2;
					break;
			}
		}
	}

}