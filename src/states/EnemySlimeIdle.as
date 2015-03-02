package states 
{
	import enemies.Enemy;
	import org.flixel.*;
	public class EnemySlimeIdle implements ActorState
	{
		private var fsm:FiniteStateMachine;
		private var self:Enemy;
		private var target:Actor;
		private var dir:int = 0;
		private var idleTimer:Number = 0;
		private var idleTime:Number = 3;
		
		public function EnemySlimeIdle(e:Enemy) 
		{
			self = e;
			fsm = self.getStateMachine();
		}
		
		public function update():void {
			idleTimer += FlxG.elapsed;
			//self.velocity.x = 0;
			//self.velocity.y = 0;
			if (idleTimer > idleTime) {
				fsm.changeState(new EnemySlimeWander(self));
			}
		}
		
		public function onExit():void {
			idleTimer = 0;
		}
		
		public function onEnter():void {
		}
	}

}