package entities.gui 
{
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
	public class GuiNewTowerOverlay extends Entity
	{
		
		private var sizeX: int;
		private var sizeY: int;
		private var image : Image;
		private var eventFunction : Function;
		
		public function GuiNewTowerOverlay(eventFunction : Function) 
		{
			super();
			this.eventFunction = eventFunction;
		}
		
		override public function added() : void
		{
			
			image = new Image(Assets.GUIADDTOWEROVERLAY);
			graphic = image;
			image.blend = BlendMode.OVERLAY;
			sizeX = image.height;
			sizeY = image.width;
			image.centerOrigin();
			x = Input.mouseX % References.TILESIZE + 20;
			y = Input.mouseY % References.TILESIZE + 20;
			layer = References.GUILAYER;
			setHitbox(-(References.TILESIZE / 2), -(References.TILESIZE / 2), References.TILESIZE, References.TILESIZE);
			
		}
		
		override public function update() : void
		{
			
			x = Input.mouseX - (Input.mouseX % References.TILESIZE) + 20;
			y = Input.mouseY - (Input.mouseY % References.TILESIZE) + 20;
			
			if (Input.mouseReleased)
			{
				eventFunction("AddTower");
				FP.world.recycle(this);
			}
			else if (Input.check(Key.ESCAPE))
			{
				FP.world.recycle(this);
			}
		
		}
		
	}

}