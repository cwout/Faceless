package utils.map 
{
	import entities.GroundTile;
	import entities.map.Map;
	import net.flashpunk.World;
	/**
	 * ...
	 * @author Olivier de Schaetzen
	 */
	public class MapNode 
	{
		
		public var x : int = 0;
		public var y : int = 0;
		public var height : int = 0;
		public var passable : Boolean = true;
		public var groundTile : GroundTile = null;
		public var map : Map = null;
		
		public function MapNode(map : Map, x : int = 0, y : int = 0, height : int = 0, passable : Boolean = true, groundTile : GroundTile = null) 
		{
			this.map = MapNode;
			this.x = x;
			this.y = y;
			this.passable = passable;
			this.height = height;
			this.groundTile = content;
		}
		
	}

}