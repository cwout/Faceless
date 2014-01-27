package entities 
{
	import entities.map.Map;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Spritemap;
	import net.flashpunk.graphics.TiledImage;
	
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
			
			makeShadow();
			//(this.graphic as Image).angle = Math.floor(Math.random()*4)*90;
			//(this.graphic as Image).color = 0x222222 + 0x1D1D1D * (1+groundHeight);//Image.createRect(40, 40, 0x00CC00 - 0x001500 * (1+groundHeight) , 1);
		}
		
		public function makeShadow() : void
		{
			var shadow : Spritemap = new Spritemap(Assets.SHADOW, 40, 40);
			var ground : Image = this.graphic as Image;
			
			var source : Rectangle = new Rectangle(0, 0, 40, 40);
			var p : Point = new Point(0, 0);
			var sp : Point = new Point(0, 0);
			
			var tile : GroundTile;
			
			//the topmost tile;
			tile = map.getGroundTile(gridX, gridY - 1);
			if (tile != null && tile.groundHeight > groundHeight) {
				shadow.setFrame(1, 0);
				ground._bitmap.bitmapData.copyPixels(shadow._bitmap.bitmapData, source, p, shadow._bitmap.bitmapData, null, true);
			}
			
			//the bottom tile;
			tile = map.getGroundTile(gridX, gridY + 1);
			if (tile != null && tile.groundHeight > groundHeight) {
				shadow.setFrame(3, 0);
				ground._bitmap.bitmapData.copyPixels(shadow._bitmap.bitmapData, source, p, shadow._bitmap.bitmapData, null, true);
			}
			
			//the left tile;
			tile = map.getGroundTile(gridX -1 , gridY);
			if (tile != null && tile.groundHeight > groundHeight) {
				shadow.setFrame(2, 0);
				ground._bitmap.bitmapData.copyPixels(shadow._bitmap.bitmapData, source, p, shadow._bitmap.bitmapData, null, true);
			}
			
			//the left tile;
			tile = map.getGroundTile(gridX + 1 , gridY);
			if (tile != null && tile.groundHeight > groundHeight) {
				shadow.setFrame(0, 0);
				ground._bitmap.bitmapData.copyPixels(shadow._bitmap.bitmapData, source, p, shadow._bitmap.bitmapData, null, true);
			}
			
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