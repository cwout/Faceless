package entities.gui 
{
	import entities.towers.BasicTower;
	import flash.events.IMEEvent;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import flash.display.BlendMode;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Key;
	
	/**
	 * Selector for where to place a new tower
	 * @author Wout Coenen
	 */
	public class GuiNewTowerOverlay extends Entity {
    
		private var sizeX: int;
		private var sizeY: int;
		private var image : Image;
		private var eventFunction : Function;
		private var rangeIndicator: Image;
		
		public function GuiNewTowerOverlay(eventFunction : Function) {
			super();
			this.eventFunction = eventFunction;
		}
		
		override public function added() : void {
      
			image = new Image(Assets.GUIADDTOWEROVERLAY);
			sizeX = image.height;
			sizeY = image.width;
			image.alpha = 0.4;
			image.centerOrigin();
			x = (Input.mouseX + FP.camera.x) % References.TILESIZE + 20;
			y = (Input.mouseY + FP.camera.y) % References.TILESIZE + 20;
			layer = References.GUILAYER;
			setHitbox( -(References.TILESIZE / 2), -(References.TILESIZE / 2), References.TILESIZE, References.TILESIZE);
			
			rangeIndicator = Image.createCircle((new BasicTower(Gui.map, 0,0,0)).range, 0xDDDDDD, 0.2);
			rangeIndicator.centerOrigin();
			
			addGraphic(image);
			addGraphic(rangeIndicator);
		}
    
		override public function update() : void {
      
			x = (Input.mouseX + FP.camera.x) - ((Input.mouseX + FP.camera.x) % References.TILESIZE) + 20;
			y = (Input.mouseY + FP.camera.y) - ((Input.mouseY + FP.camera.y) % References.TILESIZE) + 20;
			var tileX: int = (Input.mouseX + FP.camera.x) / References.TILESIZE;
			var tileY: int = (Input.mouseY + FP.camera.y) / References.TILESIZE;
			var isPlaceable: Boolean = Gui.map.getGroundTile(tileX, tileY).placeable;
			
			//change overlay color
			if (isPlaceable)
				image.color = 0x77FF77;
			else
				image.color = 0xFF7777;
			
			if (Input.mouseReleased) {
				eventFunction("AddTower");
			if (!isPlaceable)
				FP.world.remove(this);
			}
			else if (Input.check(Key.ESCAPE))
			{
				FP.world.remove(this);
			}
		}
	}
}