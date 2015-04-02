package effects 
{
	/**
	 * ...
	 * @author ...
	 */
	public class AttackEffect extends Effect 
	{
		protected var attackFrames:Array;
		protected var hitboxArrayN:Array;
		protected var hitboxArrayS:Array;
		protected var hitboxArrayE:Array;
		protected var hitboxArrayW:Array;
		protected var hitboxArrayPos:int = 0;
		protected var actor:Actor;
		
		public function AttackEffect() 
		{
			super();	
		}
		
		public function setActor(a:Actor):void {
			actor = a;
		}
		
		override public function update():void {
			super.update();
		}
	}

}