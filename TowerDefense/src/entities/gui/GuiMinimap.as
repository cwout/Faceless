package entities.gui 
{
	import entities.GroundTile;
	import flash.display.BitmapData;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.TiledImage;
	/**
	 * ...
	 * @author Olivier de Schaetzen
	 */
	public class GuiMinimap extends Entity
	{
		public var image : Image;
		private var scaling: int = 4;
		
		public function GuiMinimap() 
		{
		}
		
		override public function added():void 
		{
			
			makeMap();
			
			//add overlay for current position
			FP.world.add(new GuiMinimapCameraOverlay(scaling));
			
		}
		
		public function makeMap():void
		{
			layer = References.GUILAYER;
			var data : BitmapData = new BitmapData(Gui.map.mapWidth, Gui.map.mapHeight, false, 0xFF000000);
			var tile : GroundTile;
			for (var i : int = 0 ; i < Gui.map.mapWidth ; i++) {
				for (var k : int = 0 ; k < Gui.map.mapHeight ; k++) {
					tile = Gui.map.getGroundTile(i, k);
					data.setPixel(i, k, (3 + tile.groundHeight) * 0x1C1C1C);
				}
			}
			image = new Image(data);
			image.scale = scaling;
			image.scrollX = 0;
			image.scrollY = 0;
			image.alpha = 0.8;
			this.graphic = image;
			x = 0;
			y = FP.height - image.scaledHeight;
		}
		
	}

}