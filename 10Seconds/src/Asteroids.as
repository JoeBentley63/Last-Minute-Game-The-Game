package
{
	import flash.geom.Point;
	import flash.text.engine.TextElement;
	import org.flixel.*;
	
	public class Asteroids extends FlxState
	{
		
		//[Embed(source = '\\Assets\\office.png')] public var officeTex:Class;
		public var textElements : Array = new Array();
		public var place : int = 0;
		public var ship : ShipAsteroids;
		public var once : Boolean = false;
		public var score2 : Textthingy;
		public var scoreTwo : int = 0;
		public var lives : Textthingy;
		public var numLives : int = 3;
		public function Asteroids():void
		{	
			super();
		}
		
		override public function create():void
		{
			super.create();

			FlxG.worldBounds = new FlxRect(0, 0, FlxG.width, FlxG.height);
			FlxG.bgColor = 0xffffffff;
			FlxG.mouse.show();
			var temp : Textthingy = new Textthingy("Ok... one more", new FlxPoint(0, 0), 300, new FlxPoint(50, 700), new FlxPoint(700, 50), 30, this, 0xff161616, 300, 500);
			textElements.push(temp);
			
			temp  = new Textthingy("maybe, this time asteroids?", new FlxPoint(300, 20), 300, new FlxPoint(100, -900), new FlxPoint(-600, 120), 20, this, 0xff161616, 300, 500,20);
			textElements.push(temp);
			
			temp = new Textthingy("(Woo!!)", new FlxPoint(300, 80), 320, new FlxPoint(10, 900), new FlxPoint(10, -400), 20, this, 0xff161616, 300, 500,20);
			textElements.push(temp);
			temp = new Textthingy("Then well call it a day", new FlxPoint(0, 120), 640, new FlxPoint(10, 900), new FlxPoint(10, 1000), 100, this, 0xffff6600, 300, 500,100);
			textElements.push(temp);
		
		}
		override public function update():void 
		{
			super.update();
			if (FlxG.mouse.justPressed())
			{
				if (!once)
				{
					place++;
					trace(place);
					switch(place)
					{	
						case 1 : 
							for (var i : int = 0; i < textElements.length; i ++)
							{
								textElements[i].FadeIn = false;
								
							}
							ship = new ShipAsteroids("Ship )>", new FlxPoint(10, 250), 320, new FlxPoint(10, 900), new FlxPoint(10, -500), 30, this, 0xffff6600, 300, 500,30);
							score2 = new Textthingy("Score : " + scoreTwo, new FlxPoint(00, 440), 100, new FlxPoint(50, 700), new FlxPoint(700, 50), 20, this, 0x50161616, 300, 500,20);
							lives 	= new Textthingy("lives : " + lives, new FlxPoint(00, 0), 100, new FlxPoint(50, 700), new FlxPoint(700, 50), 20, this, 0x50161616, 300, 500,20);
							break;
						
						}
								once = true;
				}
			}
			if (place == 1)
			{
				//update pong logic
				//FlxG.overlap(balls.boundingBox,blocks,rebound);
				//FlxG.overlap(balls.boundingBox,paddle2.boundingBox,rebound);
				//score1.text = "Score : + " + scoreOne;
				score2.text = "Score : " + scoreTwo;
				lives.text = "Lives : " + numLives;
				
			}
			if (textElements.length > 0)
			{
				if (textElements[textElements.length-1].done == true)
				{
					once = false;
				}
			}
			
		}
		
		public function rebound(object1 :FlxObject,object2 : FlxObject) : void
		{
			/*
				var objectOfIntrest : FlxObject ;
				if (object1 == balls.boundingBox)
				{
					objectOfIntrest = object2 ;
				}
				else
				{
					objectOfIntrest = object1 ;
				}
				trace("Collide");
				
				
				
				if (objectOfIntrest.y < 350)
				{
					if (objectOfIntrest is Block)
					{
						(objectOfIntrest as Block).FadeOut = true;
						
					}
					count --;
					scoreTwo++;
					//balls.velocity.y = 200;
					if (balls.velocity.y < 0)
					{
						balls.velocity.y *= -1.1;
					}
				}
				else
				{
					//balls.velocity.y = -200;
					if (balls.velocity.y > 0)
					{
						balls.velocity.y *= -1.1;
					}
				}
			*/
		}
		
		
		
	}
}