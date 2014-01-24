package entities.projectiles 
{
	import flash.automation.KeyboardAutomationAction;
	import flash.events.DRMCustomProperties;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author Shadowblink
	 */
	public class BasicBall extends Entity 
	{
		public var image: Image;
		public var speed: Number;
		public var angle: Number;
		
		public function BasicBall(width: int, x : int, y : int, angle : Number, speed: Number)
		{
			var temp: Number;
			temp = Math.cos(this.angle);
			this.x = x + (width * temp);
			temp = Math.sin(this.angle);
			this.y = y - (width * temp);
			this.speed = speed;
			this.angle = angle *= FP.RAD;

			this.x = x;
			this.y = y;
		}
		
		override public function added():void 
		{
			image = new Image(Assets.BASICBALL);
			this.graphic = image;
			image.centerOrigin();

			
		}
		
		override public function update():void 
		{
			var temp: Number;
			temp = Math.cos(this.angle);
			this.x += (this.speed * temp) * FP.elapsed;
			temp = Math.sin(this.angle);
			this.y += (this.speed * temp) * FP.elapsed;
		}
	}

}