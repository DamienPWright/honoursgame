package effects 
{
	/**
	 * ...
	 * @author Raujinn
	 */
	public class EffectPlayerSword extends AttackEffect 
	{
		
		public function EffectPlayerSword() 
		{
			super();
			
			hitboxArrayN = [[-32, -24, 96, 48, 2, 1]]
			hitboxArrayS = [[-32, 24, 96, 48, 2, 1]];
			hitboxArrayE = [[24, -32, 48, 96, 2, 1]]; 
			hitboxArrayW = [[-24, -32, 48, 96, 2, 1]];

			effectLifeSpanStart = 15;
			effectLifeSpan = effectLifeSpanStart;
			
			attackFramesLoop = false;
			
			attackFrames = [
				[4,4,5,6,7,7,7,7],
				[0,0,1,2,3,3,3,3],
				[12,12,13,14,15,15,15],
				[8, 8, 9, 10, 11, 11, 11, 11],
				[ -1, -1, -1, -1, 0, -1, -1, -1]
			]
		}
		
		override public function update():void {
			super.update();
			x = actor.x - (width / 3) - 6;
			y = actor.y - (height / 3);
		}
	}

}