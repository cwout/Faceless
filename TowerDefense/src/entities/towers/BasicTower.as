package entities.towers 
{
	import entities.GroundTile;
	import entities.projectiles.BasicBall;
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
		public var image : Image;
		
		override public function added():void 
		{
			image = new Image(Assets.BASICTOWER);
			this.graphic = image;
			image.centerOrigin();
			this.x = 300;
			this.y = 300;
			
		}
		
		override public function update():void 
		{
			if (Input.check(Key.LEFT)) {
				image.angle += 5;
				
			}
			
			if (Input.pressed(Key.SPACE)) {
				world.add(new BasicBall(this.x + 30, this.y, image.angle));
			}
		}
		
	}

}