package 
{
	public class MapTrigger
	{
		public var trigger_id:int = -1;
		public var triggered:Boolean = false;
		public function MapTrigger(in_trigger_id:int) {
			trigger_id = in_trigger_id;
		}
		
		public function fire() {
			triggered = true;
		}
	}
}