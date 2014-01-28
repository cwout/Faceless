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
	public class BasicSpawner extends Entity
	{
		private var interval:Number;
		private var intervalCounter:Number = 0;
		
		private var xEnd:int, yEnd:int;
		
		private var image:Image;
		private var map:Map;
		
		private var xmap:int, ymap:int;
		
		private var isPath:Boolean;
		private var path:Path;
		
		public function BasicSpawner(img:Class, map:Map, interval:Number,x:int, y:int, xEnd:int, yEnd:int) 
		{
			set_image(img);
			set_size(1, 1);
			
			this.map = map;
			
			set_position(x, y);
			
			this.interval = interval;
			this.xEnd = xEnd;
			this.yEnd = yEnd;
		}
		
		override public function added():void {
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
				
				var enemy:EnemyTemplate = new FirstEnemy(map, p, xmap ,ymap ,xEnd, yEnd);
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
			
			var p:Path = Pathfinding.pathDijkstra(map.getGroundTile(this.xmap, this.ymap), map.getGroundTile(xEnd,yEnd));
			
			if (p) {
				path = p;
				status = true;
			}
			
			isPath = status;
			
			return status;
		}
		
		/**
		 * set the original position of the enemy
		 * @param	x
		 * @param	y
		 */
		public function set_position(x:int, y:int):void {
			//swapped
			this.x = References.TILESIZE * x + References.TILESIZE / 2;
			this.y = References.TILESIZE * y + References.TILESIZE / 2;
			this.xmap = x;
			this.ymap = y;
		}
		
		/**
		 * set the enemy size
		 * @param	w
		 * @param	h
		 */
		public function set_size(w:int, h:int):void {
			this.width = References.TILESIZE * w;
			this.height = References.TILESIZE * h;
			resetImg();
		}
		
		/**
		 * set the image for the enemy class
		 * @param	img
		 */
		public function set_image(img:Class):void {
			this.image = new Image(img);
			resetImg();
			this.graphic = image;
		}
		
		/**
		 * set the image size
		 */
		private function resetImg():void {
			this.image.centerOrigin();
			set_imgSize(2 / 3);
		}
		
		/**
		 * set the image size
		 * @param	nb
		 */
		public function set_imgSize(nb:Number):void {
			this.image.scaledWidth = nb * width;
			this.image.scaledHeight = nb * height;
		}
		
	}

}