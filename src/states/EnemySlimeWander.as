package states 
{
	import enemies.Enemy;
	import org.flixel.*;
	public class EnemySlimeWander implements ActorState
	{
		private var fsm:FiniteStateMachine;
		private var self:Enemy;
		private var target:Actor;
		private var dir:int = 0;
		private var wanderTimer:Number = 0;
		private var wanderTime:Number = 3;
		private var anim = "";
		
		public function EnemySlimeWander(e:Enemy) 
		{
			self = e;
			fsm = self.getStateMachine();
		}
		
		public function update():void {
			wanderTimer += FlxG.elapsed;
			
			
			switch(dir) {
				case 0:
					anim = "walk_n";
					self.velocity.y = -self.movespeed;
					self.velocity.x = 0;
					break;
				case 1:
					anim = "walk_s";
					self.velocity.y = self.movespeed;
					self.velocity.x = 0;
					break;
				case 2:
					anim = "walk_e";
					self.velocity.x = self.movespeed;
					self.velocity.y = 0;
					break;
				case 3:
					anim = "walk_w";
					self.velocity.x = -self.movespeed;
					self.velocity.y = 0;
					break;
				default:
			}
			
			
			if (wanderTimer > wanderTime) {
				fsm.changeState(new EnemySlimeIdle(self));
			}
			self.play(anim);
		}
		
		public function onExit():void {
			wanderTimer = 0;
			self.velocity.x = 0;
			self.velocity.y = 0;
		}
		
		public function onEnter():void {
			dir = Math.round(Math.random() * 3);
		}
	}

}