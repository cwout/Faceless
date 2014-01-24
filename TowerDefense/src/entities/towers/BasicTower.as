package entities.towers 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.Mask;
	
	/**
	 * ...
	 * @author Shadowblink
	 */
	public class BasicTower extends Entity 
	{
		
		override public function added():void 
		{
			this.graphic = new Image(Assets.BASICTOWER);
		}
	}

}