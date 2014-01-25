package  
{
	import flash.display.InteractiveObject;
	/**
	 * ...
	 * @author Olivier de Schaetzen
	 */
	public class Assets 
	{
		//the graphics
		[Embed(source = "assets/BasicTower30px.png")] public static const BASICTOWER : Class;
		[Embed(source = "assets/BasicBall.png")] public static const BASICBALL : Class;
		[Embed(source = "assets/TestEnemy.png")] public static const TestEnemy : Class;
		
		//the sounds
		
		//the levels
		[Embed(source = "assets/levels/TestLevel.oel", mimeType = "application/octet-stream")] public static const LEVEL_TESTLEVEL : Class;
	}

}