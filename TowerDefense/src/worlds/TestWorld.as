package worlds 
{
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
			var tower:BasicTower = new BasicTower;
			add(tower);
		}
		
	}

}