package states 
{
	import enemies.Enemy;
	import org.flixel.*;
	
	
	public class EnemyWander implements ActorState
	{
		private var fsm:FiniteStateMachine;
		private var self:Enemy;
		private var target:Actor;
		
		public function EnemyWander(e:Enemy, t:Actor) 
		{
			self = e;
			target = t;
		}
		
		public function update():void {
			if(target != null){
				var dir = Math.atan2(target.y - self.y, target.x - self.x);
				self.velocity.x = self.movespeed * Math.cos(dir);
				self.velocity.y = self.movespeed * Math.sin(dir);
			}
		}
		
		public function onExit():void {
			
		}
		
		public function onEnter():void {
			
		}
	}

}