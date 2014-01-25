package entities.gui 
{
	import net.flashpunk.Entity;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	/**
	 * ...
	 * @author Wout Coenen
	 */
	public class GuiButton extends Entity
	{
		
		protected var identifier: String;
		protected var eventFunction: Function;
		protected var sizeX: int;
		protected var sizeY: int;
		protected var image : Image;
		protected var idString: String;
		protected var isSelected: Boolean = false;
		
		public function GuiButton(eventFunction: Function, posX: int, posY: int) 
		{
			
			super();
			this.eventFunction = eventFunction;
			x = posX;
			y = posY;
			this.identifier = "GuiButton";
			layer = -101
			
		}
		
		override public function update() : void
		{
			
			if (Input.mouseUp)
			{
				if (collidePoint(x, y, Input.mouseX, Input.mouseY))
				{
					eventFunction(idString);
				}
				
				FP.world.recycle(this);
			}
			else if (!isSelected && collidePoint(x, y, Input.mouseX, Input.mouseY))
			{
				isSelected = true;
				onSelect();
			}
			else if (isSelected && !collidePoint(x, y, Input.mouseX, Input.mouseY))
			{
				isSelected = false;
				onDeselect();
			}
			
		}
		
		public function onSelect(): void
		{
			return;
		}
		
		public function onDeselect(): void
		{
			return;
		}
		
	}

}