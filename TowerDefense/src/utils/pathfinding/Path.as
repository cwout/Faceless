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
		
		public function Path() 
		{
			
		}
		
		public function getDirection(x:int, y:int):int {
			var xnew:int = path[currentNode].gridX;
			var ynew:int = path[currentNode].gridY;
			
			var facing:int = 5;
			
			if (xnew < x) {
				facing = 2;
			}
			else if (xnew > x) {
				facing = 0;
			}
			if (ynew < y) {
				facing = 3;
			}
			else if (ynew > y) {
				facing = 1;
			}
			
			currentNode++;
			return facing;
		}
		
	}

}