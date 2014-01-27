package entities.testenemy 
{
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
	
	/**
	 * ...
	 * @author Axel Faes
	 */
	public class EnemyTemplate extends Entity
	{
		private var image : Image;
		private var speed : int = 50;
		private var health : Number = 10;
		private var facing : int = 2;
		private var angle : Number = 180 * FP.RAD;
		
		private var map:Map;
		
		private var xmap : int;
		private var ymap : int;
		
		private var path:Path;
		
		public function EnemyTemplate(sp:int, img:Class, map:Map) {
			set_speed(sp);
			set_image(img);
			set_size(1, 1);
			
			this.map = map;
			
			path = Pathfinding.pathDijkstra(map.mapData, map.getGroundTile(this.xmap, this.ymap), map.getGroundTile(10, 10));
		}
		
		override public function added():void {
			this.layer = -5000;
			set_position(10, 5);
		}
		
		/**
		 * update the character
		 */
		override public function update():void {
			move();
			
			if (Input.pressed(Key.R)) {
				this.x = 800;
			}
			
			if (Input.check(Key.F)) {
				this.angle += (2 * FP.RAD);
			}
			
			if (Input.check(Key.D)) {
				this.speed += 10;
			}
			
			if (this.x <= 0)
				this.x = 800;
		}
		
		/**
		 * change the path we are using
		 */
		public function usePath():void {
			//change facing
		}
		
		/**
		 * move the character
		 */
		private function move():void {
			setFacing();
			this.x += (this.speed * (Math.cos(this.angle))) * FP.elapsed;
			this.y += (this.speed * (Math.sin(this.angle))) * FP.elapsed;
			
		}
		
		/**
		 * 
		 * Get the real x and y location of the grid
		 */
		private function inTileRange():void {
			var xnew:int = this.x / References.TILESIZE;
			var ynew:int = this.y / References.TILESIZE;
			
			if (xnew != this.xmap || ynew != this.ymap) {
				usePath();
				this.xmap = xnew;
				this.ymap = ynew
			}
		}
		
		/**
		 * let the enemy take damage
		 * @param	dam
		 */
		public function takeDamage(dam:Number):void {
			this.health -= dam;
			
			if (this.health <= 0) {
				FP.world.remove(this);
			}
		}
		
		/**
		 * select the facing direction
		 */
		private function setFacing():void {
			switch (facing) {
				case 0:
					this.angle = 0;
					break;
				case 1:
					this.angle = 90 * FP.RAD;
					break;
				case 2:
					this.angle = 180 * FP.RAD;
					break;
				case 3:
					this.angle = 270 * FP.RAD;
					break;
			}
			image.angle = this.angle;
		}
		
		/**
		 * set the original position of the enemy
		 * @param	x
		 * @param	y
		 */
		public function set_position(x:int, y:int):void {
			this.xmap = x;
			this.ymap = y;
			this.x = References.TILESIZE * x;
			this.y = References.TILESIZE * y;
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
		 * set the speed of the enemy
		 * @param	sp
		 */
		public function set_speed(sp:int):void {
			this.speed = sp;
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
			this.image.scaledWidth = width;
			this.image.scaledHeight = height;
		}
	}

}