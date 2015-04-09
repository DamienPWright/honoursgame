package effects {
	import org.flixel.*;
	
	public class Effect extends FlxSprite {
		protected var frameCount = 0;
		protected var effectLifeSpan = 0;
		protected var effectLifeSpanStart = 0;
		protected var persistsOnActorDeath = false;
		protected var actor:Actor;
		protected var soundFrames:Array = [ -1];
		protected var soundArray:Array;
		
		public function Effect() {
			super(0, 0);
		}
		
    	override public function update():void {
			super.update();
			
			if (frameCount < soundFrames.length){
				if(soundFrames[frameCount] != -1){
					playSound(soundFrames[frameCount]);
				}
			}
		}
		
		override public function postUpdate():void {
			super.postUpdate();
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
		}
		
		protected function playSound(snd:int) {
			trace("playSound");
			var sound:FlxSound = FlxG.play(soundArray[snd]);
		}
	}
}