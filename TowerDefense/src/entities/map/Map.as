package entities.map 
{
	import entities.GroundTile;
	import entities.towers.BasicTower;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
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
		
		override public function added():void 
		{
			initializeMap();
		}
		
		/**
		 * initializes the map
		 */
		public function initializeMap():void
		{
			parseMap(Assets.LEVEL_TESTLEVEL);
			var tile : GroundTile = getGroundTile(4, 4);
			var tower : BasicTower = new BasicTower(this, 4,4, tile.groundHeight);
			
			setGroundTile(4, 4, tower);
			
			world.add(tower);
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
					
					//we add them to the world
					world.add(groundTile);
					
					//and put them in the array
					mapData[tilex + tiley * mapWidth] = groundTile;
				
			}
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