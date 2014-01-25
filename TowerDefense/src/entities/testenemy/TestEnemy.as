package entities.testenemy 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Shadowblink
	 */
	public class TestEnemy extends Entity 
	{
		public var image : Image;
		public var speed : int = 100;
		public var angle : Number = 180 * FP.RAD;
		
		override public function added():void 
		{
			this.layer = -5000;
			image = new Image(Assets.TestEnemy);
			this.graphic = image;
			image.centerOrigin();
			this.x = 800;
			this.y = 300;
		}
		
		override public function update():void 
		{
			
			move();
			
			if (Input.pressed(Key.R)) {
				this.x = 800;
			}
			
			if (Input.check(Key.F)) {
				this.angle += (5 * FP.RAD);
			}
		}
		
		public function isInRange(x : int, y : int):Boolean {
			return(true);
		}
		
		private function move():void 
		{
			this.x += (this.speed * (Math.cos(this.angle))) * FP.elapsed;
			this.y += (this.speed * (Math.sin(this.angle))) * FP.elapsed;
		}
	}

}