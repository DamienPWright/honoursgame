package effects 
{
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
			
			attackFramesLoop = true;
			attackFrames = [
				[9, 11, 13, 15],
				[8, 10, 12, 14],
				[0, 2, 4, 6],
				[1, 3, 5, 7],
				[-1,-1,0,-1]
			];
		}
		
	}

}