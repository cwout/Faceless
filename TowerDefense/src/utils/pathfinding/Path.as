package utils.pathfinding 
{
	import entities.GroundTile;
	import entities.testenemy.TestEnemy;
	
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
		
		public function getDirection(x:int, y:int):int {
			end = path.length;
			var facing:int = 5;
			
			if (currentNode < end) {
				var xnew:int = path[currentNode].gridX;
				var ynew:int = path[currentNode].gridY;
				
				if (xnew < x) {
					facing = 2; //left
				}
				else if (xnew > x) {
					facing = 0; //right
				}
				else if (ynew < y) {
					facing = 1; //up
				}
				else if (ynew > y) {
					facing = 3; //down
				}
				
				currentNode++;
			}
			return facing;
		}
		
	}

}