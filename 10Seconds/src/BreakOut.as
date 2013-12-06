package
{
	import flash.geom.Point;
	import flash.text.engine.TextElement;
	import org.flixel.*;
	
	public class BreakOut extends FlxState
	{
		
		//[Embed(source = '\\Assets\\office.png')] public var officeTex:Class;
		public var textElements : Array = new Array();
		public var place : int = 0;
		public var blocks : FlxGroup = new FlxGroup(100);
		public var paddle2 : Paddle;
		public var balls : Ball;
		public var once : Boolean = false;
		public var score2 : Textthingy;
		public var scoreTwo : int = 0;
		public var stringThing : String = "Omg this game is so art. Its like super meta. it was totally not made in like a few hours. pfffft who'd do that? not me, I',m awesome at time management :D.Hint, left and right to control paddle, hit the ball off the blocks and we can move on :D:D. You need a score of 100 to progress.";
		public var stringChunks : Array;
		public var count : int = 0;
		public var medalManager : MedalManager;
		public function BreakOut():void
		{	
			super();
		}
		
		override public function create():void
		{
			super.create();

			FlxG.worldBounds = new FlxRect(0, 0, FlxG.width, FlxG.height);
			FlxG.bgColor = 0xffffffff;
			FlxG.mouse.show();
			var temp : Textthingy = new Textthingy("Well... this going well.", new FlxPoint(0, 0), 300, new FlxPoint(50, 700), new FlxPoint(700, 50), 30, this, 0xff161616, 300, 500);
			textElements.push(temp);
			
			temp  = new Textthingy("Having fun yet? I know am am", new FlxPoint(300, 20), 300, new FlxPoint(100, -900), new FlxPoint(-600, 120), 20, this, 0xff161616, 300, 500,20);
			textElements.push(temp);
			
			temp = new Textthingy("(Lier :| )", new FlxPoint(300, 80), 320, new FlxPoint(10, 900), new FlxPoint(10, -400), 20, this, 0xff161616, 300, 500,20);
			textElements.push(temp);
			temp = new Textthingy("What else could we do? maybe like i dont know...   breakout ?", new FlxPoint(320, 100), 320, new FlxPoint(10, 900), new FlxPoint(10, 1000), 45, this, 0xffff6600, 300, 500,45);
			textElements.push(temp);
		
			temp = new Textthingy("(this will get me the daily first for sure!)", new FlxPoint(00, 440), 400, new FlxPoint(10, 900), new FlxPoint(10, -1000), 20, this, 0xffff6600, 300, 500,20);
			textElements.push(temp);
			
			temp = new Textthingy(" (i hope tom fulp notices me today :D)", new FlxPoint(300, 460), 400, new FlxPoint(10, 900), new FlxPoint(10, 1000), 10, this, 0xffff6600, 300, 500,10);
			textElements.push(temp);	
			stringChunks = stringThing.split(" ")
			medalManager = MedalManager.getInstance();
			medalManager.unlock("Beat the pong level");
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
							
							var nextPos : FlxPoint = new FlxPoint(-2, -2);
							var temp : Block ;
							for (var i : int = 0; i < stringChunks.length; i ++)
							{
								temp = new Block(stringChunks[i], new FlxPoint(nextPos.x, nextPos.y) , 300, new FlxPoint(900, 400), new FlxPoint(00, 400), 30, this, 0xff161616, 300, 500, 30);
								blocks.add(temp as Block);
								nextPos.x += temp.width + 15;
								
								if (nextPos.x + (temp.width) + 15 > 640)
								{
									nextPos.x = 0;
									nextPos.y += 32;
								}
							}
							paddle2 = new Paddle("Left/Right", new FlxPoint(300, 400), 300, new FlxPoint(-700, 400), new FlxPoint(700, 400), 30, this, 0xff161616, 300, 500,30);
							
							balls = new Ball("ball", new FlxPoint(200, 280), 300, new FlxPoint( -700, 400), new FlxPoint(900, 300), 20, this, 0xff161616, 300, 500, 20);
							
							score2 = new Textthingy("Score : " + scoreTwo, new FlxPoint(00, 440), 100, new FlxPoint(50, -1000), new FlxPoint(700, 50), 20, this, 0x50161616, 300, 500,20,new FinalScene);
							
							break;
						
						}
								once = true;
				}
			}
			if (place == 1)
			{
				//update pong logic
				FlxG.overlap(balls.boundingBox,blocks,rebound);
				FlxG.overlap(balls.boundingBox,paddle2.boundingBox,rebound);
				//score1.text = "Score : + " + scoreOne;
				score2.text = "Score : + " + count;
				
				if (balls.y < 00)
				{
					balls.velocity.y = 100;
				}
				if (balls.y >480)
				{
					balls.velocity.y = -100;
					scoreTwo--;
				}
				if (/*scoreTwo > 100 || */count > 100)
				{
					paddle2.FadeOut = true;
							
					balls.FadeOut = true;	
					score2.FadeIn = false;
					for ( var i : int = 0; i < blocks.length; i ++)
					{
						blocks.members[i].FadeOut = true;
					}
				}
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
						count ++;
					}
					
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
			
		}
		
		
		
	}
}