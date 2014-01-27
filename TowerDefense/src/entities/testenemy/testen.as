package entities.testenemy 
{
	import entities.map.Map;
	/**
	 * ...
	 * @author ...
	 */
	public class testen extends EnemyTemplate
	{
		
		public function testen(map:Map) 
		{
			super(50, Assets.TestEnemy, map);
		}
		
	}

}