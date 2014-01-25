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
		}
		
		public function parseMap(map : Class):void
		{
			var xml : XML = FP.getXML(map);
			
			mapData = new Vector.<GroundTile>(parseInt(xml.@width)/40 * parseInt(xml.@height)/40 );		
			
			for each (var tile : XML in xml.MapData.tile) {
					var tilex : int = parseInt(tile.@x);
					var tiley : int = parseInt(tile.@y);
					
					var groundTile : GroundTile = new GroundTile(this, tilex, tiley);
					
					groundTile.groundHeight = parseInt(tile.@id);
					
					world.add(groundTile);
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
		
	}

}