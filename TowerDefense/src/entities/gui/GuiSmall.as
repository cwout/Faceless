package entities.gui 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.FP;
	/**
	 * The small gui for adding towers etc.
	 * @author Wout Coenen
	 */
	public class GuiSmall extends Entity
	{
		
		private var sizeX: int;
		private var sizeY: int;
		private var image : Image;
		private var triggerSizeX: int;
		private var triggerSizeY: int;
		private var buttonCount: int;
		private var eventFunction: Function;
		
		public function GuiSmall(triggerSizeX: int, triggerSizeY: int, eventFunction: Function) 
		{
			super();
			this.triggerSizeX = triggerSizeX;
			this.triggerSizeY = triggerSizeY;
			this.eventFunction = eventFunction;
		}
		
		override public function added() : void
		{
			
			image = new Image(Assets.GUISMALLBACKGROUND);
			graphic = image;
			sizeX = image.width;
			sizeY = image.height;
			image.centerOrigin();
			x = FP.width - (triggerSizeX + sizeX / 2);
			y = FP.height - (triggerSizeY + sizeY / 2);
			layer = References.GUILAYER;
			
			//Add buttons here, add them in the same way as shown and change the buttonCount
			buttonCount = 4;
			var i: int = 1;
			FP.world.add(new GuiButtonAddTower(eventFunction, x - sizeX / 2 + sizeX / (buttonCount + 1) * i++, y));
			FP.world.add(new GuiButtonAddTower(eventFunction, x - sizeX / 2 + sizeX / (buttonCount + 1) * i++, y));
			FP.world.add(new GuiButtonAddTower(eventFunction, x - sizeX / 2 + sizeX / (buttonCount + 1) * i++, y));
			FP.world.add(new GuiButtonAddTower(eventFunction, x - sizeX / 2 + sizeX / (buttonCount + 1) * i++, y));
			
		}
		
		override public function update() : void
		{
			
			//delete the menu
			if (Input.mouseUp)
			{
				FP.world.remove(this);
			}
			
		}
		
	}

}