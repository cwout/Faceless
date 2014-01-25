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
			this.x -= speed * FP.elapsed;
			
			if (Input.pressed(Key.R)) {
				this.x = 800;
			}
		}
		
		public function isInRange(x : int, y : int):Boolean {
			return(true);
		}
	}

}