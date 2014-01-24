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
		public var image : Image;
		override public function added():void 
		{
			image = new Image(Assets.BASICTOWER);
			this.graphic = image;
		}
	}

}