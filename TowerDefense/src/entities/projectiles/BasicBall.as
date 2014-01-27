package entities.projectiles 
{
	import entities.map.Map;
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
		public var damage: Number;
		public var image: Image;
		public var speed: Number;
		public var angle: Number;
		
		public function BasicBall(width: Number, x : int, y : int, angle : Number, speed: Number, damge: Number)
		{
			this.layer = References.PROJECTILELAYER;
			//De speed updaten naar de gewenste speed (Nodig voor update functie)
			this.speed = speed;
			//Doorgegeven angle is in graden, deze omvormen naar radialen en opslagen als globale variabele (Nodig voor update functie)
			this.angle = angle *= FP.RAD;
			//Doorgegeven damage toevoegen;
			this.damage = damage;
	
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
			
			var map: Map = new Map();
			if (this.x < 0 || this.x > (map.mapWidth * References.TILESIZE)) {
				if (this.y < 0 || this.y < (map.mapHeight * References.TILESIZE)) {
					die();
				}
			}
		}
		
		private function die(): void {
			FP.world.remove(this);
		}
		
		
	}

}