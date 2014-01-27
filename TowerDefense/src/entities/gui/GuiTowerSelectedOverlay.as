package entities.gui 
{
	import entities.towers.BasicTower;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	
	/**
	 * overlay when a tower is selected
	 * @author Wout Coenen
	 */
	public class GuiTowerSelectedOverlay extends Entity
	{
		
		private var sizeX: int;
		private var sizeY: int;
		private var image : Image;
		private var tileX: int;
		private var tileY: int;
		private var clicked: Boolean;
		
		public function GuiTowerSelectedOverlay() 
		{
			super();
			clicked = false;
		}
		
		override public function added() : void
		{
			image = new Image(Assets.GUIADDTOWEROVERLAY);
			graphic = image;
			layer = References.GUILAYER;
			sizeX = image.height;
			sizeY = image.width;
			image.alpha = 0.4;
			image.color = 0xDDDDDD;
			image.centerOrigin();
			x = (Input.mouseX + FP.camera.x) - (Input.mouseX + FP.camera.x) % References.TILESIZE + 20;
			y = (Input.mouseY + FP.camera.y) - (Input.mouseY + FP.camera.y) % References.TILESIZE + 20;
			image.visible = false;
			
			tileX = (Input.mouseX + FP.camera.x) / References.TILESIZE;
			tileY = (Input.mouseY + FP.camera.y) / References.TILESIZE;
			
		}
		
		override public function update() : void
		{
			
			tileX = (Input.mouseX + FP.camera.x) / References.TILESIZE;
			tileY = (Input.mouseY + FP.camera.y) / References.TILESIZE;
			
			if (Input.mousePressed)
				clicked = true;
			
			image.visible = Gui.map.getGroundTile(tileX, tileY) is BasicTower;
			if (image.visible)
			{
				x = (Input.mouseX + FP.camera.x) - (Input.mouseX + FP.camera.x) % References.TILESIZE + 20;
				y = (Input.mouseY + FP.camera.y) - (Input.mouseY + FP.camera.y) % References.TILESIZE + 20;
				if (clicked && Input.mouseReleased)
				{
					clicked == false;
					Gui.eventHandler("TowerSelected");
				}
			}
			
		}
		
		public function doNotSelectNextFrame(): void
		{
			clicked = false;
		}
		
	}

}