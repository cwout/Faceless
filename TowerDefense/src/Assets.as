package  
{
	import flash.display.InteractiveObject;
	/**
	 * ...
	 * @author Olivier de Schaetzen
	 */
	public class Assets 
	{
		//----------the graphics----------
		
		//TOWER GRAPHICS
		[Embed(source = "assets/BasicTower30px.png")] public static const BASICTOWER : Class;
		
		//PROJECTILE GRAPHICS
		[Embed(source = "assets/BasicBall.png")] public static const BASICBALL : Class;
		
		//ENEMEY GRAPHICS
		[Embed(source = "assets/TestEnemy.png")] public static const TestEnemy : Class;
		
		//GROUND GRAPHICS
		[Embed(source = "assets/grass.png")] public static const GRASS : Class;
		[Embed(source = "assets/rock.png")] public static const ROCK : Class;
		[Embed(source = "assets/rockgrass.png")] public static const ROCKGRASS : Class;
		[Embed(source = "assets/snow.png")] public static const SNOW : Class;
		[Embed(source = "assets/mud.png")] public static const MUD : Class;
		[Embed(source="assets/mudgrass.png")] public static const MUDGRASS : Class;
		[Embed(source="assets/abyss.png")] public static const ABYSS : Class;
		
		//----------the sounds----------
		
		//----------the levels----------
		[Embed(source = "assets/levels/TestLevel.oel", mimeType = "application/octet-stream")] public static const LEVEL_TESTLEVEL : Class;
	}

}