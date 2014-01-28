package entities.testenemy 
{
	import entities.map.Map;
	import utils.pathfinding.Path;
	/**
	 * ...
	 * @author Axel Faes
	 */
	public class FirstEnemy extends EnemyTemplate
	{
		
		public function FirstEnemy(map:Map,p:Path,xBegin:int, yBegin:int, xEnd:int, yEnd:int) 
		{
			super(50, Assets.TestEnemy, map,xBegin, yBegin, xEnd, yEnd, p);
		}
		
	}

}