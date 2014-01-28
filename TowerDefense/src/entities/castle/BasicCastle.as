package entities.castle 
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
	public class BasicCastle extends Entity
	{
		private var image:Image;
		private var map:Map;
		
		private var xmap:int, ymap:int;
		
		private var health:Number = 2000;
		
		public function BasicCastle(img:Class, map:Map,x:int, y:int, sizeX:int, sizeY:int, health:Number) 
		{
			set_image(img);
			set_size(sizeX, sizeY);
			
			this.map = map;
			
			this.health = health;
			
			set_position(x, y);
		}
		
		override public function added():void {
			
		}
		
		override public function update():void {
			
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
			set_imgSize(1);
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