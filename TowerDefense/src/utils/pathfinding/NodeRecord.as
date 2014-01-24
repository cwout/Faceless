package utils.pathfinding 
{
	import entities.GroundTile;
	/**
	 * Holds the record for the pathfinding algorithm
	 * @author Axel Faes
	 */
	public class NodeRecord 
	{
		public var node:GroundTile;
		public var connection:Connection;
		public var costSoFar:Number = 0;
			
		public function NodeRecord() 
		{
			
		}
		
	}

}