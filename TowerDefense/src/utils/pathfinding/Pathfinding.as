package utils.pathfinding 
{
	import entities.GroundTile;
	
	/**
	 * ToDo: 
		connection
	 *  debugging
	 * 
	 * @author Axel Faes
	 */
	public class Pathfinding 
	{
		public function Pathfinding() 
		{
			
		}
		
		/**
		 * finds the smallest element in a node record list
		*/
		private static function smallestElement(open:Vector.<NodeRecord>):NodeRecord {
			var smallest:NodeRecord = open[0];
			for each(var m:NodeRecord in open) {
				if (m.costSoFar < smallest.costSoFar) {
					smallest = m;
				}
			}
			return smallest;
		}
		
		/**
		 * get all connections from a specific tile
		 */ 
		private static function getConnections(current:GroundTile):Vector.<GroundTile> {
			var open:Vector.<GroundTile> = new Vector.<GroundTile>;
			open.push(current.getLeftTile());
			open.push(current.getRightTile());
			open.push(current.getTopTile());
			open.push(current.getBottomTile());
			
			return open;
		}
		
		/**
		 * remove an specific element from a vector
		 */
		public static function removeElem(open:Vector.<NodeRecord>, current:NodeRecord):void {
			for (var i:int = 0; i < open.length; i++) {
				if (open[i] == current) {
					open.splice(i, 1);
					break;
				}
			}
		}
		
		/**
		 * remove an specific element from a vector
		 */
		public static function find(open:Vector.<NodeRecord>, current:GroundTile):void {
			var found:GroundTile = null;
			for (var i:int = 0; i < open.length; i++) {
				if (open[i].node == current) {
					found = open[i];
					break;
				}
			}
			return found;
		}
		
		/**
		 * remove an specific element from a vector
		 */
		public static function contains(open:Vector.<NodeRecord>, current:NodeRecord):void {
			var found:Boolean = false;
			for (var i:int = 0; i < open.length; i++) {
				if (open[i] == current) {
					found = true;
					break;
				}
			}
			return found;
		}
		 
		/**
		 * Function to calculate the dijkstra path
		 */
		public static function pathDijkstra(graph:Vector.< GroundTile > , begin:GroundTile, end:GroundTile):Path {
			startrecord = new NodeRecord();
			startrecord.node = begin;
			
			var open:Vector.<NodeRecord> = new Vector.<NodeRecord>;
			open.push(startrecord);
			var closed:Vector.<NodeRecord> = new Vector.<NodeRecord>;
			
			while (open.length > 0) {
				var current:NodeRecord = smallestElement(open);
				
				if (current.node == goal) {
					break;
				}
				
				var connections:Vector.<GroundTile> = getConnections(current);
				
				for each(var connection:GroundTile in connections) {
					var endNode:GroundTile = connection.toNode;
					var endNodeCost:int = current.costSoFar + connection.cost;
					var endNodeRecord:NodeRecord;
					
					if (contains(closed, endNode)) {
						continue
					}
					
					else if (contains(open, endNode)) {
						endNodeRecord = find(open, endNode);
						
						if (endNodeRecord.cost <= endNodeCost) {
							continue;
						}
					}
					else {
						endNodeRecord = new NodeRecord();
						endNodeRecord.node = endNode;
					}

					endNodeRecord.cost = endNodeCost
					endNodeRecord.connection = connection
					
					if (!contains(open, endNode)) {
						open.push(endNodeRecord);
					}
				}
				
				remove(open, current);
				closed.push(current);
			}	
			
			if (current.node != end) {
				return null;
			}
			else {
				var path:Path = new Path();
				
				path = current.connection;
				
				path.path.reverse();
				return path;
			}

		}
		
	}

}