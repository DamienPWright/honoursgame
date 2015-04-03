package effects {
	import org.flixel.*;
	
	public class Effect extends FlxSprite {
		protected var frameCount = 0;
		protected var effectLifeSpan = 0;
		protected var effectLifeSpanStart = 0;
		protected var persistsOnActorDeath = false;
		protected var actor:Actor;
		
		public function Effect() {
			super(0, 0);
		}
		
		override public function update():void 
		{
			super.update();
			effectLifeSpan -= 1;
			
			if (effectLifeSpan <= 0) {
				killEffect();
			}
			if (actor) {
				if (!actor.exists && !persistsOnActorDeath) {
					killEffect();
				}
			}
		}
		
		protected function killEffect() {
			effectLifeSpan = effectLifeSpanStart;
			frameCount = 0;
			kill();
			trace("killed");
		}
	}
}