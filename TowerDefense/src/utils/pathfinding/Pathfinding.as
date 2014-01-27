package utils.pathfinding 
{
	import entities.GroundTile;
	
	/**
	 * TODO:
	 * add upgrades (height difference)
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
		private static function getConnections(current:NodeRecord):Vector.<Connection>{
			var open:Vector.<Connection> = new Vector.<Connection>;
			
			var cur:GroundTile = current.node.getLeftTile();
			if (cur && (Math.abs(cur.groundHeight-current.node.groundHeight)<=1) && cur.passable) {
				var con:Connection = new Connection();
				con.fromNode = current;
				con.toNode = current.node.getLeftTile();
				open.push(con);
			}
			
			cur = current.node.getRightTile();
			if (cur && (Math.abs(cur.groundHeight-current.node.groundHeight)<=1) && cur.passable) {
				var con1:Connection = new Connection();
				con1.fromNode = current;
				con1.toNode = current.node.getRightTile();
				open.push(con1);
			}
			
			cur = current.node.getTopTile();
			if (cur && (Math.abs(cur.groundHeight-current.node.groundHeight)<=1) && cur.passable) {
				var con2:Connection = new Connection();
				con2.fromNode = current;
				con2.toNode = current.node.getTopTile();
				open.push(con2);
			}
			
			cur = current.node.getBottomTile();
			if (cur && (Math.abs(cur.groundHeight-current.node.groundHeight)<=1) && cur.passable) {
				var con3:Connection = new Connection();
				con3.fromNode = current;
				con3.toNode = current.node.getBottomTile();
				open.push(con3);
			}
			
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
		public static function find(open:Vector.<NodeRecord>, current:GroundTile):NodeRecord {
			var found:NodeRecord = null;
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
		public static function contains(open:Vector.<NodeRecord>, current:GroundTile):Boolean {
			var found:Boolean = false;
			for (var i:int = 0; i < open.length; i++) {
				if (open[i].node == current) {
					found = true;
					break;
				}
			}
			return found;
		}
		 
		/**
		 * Function to calculate the dijkstra path
		 */
		public static function pathDijkstra(begin:GroundTile, end:GroundTile):Path {
			var startrecord:NodeRecord;
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
						
						if (endNodeRecord.costSoFar <= endNodeCost) {
							continue;
						}
					}
					else {
						endNodeRecord = new NodeRecord();
						endNodeRecord.node = endNode;
					}

					endNodeRecord.costSoFar = endNodeCost
					endNodeRecord.connection = connection
					
					if (!contains(open, endNode)) {
						open.push(endNodeRecord);
					}
				}
				
				removeElem(open, current);
				closed.push(current);
			}	
			
			if (current.node != end) {
				return null;
			}
			else {
				var path:Path = new Path();
				
				while (current.node != begin) {
					path.path.push(current.node);
					current = current.connection.fromNode;
				}

				path.path.reverse();
				return path;
			}
			

		}
		
	}

}