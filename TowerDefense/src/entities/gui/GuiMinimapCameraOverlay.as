package entities.gui 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Wout Coenen
	 */
	public class GuiMinimapCameraOverlay extends Entity
	{
		
		private var screenWidth: int;
		private var screenHeight: int;
		private var cameraX: int;
		private var cameraY: int;
		private var img: Image;
		private var mapScale: int;
		private var mapWidth: int;
		private var mapHeight: int;
		
		public function GuiMinimapCameraOverlay(mapScale: int) 
		{
			this.mapScale = mapScale;
		}
		
		override public function added(): void
		{
			//width of the camera
			screenWidth = FP.width;
			screenHeight = FP.height;
			
			//position off the middle of the camera relative to the world
			cameraX = FP.camera.x + screenWidth / 2;
			cameraY = FP.camera.y + screenHeight / 2;
			
			//width and height of the map (in pixels)
			mapWidth = Gui.map.mapWidth * References.TILESIZE;
			mapHeight = Gui.map.mapHeight * References.TILESIZE;
			
			//set the x and y position
			x = cameraX * Gui.map.mapWidth * mapScale / mapWidth;
			
			img = Image.createRect(screenWidth / References.TILESIZE * mapScale, screenHeight / References.TILESIZE * mapScale, 0x222222, 0.5);
			img.scrollX = 0;
			img.scrollY = 0;
			img.centerOrigin();
			layer = References.GUILAYER;
			graphic = img;
		}
		
		override public function update(): void
		{
			cameraX = FP.camera.x + screenWidth / 2;
			cameraY = FP.camera.y + screenHeight / 2;
			x = cameraX * Gui.map.mapWidth * mapScale / mapWidth;
			y = FP.height - Gui.map.mapHeight * mapScale + cameraY * Gui.map.mapHeight * mapScale / mapHeight;
		}
		
	}

}