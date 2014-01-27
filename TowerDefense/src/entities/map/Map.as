package entities.map 
{
	import entities.GroundTile;
	import entities.towers.BasicTower;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	/**
	 * ...
	 * @author Olivier de Schaetzen
	 */
	public class Map extends Entity
	{
		//this vector contains all the groundtiles	
		public var mapData : Vector.<GroundTile>;
		//the width of the map
		public var mapWidth : int = 0;
		//the height of the map
		public var mapHeight : int = 0;
		//the speed at which the camera scrolls
		
		override public function added():void 
		{
			name = "map";
			initializeMap();
		}
		
		/**
		 * initializes the map
		 */
		public function initializeMap():void
		{
			parseMap(Assets.LEVEL_TESTLEVEL);
		}
		
		public function parseMap(map : Class):void
		{
			
			//the xml file that is being parsed
			var xml : XML = FP.getXML(map);
			
			//we setup the width and height of the map
			this.mapWidth = parseInt(xml.@width) / 40;
			this.mapHeight = parseInt(xml.@height) / 40;
			
			//we initialize the mapdata
			mapData = new Vector.<GroundTile>(mapWidth * mapHeight);		
			
			//for each tile in the xml file
			for each (var tile : XML in xml.MapData.tile) {
					//we get the x and y coordinates
					var tilex : int = parseInt(tile.@x);
					var tiley : int = parseInt(tile.@y);
					
					//we create a new groundtile
					var groundTile : GroundTile = new GroundTile(this, tilex, tiley, parseInt(tile.@id));
					
					//and put them in the array
					mapData[tilex + tiley * mapWidth] = groundTile;	
			}
			
			for each(var object : XML in xml.Objects.tile) {
					tilex = parseInt(object.@x);
					tiley = parseInt(object.@y);
					var id : int = parseInt(object.@id);
					var newtile : GroundTile = getGroundTile(tilex, tiley);
					var newthing : GroundTile;
					switch (id) {
						case 0: //0 is ID for a piece of rubble
							newthing = new Rubble(this, tilex, tiley, newtile.groundHeight);
							break;
					}
					if (newthing != null) {
						setGroundTile(tilex, tiley, newthing);
						world.add(newthing);
						world.remove(newtile);
					}	
			}
			//now we add all maps to the world
			for (var i : int = 0 ; i < mapWidth * mapHeight ; i++) {
				FP.world.add(mapData[i] as Entity);
			}
			
		}
		
		override public function update():void 
		{
			super.update();
			
			//here we move the flashpunk camera
			
			if (Input.check(Key.RIGHT)) {
				FP.camera.x += References.SCROLLSPEED * FP.elapsed;
				if ( FP.camera.x > mapWidth * References.TILESIZE - 800) FP.camera.x = mapWidth * References.TILESIZE - 800;
			}
			if (Input.check(Key.LEFT)) {
				FP.camera.x -= References.SCROLLSPEED * FP.elapsed;
				if (FP.camera.x < 0) FP.camera.x = 0;
			}
			if (Input.check(Key.UP)) {
				FP.camera.y -= References.SCROLLSPEED * FP.elapsed;
				if (FP.camera.y < 0) FP.camera.y = 0;
			}
			if (Input.check(Key.DOWN)) {
				FP.camera.y += References.SCROLLSPEED * FP.elapsed;
				if ( FP.camera.y > mapHeight * References.TILESIZE - 600) FP.camera.y = mapHeight * References.TILESIZE - 600;
			}
			
		}
		
		public function addTower(x : int, y : int):void
		{
				var tile : GroundTile = getGroundTile(x, y);
				
				var tempTower  : BasicTower = new BasicTower(this, x, y, tile.groundHeight);	
				
				FP.world.remove(tile);
				
				FP.world.add(tempTower);
				
				setGroundTile(x, y, tempTower);
		}
		
		/**
		 * returns the groundtile at the given position
		 */
		public function getGroundTile(x : int, y : int):GroundTile
		{
			if (x < 0 || y < 0 || x >= mapWidth || y >= mapHeight) return null;
			return mapData[x + y * mapWidth];
		}
		
		public function setGroundTile(x : int, y : int, tile : GroundTile) : void
		{
			mapData[x + y * mapWidth] = tile;
		}
		
	}

}