package entities.testenemy 
{
	import entities.map.Map;
	/**
	 * ...
	 * @author Axel Faes
	 */
	public class FirstEnemy extends EnemyTemplate
	{
		
		public function FirstEnemy(map:Map) 
		{
			super(50, Assets.TestEnemy, map);
		}
		
	}

}