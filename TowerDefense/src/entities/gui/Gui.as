package entities.gui 
{
	import entities.map.Map;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import entities.towers.BasicTower;
	import net.flashpunk.World;
	import worlds.TestWorld;
	
	/**
	 * main Gui-class, every other class has to call this one to interact with the GUI
	 * To add buttons to the small menu, make a new GuiButton...-class and edit the GuiSmall-class to add them to the screen
	 * @author Wout Coenen
	 */
	public class Gui
	{
		
		private static var funcP: Function = clickedMenuSmall;
		private static var useCustomCursor: Boolean = false;
		public static var map: Map;
		
		/**
		 * Call this method to initialize the GUI
		 */
		public static function init():void
		{
			
			initWithMap(new Map());
			
		}
		
		/**
		 * Call this method to initiliaze the GUI with a specific map
		 * @param	mapVar the map to be used
		 */
		public static function initWithMap(mapVar: Map): void
		{
			//initialize the main GUI-button
			FP.world.add(new GuiTrigger());
			
			//initilize the cursor
			if (useCustomCursor)
			{
				FP.world.add(new CustomCursor());
			}
			
			//add a var for the map
			map = mapVar;
			
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
			
			if (idString == "GuiButtonAddTower")
			{
				FP.world.add(new GuiNewTowerOverlay(funcP));
			}
			if (idString == "AddTower")
			{
				var height: int = 0;
				if (map.mapData != null)
					height = map.getGroundTile(Input.mouseX / References.TILESIZE, Input.mouseY / References.TILESIZE).groundHeight;
				FP.world.add(new BasicTower(null, Input.mouseX / References.TILESIZE, Input.mouseY / References.TILESIZE, height));
			}
			
		}
		
	}

}