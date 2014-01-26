package entities.gui 
{
	import net.flashpunk.FP;
	/**
	 * main Gui-class, every other class has to call this one to interact with the GUI
	 * @author Wout Coenen
	 */
	public class Gui
	{
		
		private static var funcP: Function = clickedMenuSmall;
		public static var useCustomCursor: Boolean = false;
		
		/**
		 * Call this method to initialize the GUI
		 */
		public static function init():void
		{
			
			//initialize the main GUI-button
			FP.world.add(new GuiTrigger());
			
			//initilize the cursor
			if (useCustomCursor)
			{
				FP.world.add(new CustomCursor());
			}
			
		}
		
		/**
		 * Triggers the small menu, for adding towers etc.
		 * @param	triggerSizeX the width of the trigger in the bottom right corner, which this menu shouldn't overlap
		 * @param	triggerSizeY the height of the trigger in the bottom right corner, which this menu shouldn't overlap
		 */
		public static function triggerMenuSmall(triggerSizeX: int, triggerSizeY: int): void
		{
			
			//add the small menu to the screen
			FP.world.add(new GuiSmall(triggerSizeX, triggerSizeY, funcP));
			
		}
		
		/**
		 * triggered when a button has been clicked on the small menu
		 * @param	idString the String-identifier of the clicked button
		 */
		public static function clickedMenuSmall(idString: String): void
		{
			trace (idString);
		}
		
	}

}