package entities 
{
	import entities.map.Map;
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
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
		
		//the width and height of this tile
		public var tileWidth : int = 1;
		public var tileHeight : int = 1;
		
		public function GroundTile(map : Map, x : int = 0, y : int = 0, groundHeight : int = 0, tileWidth : int = 1, tileHeight : int = 1)
		{
			this.gridX = x;
			this.gridY = y;
			this.map = map;
			this.groundHeight = groundHeight;
			this.layer = References.GROUNDTILELAYER;
			this.tileHeight = tileHeight;
			this.tileWidth = tileWidth;
			
			this.x = gridX * References.TILESIZE + References.TILESIZE / 2;
			this.y = gridY * References.TILESIZE + References.TILESIZE / 2;
		}
		
		override public function added():void 
		{
			//for every groundtile beneath us
			for (var i : int = 0 ; i < tileWidth ; i++) {
				for (var k : int = 0 ; k < tileHeight ; k++) {
					//we make the groundtile
					var ngraphic : Spritemap = makeBaseGraphic();
					//put some shadows on it
					makeShadow(ngraphic, i, k);
					//correct the offset
					ngraphic.originX += i * -40;
					ngraphic.originY += k * -40;
					//and it it to our graphicslist
					addGraphic(ngraphic);
				}
			}
		}
		
		public function makeBaseGraphic():Spritemap
		{
			var ngraphic : Spritemap;
			switch (groundHeight) {
				case 0:
					ngraphic = new Spritemap(Assets.ABYSS, 40, 40);
					break
				case 1:
					ngraphic = new Spritemap(Assets.MUD, 40, 40);
					break
				case 2:
					ngraphic = new Spritemap(Assets.MUDGRASS, 40, 40);
					break
				case 3:
					ngraphic = new Spritemap(Assets.GRASS, 40, 40);
					break;
				case 4:
					ngraphic = new Spritemap(Assets.ROCKGRASS, 40, 40);
					break;
				case 5:
					ngraphic = new Spritemap(Assets.ROCK, 40, 40);
					break;
				case 6:
					ngraphic = new Spritemap(Assets.SNOW, 40, 40);
					break;
			}
			ngraphic.centerOrigin();
			ngraphic.frame = Math.random() * 4;
			return ngraphic;
		}
		
		public function makeShadow(ground : Image, i : int, k : int) : void
		{
			var shadow : Spritemap = new Spritemap(Assets.SHADOW, 40, 40);
			
			var source : Rectangle = new Rectangle(0, 0, 40, 40);
			var p : Point = new Point(0, 0);
			var sp : Point = new Point(0, 0);
			
			var tile : GroundTile;
			var i : int;
			
			//the topmost tile;
			tile = map.getGroundTile(gridX + i, gridY - 1 + k);
			if (tile != null && tile.groundHeight > groundHeight) {
				shadow.setFrame(1, tile.groundHeight - groundHeight - 1);
				blitShadow(ground._bitmap.bitmapData, shadow._bitmap.bitmapData, source, p);//ground._bitmap.bitmapData.copyPixels(shadow._bitmap.bitmapData, source, p, shadow._bitmap.bitmapData, null, true);
			}
			
			//the bottom tile;
			tile = map.getGroundTile(gridX + i, gridY + 1 + k);
			if (tile != null && tile.groundHeight > groundHeight) {
				shadow.setFrame(3, tile.groundHeight - groundHeight - 1);
				blitShadow(ground._bitmap.bitmapData, shadow._bitmap.bitmapData, source, p);//ground._bitmap.bitmapData.copyPixels(shadow._bitmap.bitmapData, source, p, shadow._bitmap.bitmapData, null, true);
			}
			
			//the left tile;
			tile = map.getGroundTile(gridX -1 + i , gridY + k);
			if (tile != null && tile.groundHeight > groundHeight) {
				shadow.setFrame(2, tile.groundHeight - groundHeight - 1);
				blitShadow(ground._bitmap.bitmapData, shadow._bitmap.bitmapData, source, p);//ground._bitmap.bitmapData.copyPixels(shadow._bitmap.bitmapData, source, p, shadow._bitmap.bitmapData, null, true);
			}
			
			//the left tile;
			tile = map.getGroundTile(gridX + 1 + i, gridY + k);
			if (tile != null && tile.groundHeight > groundHeight) {
				shadow.setFrame(0, tile.groundHeight - groundHeight - 1);
				blitShadow(ground._bitmap.bitmapData, shadow._bitmap.bitmapData, source, p);//ground._bitmap.bitmapData.copyPixels(shadow._bitmap.bitmapData, source, p, shadow._bitmap.bitmapData, null, true);
			}
		}
		
		public function blitShadow(ground : BitmapData, shadow : BitmapData, source : Rectangle, p : Point):void
		{
			ground.copyPixels(shadow, source, p, shadow, null, true);
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