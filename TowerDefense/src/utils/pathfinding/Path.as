package utils.pathfinding 
{
	import entities.GroundTile;
	import entities.testenemy.EnemyTemplate;
	
	/**
	 * ...
	 * @author Olivier de Schaetzen/Axel Faes
	 */
	public class Path 
	{
		public var path:Vector.< GroundTile > = new Vector.<GroundTile>;
		private var currentNode:int = 0;
		private var end:int;
		
		public function Path() 
		{
			
		}
		
		public function containsPoint(x:int, y:int):Boolean {
			var i:int = 0;
			for (i = currentNode; i < path.length; i++) {
				if (path[i].gridX == x && path[i].gridY == y)
					return true;
			}
			return false;
		}
		
		public function getLength():int {
			return path.length - currentNode - 1;
		}
		
		/**
		 * get the current x position
		 * uses currentNode-1 because currentNode is the node
		 * we need to move to next
		 */
		public function getNextX():int {
			return path[currentNode-1].gridX;
		}
		
		public function getNextY():int {
			return path[currentNode-1].gridY;
		}
		
		public function getDirection(x:int, y:int):int {
			end = path.length;
			var facing:int = 5;
			
			if (currentNode < end) {
				var xnew:int = path[currentNode].gridX;
				var ynew:int = path[currentNode].gridY;
				
				if (xnew < x) {
					facing = 2; //left
				}
				if (xnew > x) {
					facing = 0; //right
				}
				if (ynew < y) {
					facing = 1; //up
				}
				if (ynew > y) {
					facing = 3; //down
				}
				
				currentNode++;
			}
			return facing;
		}
		
	}

}