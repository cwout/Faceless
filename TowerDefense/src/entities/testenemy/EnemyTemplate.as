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
	
	import entities.GroundTile;
	
	/**
	 * Basic template for any enemy
	 * @author Axel Faes
	 */
	public class EnemyTemplate extends Entity
	{
		public var image : Image;
		public var speed : int;
		protected var health : Number = 100;
		private var facing : int = 6;
		public var angle : Number = 180 * FP.RAD;
		
		private var map:Map;
		
		private var xmap : int;
		private var ymap : int;
		
		private var path:Path;
		
		private var bool:Boolean = true;
		private var endloc:Vector.<int>;
		
		private var tileMoved:Number = 0;
		
		public function EnemyTemplate(sp:int, img:Class, map:Map,xBegin:int, yBegin:int, xEnd:int, yEnd:int, p:Path) {
			set_speed(sp);
			set_image(img);
			
			set_size(1, 1);
			
			this.map = map;
			//sets the end loc
			setEndLoc(xEnd, yEnd);
			//set the begin loc
			set_position(xBegin, yBegin);
			
			path = p;
		}
		
		override public function added():void {
			this.layer = References.ENEMYLAYER;

			usePath();	
		}
		
		/**
		 * calculate a path
		 */
		public function calcPath(x:int, y:int):Boolean {
			var status:Boolean = false;
			
			var p:Path = Pathfinding.pathDijkstra(map.getGroundTile(this.xmap, this.ymap), map.getGroundTile(x,y));
			
			if (p) {
				path = p;
				status = true;
				usePath();				
			}
			
			return status;
		}
		
		/**
		 * update the character
		 */
		override public function update():void {
			move();
		}
		
		/**
		 * change the path we are using
		 */
		public function usePath():void {
			//change facing
			facing = path.getDirection(this.xmap, this.ymap);
		}
		
		/**
		 * move the character
		 */
		protected function move():void {
			setFacing();
			if (facing != 5) {
				var dx:Number = (this.speed * (Math.cos(this.angle))) * FP.elapsed;
				var dy:Number = (this.speed * (Math.sin(this.angle))) * FP.elapsed;
				this.x += dx;
				this.y += dy;
				tileMoved += (dx + dy);
			}
			else {
				attack();
			}
			inTileRange();
		}
		
		private function attack():void {
			
		}
		
		/**
		 * 
		 * Get the real x and y location of the grid
		 */
		private function inTileRange():void {
			if (Math.abs(tileMoved) >= References.TILESIZE) {
				tileMoved = 0;
				
				/**
				 * get the current location from the path 
				 */
				xmap = path.getNextX();
				ymap = path.getNextY();
				
				/**
				 * reset the x position and y-position
				 */
				this.x = References.TILESIZE * xmap + References.TILESIZE / 2;
				this.y = References.TILESIZE * ymap + References.TILESIZE / 2;
				/**
				 * get the next direction to move to
				 */
				usePath();
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
		 * check if a object is over the path
		 * @param	x
		 * @param	y
		 * @return true if the x,y is in path
		 */
		public function checkPath(x:int, y:int):Boolean {
			return path.containsPoint(x, y);
		}
		
		/**
		 * get the number of tiles still needed to be done
		 */
		public function getLength():int {
			return path.getLength();
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
			set_imgSize(2 / 3);
		}
		
		/**
		 * update the path
		 */
		public function updatePath():Boolean {
			return calcPath(endloc[0], endloc[1]);
		}
		
		/**
		 * set the ending location of this monster
		 * @param	x
		 * @param	y
		 */
		public function setEndLoc(x:int, y:int):void {
			endloc = new Vector.<int>();
			endloc.push(x);
			endloc.push(y);
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