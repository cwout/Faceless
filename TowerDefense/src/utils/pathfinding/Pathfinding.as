package utils.pathfinding 
{
	import entities.GroundTile;
	
	/**
	 * @author Axel Faes
	 */
	public class Pathfinding 
	{
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
		private static function getConnections(current:GroundTile):Vector.<Connection>{
			var open:Vector.<Connection> = new Vector.<Connection>;
			var con:Connection = new Connection();
			con.fromNode = current;
			con.toNode = current.getLeftTile();
			open.push(con);
			con.toNode = current.getRightTile();
			open.push(con);
			con.toNode = current.getTopTile();
			open.push(con);
			con.toNode = current.getBottomTile();
			open.push(con);
			
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
			
			var current:NodeRecord;
			
			while (open.length > 0) {
				current = smallestElement(open);
				
				if (current.node == end) {
					break;
				}
				
				var connections:Vector.<Connection> = getConnections(current);
				
				for each(var connection:Connection in connections) {
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
				
				while (current.node != begin) {
					path.path.push(current.node)
					current = current.connection.fromNode()
				}

				path.path.reverse();
				return path;
			}

		}
		
	}

}