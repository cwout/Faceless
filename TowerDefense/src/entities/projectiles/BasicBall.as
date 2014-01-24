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
		
		public function BasicBall(width: Number, x : int, y : int, angle : Number, speed: Number)
		{
			//De speed updaten naar de gewenste speed (Nodig voor update functie)
			this.speed = speed;
			//Doorgegeven angle is in graden, deze omvormen naar radialen en opslagen als globale variabele (Nodig voor update functie)
			this.angle = angle *= FP.RAD;
	
			//Berekende start positie a.d.h.v. berekende lengte van de 'loop' FUCKING GONIOMETRIE
			this.x = x + (width * (Math.cos(this.angle)));
			this.y = y + (width * (Math.sin(this.angle)));
		}
		
		override public function added():void 
		{
			//Image koppellen aan toren
			image = new Image(Assets.BASICBALL);
			this.graphic = image;
			//Center van image --> center van entity
			image.centerOrigin();
		}
		
		override public function update():void 
		{
			this.x += (this.speed * (Math.cos(this.angle))) * FP.elapsed;
			this.y += (this.speed * (Math.sin(this.angle))) * FP.elapsed;
		}
	}

}