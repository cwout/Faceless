package entities.gui 
{
	import net.flashpunk.Entity;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	/**
	 * Base-class for buttons, other buttons should extend this class
	 * @author Wout Coenen
	 */
	public class GuiButton extends Entity
	{
		
		protected var identifier: String;
		protected var eventFunction: Function;
		protected var sizeX: int;
		protected var sizeY: int;
		protected var image : Image;
		protected var imagePressed: Image;
		protected var idString: String;
		protected var isSelected: Boolean = false;
		
		/**
		 * 
		 * @param	eventFunction The function to be called when the button is clicked
		 * @param	posX The X-position where the center of the button has te be
		 * @param	posY The Y-position where the center of the button has te be
		 */
		public function GuiButton(eventFunction: Function, posX: int, posY: int) 
		{
			
			super();
			this.eventFunction = eventFunction;
			x = posX;
			y = posY;
			this.identifier = "GuiButton";
			layer = References.GUILAYER - 1;
			
		}
		
		/**
		 * Checks for a mouse-release on the button and triggers the eventFunction passed by the Gui-class
		 * Also checks if the mouse enters/leaves the button and calls onSelect()/onDeselect()
		 */
		override public function update() : void
		{
			
			if (Input.mouseUp)
			{
				if (collidePoint(x, y, Input.mouseX, Input.mouseY))
				{
					eventFunction(idString);
				}
				
				FP.world.remove(this);
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
		
		/**
		 * When the mouse moves over the button
		 */
		public function onSelect(): void
		{
			return;
		}
		
		/**
		 * When the mouse leaves the button
		 */
		public function onDeselect(): void
		{
			return;
		}
		
	}

}