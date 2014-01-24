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
		/**
		 * this vector contains all the groundtiles
		 */
		public var mapData : Vector.<GroundTile>;
		public var mapWidth : int = 0;
		public var mapHeight : int = 0;
		
		
		public function Map() 
		{
		}
		
		/**
		 * initializes the map
		 */
		public function initializeMap(width : int, height : int)
		{
			this.width = width;
			this.height = height;
			
			for (var i : int = 0 ; i < width ; i++) {
				for (var k : int = 0 ; k < height ; k++) {
					mapData[i + k * width] = new GroundTile(i, k);
				}
			}
		}
		
		/**
		 * returns 
		 * @param	x
		 * @param	y
		 * @return
		 */
		public function getGroundTile(x : int, y : int):GroundTile
		{
			if (x < 0 || y < 0 || x >= mapWidth || y >= mapHeight) return null;
			
		}
		
	}

}