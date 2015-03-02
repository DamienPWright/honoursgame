package
{
	import attacks.Attack;
	import enemies.Enemy;
	import enemies.EnemyGiantSlime;
	import enemies.EnemySlime;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import net.pixelpracht.tmx.TmxMap;
	import net.pixelpracht.tmx.TmxObject;
	import net.pixelpracht.tmx.TmxObjectGroup;
	
	import org.flixel.*;
	
	import effects.*;
	
	public class TmxLevel extends FlxState
	{
		[Embed(source="data/map.png")] private var ImgMap:Class;
		[Embed(source="data/tileset2.png")] private var ImgTiles:Class;
		[Embed(source="data/bg.png")] private var ImgBG:Class;
		[Embed(source="data/gibs.png")] private var ImgGibs:Class;
		
		protected var _fps:FlxText = new FlxText(1,1,1);
		public var player:Player;
		public var tilemap:FlxTilemap;
		public var floortiles:FlxTilemap;
		public var colliders:FlxGroup = new FlxGroup();
		public var collidesWithTiles:FlxGroup = new FlxGroup();
		public var collidesWithAll:FlxGroup = new FlxGroup();
		
		public var enemyList:FlxGroup = new FlxGroup();
		public var enemyListSize:int = 50; // raise this limit if theres a type of quest that warrants it.
		public var effectList:FlxGroup = new FlxGroup();
		public var effectListSize:int = 50;
		public var bulletList:FlxGroup = new FlxGroup();
		public var bulletListSize:int = 20;
		public var actorList:FlxGroup = new FlxGroup();
		
		public var hitboxList:FlxGroup = new FlxGroup();
		public var hitboxListSize:int = 50;
		public var drawHitBoxes:Boolean = true; 
		
		public var entranceDoor:Door = null;
		public var exitDoor:Door = null;
		public var dooropened:Boolean = false;
		
		public var tmxfile:String = 'data/map02.tmx';
		
		protected var _elevator:FlxSprite;
		
		public function TmxLevel(tmxfilepath:String = "") {
			if (tmxfilepath) {
				tmxfile = tmxfilepath;
			}
		}
		
		override public function create():void
		{
			super.create();
			loadTmxFile();
			
		}
		
		override public function update():void
		{
			//_fps.text = FlxU.floor(1/FlxG.elapsed).toString()+"fps";
			super.update();
			//if(FlxG.keys.justReleased("ENTER"))
			//	FlxG.switchState(new TmxLevel());
			FlxG.collide(colliders);
			FlxG.overlap(hitboxList, actorList, hitboxActorCollideHandler);
			/*
			if(effectList.countLiving() > 0){
				trace(effectList.countLiving());
			}
			*/
			if(!dooropened){
				checkDoors();
			}
		}
		
		private function loadTmxFile():void
		{
			var loader:URLLoader = new URLLoader(); 
			loader.addEventListener(Event.COMPLETE, onTmxLoaded); 
			loader.load(new URLRequest(tmxfile)); 
		}
		
		private function onTmxLoaded(e:Event):void
		{
			var xml:XML = new XML(e.target.data);
			var tmx:TmxMap = new TmxMap(xml);
			loadStateFromTmx(tmx);
		}
		
		private function loadStateFromTmx(tmx:TmxMap):void
		{			
			//Background
			//FlxState.bgColor = 0xffacbcd7;
			var decoration:FlxSprite = new FlxSprite(256,159,ImgBG);
			decoration.moves = false;
			decoration.solid = false;
			add(decoration);			
			
			
			//Basic level structure
			tilemap = new FlxTilemap();
			floortiles = new FlxTilemap();
			//generate a CSV from the layer 'map' with all the tiles from the TileSet 'tiles'
			var mapCsv:String = tmx.getLayer('map').toCsv(tmx.getTileSet('tiles'));
			var floorTilesCsv:String = tmx.getLayer('floor').toCsv(tmx.getTileSet('tiles'));
			tilemap.loadMap(mapCsv,ImgTiles, 32, 32);
			tilemap.follow();
			floortiles.loadMap(floorTilesCsv, ImgTiles, 32, 32);
			add(tilemap);
			add(floortiles);
			
			colliders.add(tilemap);
			
			//instantiate flxGroups
			
			for (var i:int = 0; i < enemyListSize; i++) {
				/*
				var newEnemy:Enemy = new Enemy(0, 0);
				newEnemy.exists = false;
				enemyList.add(newEnemy);
				*/
			}
			
			for (var i:int = 0; i < effectListSize; i++) {
				var newEffect:Effect = new Effect();
				newEffect.exists = false;
				effectList.add(newEffect);
			}
			
			for (var i:int = 0; i < bulletListSize; i++) {
				/*
				var newBullet:Bullet = new Bullet(0, 0);
				newBullet.exists = false;
				bulletList.add(newEnemy);			
				*/
			}
			
			
			add(hitboxList);
			add(enemyList);
			add(bulletList);
			add(effectList);
			
			
			
			//create the flixel implementation of the objects specified in the ObjectGroup 'objects'
			var group:TmxObjectGroup = tmx.getObjectGroup('objects');
			for each(var object:TmxObject in group.objects)
				spawnObject(object)
				
			add(player);
			//test enemy
			var testEnemy = new Enemy(128, 128, player);
			enemyList.add(testEnemy);
				
			colliders.add(player);
			colliders.add(enemyList);
			actorList.add(player);
			actorList.add(enemyList);
			
			
			//give enemies a reference to the player.. think of a better way to do this later
			//for each(var enemy:Enemy in enemyList) {
			//	enemy.setTarget(player);
			//}
			
			//camera
			FlxG.camera.follow(player, FlxCamera.STYLE_TOPDOWN_TIGHT);
		}
		
		
		private function spawnObject(obj:TmxObject):void
		{
			//Add game objects based on the 'type' property
			switch(obj.type)
			{
				case "player":
					player = new Player(obj.x, obj.y);
					return;
				case "enemy":
					//create enemy based on type.
					enemyList.add(spawnEnemy(obj.name, obj.x, obj.y));
					return;
				case "door":
					exitDoor = new Door(obj.x, obj.y - 32, new TmxLevel('data/map03.tmx'));
					add(exitDoor);
					colliders.add(exitDoor);
					return;
			}
		}
		
		public function createHitBox(X:int = 0, Y:int = 0, W:int = 1, H:int = 1, parity:int = 0, lifespan:int = 0, persist:Boolean = false):HitBox {
			var newHitBox = hitboxList.recycle(HitBox);
			newHitBox.resetHitBox(X, Y, W, H, parity, lifespan);
			newHitBox.exists = true;
			return newHitBox;
		}
		
		public function createHitBoxAttack(attack:Attack, X:int = 0, Y:int = 0, W:int = 1, H:int = 1, parity:int = 0, lifespan:int = 0, persist:Boolean = false):HitBox {
			var newHitBox = hitboxList.recycle(HitBox);
			newHitBox.resetHitBox(X, Y, W, H, parity, lifespan);
			newHitBox.exists = true;
			newHitBox.setAttack(attack);
			return newHitBox;
		}
		
		public function spawnEnemy(en_type:String, X:int, Y:int):Enemy {
			var newEnemy:Enemy;
			
			switch(en_type) {
				case "giantslime":
					newEnemy = new EnemyGiantSlime(X, Y, player);
					break;
				case "slime":
					newEnemy = new EnemySlime(X, Y, player);
					break;
			}
			
			return newEnemy;
		}
		
		public function recycleEffect(img:Class = null, animated:Boolean = false, reverse:Boolean = false, frameWidth:int = 0, frameHeight:int = 0):Effect {
			var newEffect = effectList.recycle(Effect);
			newEffect.exists = true;
			newEffect.loadGraphic(img, animated, reverse, frameWidth, frameHeight);
			return newEffect;
		}
		
		public function recycleEnemy():void {
			var newEnemy = enemyList.recycle(Enemy);
			newEnemy.exists = true;
		}
		
		public function checkDoors():void {
			if (enemyList.countLiving() == 0 && exitDoor != null) {
				trace("Door opened!");
				dooropened = true;
				exitDoor.openDoor();
			}
		}
		
		public function checkHitboxActorOverlap(hb:HitBox, a:Actor):Boolean {
			return FlxG.overlap(hb, a);
		}
		
		public function hitboxActorCollideHandler(hb:HitBox, a:Actor):void {
			
			var parity = hb.getParity();
			//trace(hitboxList.length);
			switch(parity) {
				case 0:
					break;
				case 1:
					if (a.faction == "player") {
						//perform player hurt routine
					}
					break;
				case 2:
					if (a.faction == "enemy") {
						//perform enemy hit routine
						//trace(a.faction);
						a.onHit(hb);
					}
					break;
				case 3:
					if (a.faction == "box") {
						//perform box breaking routine
					}
					break;
				default:
			}
		}
		
		public function triggerWarp(newstate:FlxState):void {
			FlxG.switchState(newstate);
		}
		
		public function getPlayer():Actor {
			return player;
		}
		
	}
}