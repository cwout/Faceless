package entities.map 
{
	import entities.GroundTile;
	import entities.towers.BasicTower;
	import net.flashpunk.Entity;
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
			initializeMap(30,30);
		}
		
		/**
		 * initializes the map
		 */
		public function initializeMap(width : int, height : int):void
		{
			this.mapWidth = width;
			this.mapHeight = height;
			
			mapData = new Vector.<GroundTile>(width * height);
			for (var i : int = 0 ; i < mapWidth ; i++) {
				for (var k : int = 0 ; k < mapHeight ; k++) {
					mapData[i + k * mapWidth] = new GroundTile(this, i, k);
					world.add(mapData[i + k * mapWidth]);
				}
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
		
	}

}