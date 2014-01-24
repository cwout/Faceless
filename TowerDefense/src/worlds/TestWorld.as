package worlds 
{
	import entities.GroundTile;
	import entities.map.Map;
	import entities.towers.BasicTower;
	import net.flashpunk.World;
	import utils.pathfinding.Path;
	import utils.pathfinding.Pathfinding;
	
	/**
	 * ...
	 * @author Olivier de Schaetzen
	 */
	public class TestWorld extends World 
	{
		public var map:Map = new Map();
		
		public function TestWorld() 
		{

		}
		
		override public function begin():void 
		{
			add(map);		
			var tower:BasicTower = new BasicTower;
			add(tower);
		}
		
		override public function update():void {
			super.update();
			/*
			var begin:GroundTile = map.mapData[0];
			var end:GroundTile = map.mapData[9];
			
			var path:Path = Pathfinding.pathDijkstra(map.mapData, begin, end);
			
			for each (var g:GroundTile in path.path) {
				trace(g.gridX);
				trace("+");
				trace(g.gridY);
				trace("\n");
			}
			*/
		}
		
	}

}