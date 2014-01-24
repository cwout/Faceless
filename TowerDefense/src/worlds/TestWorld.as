package worlds 
{
	import entities.map.Map;
	import entities.towers.BasicTower;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author Olivier de Schaetzen
	 */
	public class TestWorld extends World 
	{
		
		public function TestWorld() 
		{

		}
		
		override public function begin():void 
		{
			add(new Map());
			var tower:BasicTower = new BasicTower;
			add(tower);
		}
		
	}

}