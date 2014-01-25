package entities.gui 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.utils.Input;
	/**
	 * The small button which is used to trigger the gui
	 * @author Wout Coenen
	 * 
	 */
	public class GuiTrigger extends Entity
	{
		
		private var sizeX: int;
		private var sizeY: int;
		private var image : Image;
		
		[Embed(source="../../assets/MenuTrigger.png")] public const MENUTRIGGER:Class;
		
		public function GuiTrigger() 
		{
			
			super();
			
		}
		
		override public function added():void
		{
			
			image = new Image(MENUTRIGGER);
			graphic = image;
			sizeX = image.width;
			sizeY = image.height;
			image.centerOrigin();
			x = FP.width - (sizeX / 2);
			y = FP.height - (sizeY / 2);
			layer = -100;
			mask = new Pixelmask(MENUTRIGGER, -(sizeX / 2), -(sizeY / 2));
			setHitboxTo(mask);
			
		}
		
		override public function update():void
		{
			
			if (Input.mousePressed)
			{
			if (collidePoint(x, y, Input.mouseX, Input.mouseY))
			{	
				Gui.triggerMenuSmall(sizeX, sizeY);
			}
			}
			
		}
		
	}

}