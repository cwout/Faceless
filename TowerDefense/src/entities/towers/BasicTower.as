package entities.towers 
{
	import entities.GroundTile;
	import entities.map.Map;
	import entities.projectiles.BasicBall;

	import entities.testenemy.EnemyTemplate;
	
	import flash.ui.Mouse;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Input; 
	import net.flashpunk.utils.Key;
	import worlds.TestWorld;
	
	/**
	 * ...
	 * @author Shadowblink
	 */
	public class BasicTower extends GroundTile
	{
		//Range van de toren
		public var range: int = 200;
		//De snelheid van de bal die wordt afgevuurd
		public var ballspeed: int = 500;
		//De fire cooldown
		public var cooldown: int = 0;
		//De damage van de projectitelen
		public var damage: Number = 20;
		
		public var image : Image;
		
		//Constructor
		public function BasicTower(map : Map, x : int, y : int, height : int ) 
		{
			super(map, x, y , height);
			this.placeable = false;
			this.passable = false;
		}
		
		override public function added():void 
		{
			//De image van de toren inladen
			super.added();
			image = new Image(Assets.BASICTOWER);
			//De image koppellen
			addGraphic(image);
			//Het centrum zetten al centrum van de image
			image.centerOrigin();

		}
		
		override public function update():void 
		{
		
			//Test Purposes
			/*if (Input.check(Key.A)) {
				image.angle += 5;
			}
			if (Input.check(Key.E)) {
				image.angle -= 5;
			}
			
			if (Input.check(Key.LEFT)) {
				this.x -= 220 * FP.elapsed;
			}
			
			if (Input.check(Key.RIGHT)) {
				this.x += 220 * FP.elapsed;
			}
			
			if (Input.check(Key.UP)) {
				this.y -= 220 * FP.elapsed;
			}
			
			if (Input.check(Key.DOWN)) {
				this.y += 220 * FP.elapsed;
			}*/
			
			
			//End test purposes
			
			//De cooldown van de toren verlagen als hij hoger dan 0 is
			if(this.cooldown > 0)
				this.cooldown -= 1 * FP.elapsed;
				
				
			var enemyList : Array = [];

			// Then, we populate the array with all existing Enemy objects!
			FP.world.getClass(EnemyTemplate, enemyList);

			// Finally, we can loop through the array and call each Enemy's die() function.
			for each (var enemy:EnemyTemplate in enemyList) {
				if (FP.distance(this.x, this.y, enemy.x, enemy.y) < this.range)
					shoot(enemy.x, enemy.y, enemy.speed, enemy.angle);
			}
		}
			
		
				
		public function shoot(x : int, y : int, objectSpeed : int, objectAngle : Number):void 
		{	
			var enemies : Vector.<EnemyTemplate>;
			
			world.getClass(EnemyTemplate, enemies);
			
			//Vars
			var distance: Number;
			var time: Number;
			//End vars
			
			world.getClass(EnemyTemplate, Object);

			//De afstand berekenen tussen tower en enemy
			distance = FP.distance(this.x, this.y, x, y);
			//De tijd berekenen hoe lang de bal er over al doen
			time = distance / ballspeed;
			
			var newx: Number;
			var newy: Number;
			var i: int;
			var precision: int = 30;
			//De verwachte x en y waarden verhogen a.d.h.v. enemyHoek * enemySpeed * de tijd die de bal er over moet doen
			for (i = 0; i < 5; i++) {
				newx = x;
				newy = y;
				
				newx +=  objectSpeed * Math.cos(objectAngle) * time;
				newy += objectSpeed * Math.sin(objectAngle) * time;
				
				distance = FP.distance(this.x, this.y, newx, newy);
				time = distance / ballspeed;
				
				
			}
			
			x += ((objectSpeed) * (Math.cos(objectAngle))) * time;
			y += ((objectSpeed) * (Math.sin(objectAngle))) * time;
			
			//Als het object zich rechts van ons bevind 
			if(x >= this.x)
				image.angle = ((Math.atan((y - this.y) / (x - this.x))) * FP.DEG);
			//Als het object zich links van ons bevind
			else
				image.angle = 180 + ((Math.atan((y - this.y) / (x - this.x))) * FP.DEG);
			//Als de toren van zijn cooldown af is mag hij schieten
			if(this.cooldown == 0) {
				world.add(new BasicBall((image.scaledWidth / 2), this.x, this.y, image.angle, ballspeed, damage));
				//Cooldown resetten
				this.cooldown = 30;
			}
		}
	}

}