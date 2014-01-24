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
		
		public function BasicBall(x : int, y : int, angle : Number)
		{
			angle *= FP.RAD;
			
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
			this.x += (300 * FP.elapsed);
		}
	}

}