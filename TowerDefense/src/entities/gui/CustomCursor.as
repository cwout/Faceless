package entities.gui 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.masks.Pixelmask;
	/**
	 * Adds a customCursor to the game (cursor will be a frame late thought)
	 * @author Wout Coenen
	 */
	public class CustomCursor extends Entity 
	{
		
		private var sizeX: int;
		private var sizeY: int;
		private var image : Image;
		
		public function CustomCursor() 
		{
			
			super();
			
		}
		
		override public function added():void
		{
			
			image = new Image(Assets.CUSTOMCURSOR);
			graphic = image;
			sizeX = image.height;
			sizeY = image.width;
			image.centerOrigin();
			x = Input.mouseX;
			y = Input.mouseY;
			Input.mouseCursor = "hide";
			layer = -200;
			setHitbox(1, 1, 0 , 0);
			
		}
		
		override public function update():void
		{
			
			x = Input.mouseX;
			y = Input.mouseY;
			
		}
		
	}

}