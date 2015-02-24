package states 
{
	import enemies.Enemy;
	import org.flixel.*;
	
	
	public class EnemyWander implements ActorState
	{
		private var fsm:FiniteStateMachine;
		private var self:Actor;
		private var target:Actor;
		
		public function EnemyWander(e:Actor, t:Actor) 
		{
			self = e;
			target = t;
		}
		
		public function update():void {
			
			var dir = Math.atan2(target.y - self.y, target.x - self.x);
			self.velocity.x = self.movespeed * Math.cos(dir);
			self.velocity.y = self.movespeed * Math.sin(dir);
			/*
			if (FlxG.keys.A && FlxG.keys.W) {
				angle = 1.25 * Math.PI;
			}else if (FlxG.keys.A && FlxG.keys.S)  {
				angle = 0.75 * Math.PI;
			}else if (FlxG.keys.D && FlxG.keys.W)  {
				angle = 1.75 * Math.PI;
			}else if (FlxG.keys.D && FlxG.keys.S)  {
				angle = 0.25 * Math.PI;
			}else if (target.x > self.x) {
				self.velocity.x = 25;
			}else if (target.x < self.x) {
				self.velocity.x = -25;
			}else if (target.y > self.y) {
				self.velocity.y = 25;
			}else if (target.y < self.y) {
				self.velocity.y = -25;
			}
			*/
		}
		
		public function onExit():void {
			
		}
		
		public function onEnter():void {
			
		}
	}

}