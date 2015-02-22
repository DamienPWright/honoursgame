package states{
		public interface ActorState {
			function onEnter():void
			function update():void
			function onExit():void
		}
}