package entities.gui 
{
	import flash.display.PixelSnapping;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Wout Coenen
	 */
	public class GuiButtonAddTower extends GuiButton
	{
		[Embed(source = "../../assets/MenuButtonAddTower.png")] private const IMG: Class;
		[Embed(source = "../../assets/MenuButtonAddTowerPressed.png")] private const IMG_PRESSED: Class;
		
		public function GuiButtonAddTower(eventFunction: Function, posX: int, posY: int) 
		{
		
			super(eventFunction, posX, posY);
		
		}
		
		override public function added(): void
		{
			
			image = new Image(IMG);
			graphic = image;
			sizeX = image.width;
			sizeY = image.height;
			image.centerOrigin();
			mask = new Pixelmask(IMG, -(sizeX / 2), -(sizeY / 2));
			setHitboxTo(mask);
			
			idString = "GuiButtonAddTower";
			
		}
		
		override public function onSelect(): void
		{
			image = new Image(IMG_PRESSED);
			graphic = image;
			sizeX = image.width;
			sizeY = image.height;
			image.centerOrigin();
		}
		
		override public function onDeselect(): void
		{
			image = new Image(IMG);
			graphic = image;
			sizeX = image.width;
			sizeY = image.height;
			image.centerOrigin();
			mask = new Pixelmask(IMG, -(sizeX / 2), -(sizeY / 2));
			setHitboxTo(mask);
		}
		
	}

}