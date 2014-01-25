package entities.gui 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.masks.Pixelmask;
	/**
	 * ...
	 * @author Wout Coenen
	 */
	public class CustomCursor extends Entity 
	{
		
		private var sizeX: int;
		private var sizeY: int;
		public var image : Image;
		
		[Embed(source = "../../assets/CustomCursor.png")] public const CUSTOMCURSOR : Class;
		
		public function CustomCursor() 
		{
			
			super();
			
		}
		
		override public function added():void
		{
			
			image = new Image(CUSTOMCURSOR);
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