package entities.spawners 
{
	import entities.testenemy.EnemyTemplate;
	import entities.testenemy.FirstEnemy;
	import net.flashpunk.Entity;
	import entities.map.Map;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	import utils.pathfinding.Path;
	import utils.pathfinding.Pathfinding;

	import entities.GroundTile;
		
	/**
	 * ...
	 * @author Axel Faes
	 */
	public class BasicSpawner extends GroundTile
	{
		private var interval:Number;
		private var intervalCounter:Number = 0;
		
		private var xEnd:int, yEnd:int;
		
		private var image:Image;
		
		private var isPath:Boolean;
		private var path:Path;
		
		public function BasicSpawner(map : Map, x : int = 0, y : int = 0, groundHeight : int = 0, interval:Number = 1, xEnd:int = 20, yEnd:int = 20) 
		{
			super(map, x, y, groundHeight);
			
			this.interval = interval;
			this.xEnd = xEnd;
			this.yEnd = yEnd;
			passable = false;
			placeable = false;
		}
		
		override public function added():void {
			super.added();
			this.image = new Image(Assets.SPAWNER);
			image.centerOrigin();
			addGraphic(image);
			isPath = updatePath();
		}
		
		override public function update():void {
			this.intervalCounter += FP.elapsed;
			
			if (this.intervalCounter >= this.interval) {
				spawn();
			}
		}
		
		public function spawn():void {
			this.intervalCounter = 0;

			if (isPath) {
				var p:Path = new Path();
				p.path = path.path;
				
				var enemy:EnemyTemplate = new FirstEnemy(map, p, gridX , gridY,xEnd, yEnd);
				FP.world.add(enemy);
			}
		}
		
		/**
		 * check if a object is over the path
		 * @param	x
		 * @param	y
		 * @return
		 */
		public function checkPath(x:int, y:int):Boolean {
			return path.containsPoint(x, y);
		}
		
		public function updatePath():Boolean {
			var status:Boolean = false;
			
			var p:Path = Pathfinding.pathAstar(map.getGroundTile(this.gridX, this.gridY), map.getGroundTile(xEnd,yEnd));
			
			if (p) {
				path = p;
				status = true;
			}
			
			isPath = status;
			return status;
		}
		
	}

}