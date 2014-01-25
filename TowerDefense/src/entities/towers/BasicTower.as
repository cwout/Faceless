package entities.towers 
{
	import entities.GroundTile;
	import entities.projectiles.BasicBall;
	import flash.ui.Mouse;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	import net.flashpunk.utils.Input; 
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author Shadowblink
	 */
	public class BasicTower extends GroundTile
	{
		//Range van de toren
		public var range: int = 400;
		//De snelheid van de bal die wordt afgevuurd
		public var ballspeed: int = 500;
		//De fire cooldown
		public var cooldown: int = 0;
		
		public var image : Image;
		
		//Constructor
		public function BasicTower() 
		{
			super(null, 0, 0);
		}
		
		override public function added():void 
		{
			//Toren op de voorgrond van het scherm zetten
			this.layer = -5000;
<<<<<<< HEAD
			//De image van de toren inladen
=======
			super.added();
>>>>>>> 7552d02458cbc2fe3d12f7ff4ad2e9c9913c8076
			image = new Image(Assets.BASICTOWER);
			//De image koppellen
			this.graphic = image;
			//Het centrum zetten al centrum van de image
			image.centerOrigin();
			
			//Cordinaten van de toren initialiseren (gewoon voor test purposes)
			this.x = 300;
<<<<<<< HEAD
			this.y = 300;
			
			
=======
			this.y = 300;			
>>>>>>> 7552d02458cbc2fe3d12f7ff4ad2e9c9913c8076
		}
		
		override public function update():void 
		{
		
			//Test Purposes
			if (Input.check(Key.A)) {
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
			}
			
			if (Input.check(Key.SPACE)) {
				
			}
			//End test purposes
			
			//De cooldown van de toren verlagen als hij hoger dan 0 is
			if(this.cooldown > 0)
				this.cooldown -= 1 * FP.elapsed;
		}
		
		public function shoot(x : int, y : int, objectSpeed : int, objectAngle : Number):void 
		{	
			//Vars
			var distance: Number;
			var time: Number;
			//End vars
			
			//De afstand berekenen tussen tower en enemy
			distance = FP.distance(this.x, this.y, x, y);
			//De tijd berekenen hoe lang de bal er over al doen
			time = distance / ballspeed;
			
			//De verwachte x en y waarden verhogen a.d.h.v. enemyHoek * enemySpeed * de tijd die de bal er over moet doen
			x += ((objectSpeed + 10) * (Math.cos(objectAngle))) * time;
			y += ((objectSpeed + 10) * (Math.sin(objectAngle))) * time;
			
			
			//Als het object zich rechts van ons bevind 
			if(x >= this.x)
				image.angle = ((Math.atan((y - this.y) / (x - this.x))) * FP.DEG);
			//Als het object zich links van ons bevind
			else
				image.angle = 180 + ((Math.atan((y - this.y) / (x - this.x))) * FP.DEG);
			//Als de toren van zijn cooldown af is mag hij schieten
			if(this.cooldown == 0) {
				world.add(new BasicBall((image.scaledWidth / 2), this.x, this.y, image.angle, ballspeed));
				//Cooldown resetten
				this.cooldown = 60;
			}
		}
	}

}