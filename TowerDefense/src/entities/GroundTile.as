package entities 
{
	import entities.map.Map;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	
	/**
	 * ...
	 * @author Olivier de Schaetzen
	 */
	public class GroundTile extends Entity 
	{
		
		//the speed at which entities can travel over this ground
		public var speed : int = 10;
		
		//the x position of this tile on the map
		public var gridX : int = 0;
		
		//the y position of this tile on the map
		public var gridY : int = 0;
		
		//the height of this tile on the map
		public var groundHeight : int = 0;
		
		//whether or not enemies can move through this tile
		public var passable : Boolean = true;
		
		//whether or not this piece of the ground can be replaced
		public var placeable : Boolean = true;
		
		//the tile which corresponds to this 
		public var groundTile : GroundTile = null;
		
		//the map on which this is located
		public var map : Map = null;
		
		public function GroundTile(map : Map, x : int = 0, y : int = 0, groundHeight : int = 0)
		{
			this.gridX = x;
			this.gridY = y;
			this.map = map;
			this.groundHeight = groundHeight;
			this.layer = References.GROUNDTILELAYER;
			
			this.x = gridX * References.TILESIZE + References.TILESIZE / 2;
			this.y = gridY * References.TILESIZE + References.TILESIZE / 2;
		}
		
		override public function added():void 
		{
			switch (groundHeight) {
				case 0:
					this.graphic = new Spritemap(Assets.ABYSS, 40, 40);
					break
				case 1:
					this.graphic = new Spritemap(Assets.MUD, 40, 40);
					break
				case 2:
					this.graphic = new Spritemap(Assets.MUDGRASS, 40, 40);
					break
				case 3:
					this.graphic = new Spritemap(Assets.GRASS, 40, 40);
					break;
				case 4:
					this.graphic = new Spritemap(Assets.ROCKGRASS, 40, 40);
					break;
				case 5:
					this.graphic = new Spritemap(Assets.ROCK, 40, 40);
					break;
				case 6:
					this.graphic = new Spritemap(Assets.SNOW, 40, 40);
					break;
			}
			(this.graphic as Spritemap).centerOrigin();
			(this.graphic as Spritemap).frame = Math.random() * 4;
			//(this.graphic as Image).angle = Math.floor(Math.random()*4)*90;
			//(this.graphic as Image).color = 0x222222 + 0x1D1D1D * (1+groundHeight);//Image.createRect(40, 40, 0x00CC00 - 0x001500 * (1+groundHeight) , 1);
		}
		
		public function getLeftTile():GroundTile
		{
			return map.getGroundTile(this.gridX - 1, this.gridY);
		}
		
		public function getRightTile():GroundTile
		{
			return map.getGroundTile(this.gridX + 1, this.gridY);
		}
		
		public function getTopTile():GroundTile
		{
			return map.getGroundTile(this.gridX, this.gridY - 1);
		}
		
		public function getBottomTile():GroundTile
		{
			return map.getGroundTile(this.gridX,this.gridY + 1);
		}
		
		override public function render():void 
		{
			var bx : int = FP.camera.x;
			var by : int = FP.camera.y;
			
			FP.camera.x = Math.floor(FP.camera.x);
			FP.camera.y = Math.floor(FP.camera.y);
			
			super.render();
			
			FP.camera.x = bx;
			FP.camera.y = by;
		}
		
	}

}