package entities 
{
	import entities.map.Map;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Olivier de Schaetzen
	 */
	public class GroundTile extends Entity 
	{
		
		//the speed at which entities can travel over this ground
		public var speed : int = 10;
		
		//the x position of this tile on the map
		public var gridX : int = 0;
		
		//the y position of this tile on the map
		public var gridY : int = 0;
		
		//the height of this tile on the map
		public var groundHeight : int = 0;
		
		//whether or not enemies can move through this tile
		public var passable : Boolean = true;
		
		//the tile which corresponds to this 
		public var groundTile : GroundTile = null;
		
		//the map on which this is located
		public var map : Map = null;
			
		
		public function GroundTile(map : Map, x : int = 0, y : int = 0)
		{
			this.gridX = x;
			this.gridY = y;
			this.map = map;
			
			this.x = gridX * 32;
			this.y = gridY * 32;
		}
		
		override public function added():void 
		{
			this.graphic = Image.createRect(32, 32, 0x00FF00 - 0x002000 * (1+height) , 1);
		}
		
		public function getLeftTile():GroundTile
		{
			return map.getGroundTile(gridX - 1, gridY);
		}
		
		public function getRightTile():GroundTile
		{
			return map.getGroundTile(gridX + 1, gridY);
		}
		
		public function getTopTile():GroundTile
		{
			return map.getGroundTile(gridX, gridY - 1);
		}
		
		public function getBottomTile():GroundTile
		{
			return map.getGroundTile(gridX, gridY + 1);
		}
		
	}

}