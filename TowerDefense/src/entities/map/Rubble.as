package entities.map 
{
	import entities.GroundTile;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Olivier de Schaetzen
	 */
	public class Rubble extends GroundTile 
	{
		
		public function Rubble(map : Map, x : int = 0, y : int = 0, groundHeight : int = 0)
		{
			super(map, x, y, groundHeight);
		}
		
		override public function added():void 
		{
			super.added();
			var rock : Image = new Image(Assets.RUBBLE);
			addGraphic(rock);
			rock.centerOrigin();
			this.passable = false;
			this.placeable = false;
		}
		
	}

}