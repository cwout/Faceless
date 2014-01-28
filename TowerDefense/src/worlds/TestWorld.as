package worlds 
{
	import entities.GroundTile;
	import entities.map.Map;
	import entities.spawners.BasicSpawner;
	import entities.testenemy.FirstEnemy;
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
		//public var tower: BasicTower = new BasicTower;
		public var testenemy: BasicSpawner;
		
		
		public var done:Boolean = false;
		public function TestWorld() 
		{
			
		}
		
		override public function begin():void 
		{
			add(map);		
			//add(tower);

			Gui.initWithMap(this.map);
			
			testenemy = new BasicSpawner(Assets.SPAWNER,Gui.map,1,3,3,19,19);
			add(testenemy);
		}
		
		override public function update():void {
			super.update();
			//if (FP.distance(tower.x, tower.y, testenemy.x, testenemy.y) <= tower.range)
			//	tower.shoot(testenemy.x, testenemy.y, testenemy.speed, testenemy.angle);
		}
		
	}

}