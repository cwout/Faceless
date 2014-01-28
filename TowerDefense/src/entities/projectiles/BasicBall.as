package entities.projectiles 
{
	import entities.map.Map;
	import entities.testenemy.EnemyTemplate;
	import flash.automation.KeyboardAutomationAction;
	import flash.display.InteractiveObject;
	import flash.events.DRMCustomProperties;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import entities.gui.Gui;
	import net.flashpunk.World;
	
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
		public var ballHeight: int;
		
		public function BasicBall(width: Number, x : int, y : int, angle : Number, speed: Number, damage: Number, givenHeight: int)
		{
			this.layer = References.PROJECTILELAYER;
			//De speed updaten naar de gewenste speed (Nodig voor update functie)
			this.speed = speed;
			//Doorgegeven angle is in graden, deze omvormen naar radialen en opslagen als globale variabele (Nodig voor update functie)
			this.angle = angle *= FP.RAD;
			//Doorgegeven damage toevoegen;
			this.damage = damage;
			//Doorgeven Height
			this.ballHeight = givenHeight;
	
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
			
			var map: Map = Gui.map;
			map = FP.world.getInstance("map");
			if (this.x < 0 || this.x > (map.mapWidth * References.TILESIZE) || this.y < 0 || this.y > (map.mapHeight * References.TILESIZE))
			{
				die();
			}
	
			var enemyList : Array = [];

			// Then, we populate the array with all existing Enemy objects!
			FP.world.getClass(EnemyTemplate, enemyList);
			
			for each (var enemy:EnemyTemplate in enemyList) {
				if (FP.distance(this.x, this.y, enemy.x, enemy.y) < enemy.image.scaledWidth/2) {
					hit(enemy);
				}
			}

			
<<<<<<< HEAD
			if (map.getGroundTile((x / References.TILESIZE), (y / References.TILESIZE)) == null || map.getGroundTile((x / References.TILESIZE), (y / References.TILESIZE)).groundHeight > ballHeight)
=======
			if (map.getGroundTile((x / References.TILESIZE), (y / References.TILESIZE))==null || map.getGroundTile((x / References.TILESIZE), (y / References.TILESIZE)).groundHeight > ballHeight)
>>>>>>> 999230334d95f5dcda3e27fa87af26a135260c38
				die();
		}
		
		private function die(): void {
			FP.world.remove(this);
		}
		
		private function hit(enemy:EnemyTemplate): void {
			enemy.takeDamage(this.damage);
			die();
		}
		
		
	}

}