package entities.gui 
{
	import entities.map.Map;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import entities.towers.BasicTower;
	import entities.testenemy.EnemyTemplate;
	
	/**
	 * main Gui-class, every other class has to call this one to interact with the GUI
	 * To add buttons to the small menu, make a new GuiButton...-class and edit the GuiSmall-class to add them to the screen
	 * @author Wout Coenen
	 */
	public class Gui
	{
		
		private static var funcP: Function = eventHandler;
		private static var useCustomCursor: Boolean = false;
		public static var map: Map;
		private static var debugEnabled: Boolean;
		private static var guiTowerSelectedOverlay:GuiTowerSelectedOverlay = new GuiTowerSelectedOverlay();
		
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
			//add a var for the map
			map = mapVar;
			
			//we add the minimap
			FP.world.add(new GuiMinimap());
			
			//initialize the main GUI-button
			FP.world.add(new GuiTrigger());
			
			//initilize the cursor
			if (useCustomCursor)
			{
				FP.world.add(new CustomCursor());
			}
			
			FP.world.add(guiTowerSelectedOverlay);
			
			FP.console.enable();
			FP.console.visible = false;
			debugEnabled = false;
			
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
		public static function eventHandler(idString: String): void
		{
			//DEBUG LINE
			trace (idString);
			
			if (idString == "GuiButtonAddTower")
			{
				FP.world.add(new GuiNewTowerOverlay(funcP));
			}
			else if (idString == "AddTower")
			{
				var tileX: int = (Input.mouseX + FP.camera.x) / References.TILESIZE;
				var tileY: int = (Input.mouseY + FP.camera.y) / References.TILESIZE;
						
				if (Gui.map.getGroundTile(tileX, tileY).placeable)
				{
					var pathsExist:Boolean = true;
					var wasPassable: Boolean = Gui.map.getGroundTile(tileX, tileY).passable;
					Gui.map.getGroundTile(tileX, tileY).passable = false;
				
					var enemyList : Array = new Array();
					FP.world.getClass(EnemyTemplate, enemyList);
					for each (var enemy:EnemyTemplate in enemyList)
					{
						pathsExist &&= enemy.updatePath();
					}
					
					Gui.map.getGroundTile(tileX, tileY).passable = wasPassable;
					
					if (pathsExist)
					{
						map.addTower(tileX, tileY);
						guiTowerSelectedOverlay.doNotSelectNextFrame();
					}

				}
			}
			else if (idString == "ToggleDebug")
			{
				if (debugEnabled)
				{
					debugEnabled = false;
					FP.console.visible = false;
				}
				else
				{
					debugEnabled = true;
					FP.console.visible = true;
				}
		
			}
			
		}
		
	}

}