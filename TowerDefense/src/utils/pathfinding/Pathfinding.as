package utils.pathfinding 
{
	import utils.map.MapNode;
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
		 * 
		 */ 
		private static function getConnections(current:MapNode):
		 
		/**
		 * Function to calculate the dijkstra path
		 */
		public static function pathDijkstra(graph:Vector.< MapNode > , begin:MapNode, end:MapNode):Path {
			startrecord = new NodeRecord();
			startrecord.node = begin;
			
			var open:Vector.<NodeRecord> = new Vector.<NodeRecord>;
			open.push(startrecord);
			var closed:Vector.<NodeRecord> = new Vector.<NodeRecord>;
			
			while (open.length > 0) {
				if (current.node == goal) {
					break;
				}
			}
		}
		
	}

}