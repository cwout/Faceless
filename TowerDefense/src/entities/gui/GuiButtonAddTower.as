package entities.gui 
{
	import flash.display.PixelSnapping;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.graphics.Image;
	/**
	 * A button for adding a tower
	 * @author Wout Coenen
	 */
	public class GuiButtonAddTower extends GuiButton
	{
		
		public function GuiButtonAddTower(eventFunction: Function, posX: int, posY: int) 
		{
		
			super(eventFunction, posX, posY);
		
		}
		
		/**
		 * Sets the image and the idString (for event handling)
		 */
		override public function added(): void
		{
			
			image = new Image(Assets.GUISMALLBUTTONADDTOWER);
			graphic = image;
			sizeX = image.width;
			sizeY = image.height;
			image.centerOrigin();
			mask = new Pixelmask(Assets.GUISMALLBUTTONADDTOWER, -(sizeX / 2), -(sizeY / 2));
			setHitboxTo(mask);
			
			idString = "GuiButtonAddTower";
			
		}
		
		/**
		 * changes the image of the button when the mouse hovers over it
		 */
		override public function onSelect(): void
		{
			image = new Image(Assets.GUISMALLBUTTONADDTOWER_PRESSED);
			graphic = image;
			sizeX = image.width;
			sizeY = image.height;
			image.centerOrigin();
		}
		
		/**
		 * changes back the image when the mouse leaves the button
		 */
		override public function onDeselect(): void
		{
			image = new Image(Assets.GUISMALLBUTTONADDTOWER);
			graphic = image;
			sizeX = image.width;
			sizeY = image.height;
			image.centerOrigin();
		}
		
	}

}