package  
{
	/**
	 * ...
	 * @author Raujinn
	 */
	public class TmxList 
	{
		[Embed(source = "data/map02.tmx", mimeType="application/octet-stream")] static public var level_test:Class;
		[Embed(source = "data/level01.tmx", mimeType = "application/octet-stream")] static public var level_01:Class;
		[Embed(source = "data/level02.tmx", mimeType="application/octet-stream")] static public var level_02:Class;
		[Embed(source = "data/map03.tmx", mimeType = "application/octet-stream")] static public var level_03:Class;
		[Embed(source = "data/level03.tmx", mimeType = "application/octet-stream")] static public var level_04:Class;
		[Embed(source = "data/level05.tmx", mimeType = "application/octet-stream")] static public var level_05:Class;
		
		public static var levels = [
			level_01,
			level_02,
			level_03,
			level_04,
			level_05
		]
	}

}