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
		
		/**
		 * Call this method to initialize the GUI
		 */
		public static function init():void
		{
			
			//initialize the main GUI-button
			FP.world.add(new GuiTrigger());
			
			//initilize the cursor
			FP.world.add(new CustomCursor());
			
		}
		
		/**
		 * Triggers the small menu, for adding towers etc.
		 * @param	triggerSizeX the width of the trigger in the bottom right corner, which this menu shouldn't overlap
		 * @param	triggerSizeY the height of the trigger in the bottom right corner, which this menu shouldn't overlap
		 */
		public static function triggerMenuSmall(triggerSizeX: int, triggerSizeY: int): void
		{
			
			FP.world.add(new GuiSmall(triggerSizeX, triggerSizeY, funcP));
			
		}
		
		public static function clickedMenuSmall(idString: String): void
		{
			trace (idString);
		}
		
	}

}