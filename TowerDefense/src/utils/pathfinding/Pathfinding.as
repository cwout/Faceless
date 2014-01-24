package utils.pathfinding 
{
	import utils.map.GroundTile;
	/**
	 * ...
	 * @author Olivier de Schaetzen en Axel Faes
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
				
				for each(var connections:GroundTile in connections) {
					
					# Get the cost estimate for the end node
					37 endNode = connection.getToNode()
					38 endNodeCost = current.costSoFar +
					39 connection.getCost()
					40
					41 # Skip if the node is closed
					42 if closed.contains(endNode): continue
					43
					44 # .. or if it is open and we’ve found a worse
					218 Chapter 4 Pathfinding
					45 # route
					46 else if open.contains(endNode):
					47
					48 # Here we find the record in the open list
					49 # corresponding to the endNode.
					50 endNodeRecord = open.find(endNode)
					51
					52 if endNodeRecord.cost <= endNodeCost:
					53 continue
					54
					55 # Otherwise we know we’ve got an unvisited
					56 # node, so make a record for it
					57 else:
					58 endNodeRecord = new NodeRecord()
					59 endNodeRecord.node = endNode
					60
					61 # We’re here if we need to update the node
					62 # Update the cost and connection
					63 endNodeRecord.cost = endNodeCost
					64 endNodeRecord.connection = connection
					65
					66 # And add it to the open list
					67 if not open.contains(endNode):
					68 open += endNodeRecord
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