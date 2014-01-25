package worlds 
{
	import entities.GroundTile;
	import entities.map.Map;
	import entities.testenemy.TestEnemy;
	import entities.towers.BasicTower;
	import net.flashpunk.World;
	import utils.pathfinding.Path;
	import utils.pathfinding.Pathfinding;
	import net.flashpunk.FP;
	import entities.gui.Gui;
	
	/**
	 * ...
	 * @author Olivier de Schaetzen
	 */
	public class TestWorld extends World 
	{
		public var map:Map = new Map();
		public var tower: BasicTower = new BasicTower;
		public var testenemy: TestEnemy = new TestEnemy;
		
		
		public var done:Boolean = false;
		public function TestWorld() 
		{

		}
		
		override public function begin():void 
		{
			add(map);		
			add(tower);
			
			add(testenemy);
			
			Gui.init();
		}
		
		override public function update():void {
			super.update();
			if (FP.distance(tower.x, tower.y, testenemy.x, testenemy.y) <= tower.range)
				tower.shoot(testenemy.x, testenemy.y, testenemy.speed, testenemy.angle);
			
			//testing pathfinding
			if (!done) {
				done = true;
				var begin:GroundTile = map.getGroundTile(0, 0);
				var end:GroundTile = map.getGroundTile(2, 5);
				
				var path:Path = Pathfinding.pathDijkstra(map.mapData, begin, end);
				
				for each (var g:GroundTile in path.path) {
					trace(g.gridX + "+" + g.gridY);
				}
			
			}
		}
		
	}

}