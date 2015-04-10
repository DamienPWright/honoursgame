package states 
{
	import enemies.Enemy;
	import org.flixel.*;
	public class EnemyLizidPlateWander implements ActorState
	{
		private var fsm:FiniteStateMachine;
		private var self:Enemy;
		private var target:Actor;
		private var dir:int = 0;
		private var wanderTimer:Number = 0;
		private var wanderTime:Number = 3;
		private var anim = "";
		
		private var seekbox:HitBox;
		private var seekbox_size:int;
		private var seekbox_pos:FlxPoint;
		
		public function EnemyLizidPlateWander(e:Enemy) 
		{
			self = e;
			fsm = self.getStateMachine();
			
			seekbox_size = 100;
			seekbox_pos = new FlxPoint(self.getMidpoint().x - (seekbox_size / 2), self.getMidpoint().y - (seekbox_size / 2));
			seekbox = (FlxG.state as TmxLevel).createHitBox(seekbox_pos.x, seekbox_pos.y, seekbox_size, seekbox_size, 1, 0);
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
			
			if (self.velocity.x > self.movespeed) {
				self.velocity.x = self.movespeed;
			}
			if (self.velocity.x < -self.movespeed) {
				self.velocity.x = -self.movespeed;
			}
			if (self.velocity.y > self.movespeed) {
				self.velocity.y = self.movespeed;
			}
			if (self.velocity.y < -self.movespeed) {
				self.velocity.y = -self.movespeed;
			}
			
			if (wanderTimer > wanderTime) {
				fsm.changeState(new EnemyLizidPlateIdle(self));
			}
			self.play(anim);
			
			
			seekbox.setHitBoxPos(self.getMidpoint().x - (seekbox_size / 2), self.getMidpoint().y - (seekbox_size / 2));
			if ((FlxG.state as TmxLevel).checkHitboxActorOverlap(seekbox, (FlxG.state as TmxLevel).getPlayer())){
				self.setTarget((FlxG.state as TmxLevel).getPlayer());
				fsm.changeState(new EnemyLizidPlatePersue(self));
			}
		}
		
		public function onExit():void {
			wanderTimer = 0;
			self.velocity.x = 0;
			self.velocity.y = 0;
			seekbox.killHitBox();
		}
		
		public function onEnter():void {
			dir = Math.round(Math.random() * 3);
		}
	}

}