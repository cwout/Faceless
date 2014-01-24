package entities 
{
	import net.flashpunk.Entity;
	
	/**
	 * ...
	 * @author Olivier de Schaetzen
	 */
	public class GroundTile extends Entity 
	{
		
		//the speed at which entities can travel over this ground
		public var speed : int = 10;
		
		//the x position of this tile on the map
		public var x : int = 0;
		
		//the y position of this tile on the map
		public var y : int = 0;
		
		//the height of this tile on the map
		public var height : int = 0;
		
		//whether or not enemies can move through this tile
		public var passable : Boolean = true;
		
		//the tile which corresponds to this 
		public var groundTile : GroundTile = null;
		
		//the map on which this is located
		public var map : Map = null;
		
	}

}