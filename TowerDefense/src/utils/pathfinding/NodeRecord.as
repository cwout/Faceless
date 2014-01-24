package utils.pathfinding 
{
	/**
	 * Holds the record for the pathfinding algorithm
	 * @author Axel Faes
	 */
	public class NodeRecord 
	{
		public var connection:Vector.<MapNode> = new Vector.<MapNode>;
		public var costSoFar:Number = 0;
			
		public function NodeRecord() 
		{
			
		}
		
	}

}