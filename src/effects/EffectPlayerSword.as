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
			
			hitboxArrayN = [[-40, -24, 96, 48, 2, 1]]
			hitboxArrayS = [[-40, 12, 96, 48, 2, 1]];
			hitboxArrayE = [[12, -32, 48, 96, 2, 1]]; 
			hitboxArrayW = [[-32, -32, 48, 96, 2, 1]];

			effectLifeSpanStart = 15;
			effectLifeSpan = effectLifeSpanStart;
			
			attackFramesLoop = false;
			
			attackFrames = [
				[4,4,5,6,7,7,7,7],
				[0, 0, 1, 2, 3, 3, 3, 3],
				[8, 8, 9, 10, 11, 11, 11, 11],
				[12,12,13,14,15,15,15],
				[ -1, -1, -1, -1, 0, -1, -1, -1]
			]
			
			soundFrames = [0]
			
			soundArray = [SoundList.snd_combat_sword_slash]
			initAnims();
		}
		
		override public function update():void {
			super.update();
			x = actor.x - (width / 3) - 6;
			y = actor.y - (height / 3);
		}
	}

}