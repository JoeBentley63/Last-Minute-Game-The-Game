package
{
	import flash.geom.Point;
	import flash.text.engine.TextElement;
	import org.flixel.*;
	
	public class Pong extends FlxState
	{
		
		//[Embed(source = '\\Assets\\office.png')] public var officeTex:Class;
		public var textElements : Array = new Array();
		public var place : int = 0;
		public var paddle1 : Paddle;
		public var paddle2 : Paddle;
		public var balls : Ball;
		public var once : Boolean = false;
		public var score1 : Textthingy;
		public var score2 : Textthingy;
		public var scoreOne : int = 0;
		public var scoreTwo : int = -1;
		public function Pong():void
		{	
			super();
		}
		
		override public function create():void
		{
			super.create();

			FlxG.worldBounds = new FlxRect(0, 0, FlxG.width, FlxG.height);
			FlxG.bgColor = 0xffffffff;
			FlxG.mouse.show();
			var temp : Textthingy = new Textthingy("Down to buisness. This is a game right?", new FlxPoint(50, 50), 300, new FlxPoint(50, 700), new FlxPoint(700, 50), 20, this, 0xff161616, 300, 500,20);
			textElements.push(temp);
			
			temp  = new Textthingy("RIGHT???!!!!", new FlxPoint(130, 120), 500, new FlxPoint(100, -900), new FlxPoint(-600, 120), 80, this, 0xff161616, 300, 500,80);
			textElements.push(temp);
			
			temp = new Textthingy("Probably....", new FlxPoint(50, 250), 320, new FlxPoint(10, 900), new FlxPoint(10, -400), 40, this, 0xff161616, 300, 500,40);
			
			textElements.push(temp);
			
			temp = new Textthingy("(if i ever stop pissing about...)", new FlxPoint(100, 300), 320, new FlxPoint(10, 900), new FlxPoint(10, 900), 20, this, 0xff161616, 300, 500,20);
			
			textElements.push(temp);
			
			temp = new Textthingy("Ok... so what can we do...hmmmm. I guess we could make,like pong or something.Thats easy right?", new FlxPoint(10, 400), 600, new FlxPoint(600, 600), new FlxPoint(-500, 600), 20, this, 0xffff6600, 300, 500,20);
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
								paddle1 = new Paddle("(Paddle)", new FlxPoint(300, 50), 300, new FlxPoint(700, 10), new FlxPoint(-700, 10), 30, this, 0xff161616, 300, 500,30,5);
								
								paddle2 = new Paddle("Left/Right", new FlxPoint(300, 400), 300, new FlxPoint(-700, 400), new FlxPoint(700, 400), 30, this, 0xff161616, 300, 500,30);
								
								balls = new Ball("ball", new FlxPoint(200, 200), 300, new FlxPoint( -700, 400), new FlxPoint(200, -1000), 20, this, 0xff161616, 300, 500, 20);
								
								score1 = new Textthingy("Score : " + scoreOne, new FlxPoint(00, 00), 100, new FlxPoint(50, 700), new FlxPoint(700, 50), 20, this, 0x50161616, 300, 500,20);
								
								
								score2 = new Textthingy("Score : " + scoreTwo, new FlxPoint(00, 440), 100, new FlxPoint(50, 700), new FlxPoint(700, 50), 20, this, 0x50161616, 300, 500,20);
								
							
							var temp : Textthingy  = new Textthingy("This game is like...the best or something", new FlxPoint(10, 120), 200, new FlxPoint(100, -1000), new FlxPoint(-600, 120), 20, this, 0x50161616, 300, 500,20);
							textElements.push(temp);
							
							temp = new Textthingy("ahh,who am i kidding... get 3 points and well try something different", new FlxPoint(520, 300), 100, new FlxPoint(10, 3000), new FlxPoint(-4000, 300), 10, this, 0x50ff6600, 300, 500,10);
							textElements.push(temp);
						
							temp = new Textthingy("5 stars", new FlxPoint(520, 200), 120, new FlxPoint(10, 900), new FlxPoint(10, -3000), 30, this, 0x50ff6600, 300, 500,30);
							textElements.push(temp);
							break;
						case 2 :
							
								for (var i : int = 0; i < textElements.length; i ++)
								{
									textElements[i].FadeIn = false;
									
								}
								paddle1.FadeOut = true;
								paddle2.FadeOut = true;
								balls.FadeOut = true;
								score1.FadeIn = false
								score2.FadeIn = false;
							
							break;
						case 3 : 
								for (var i : int = 0; i < textElements.length; i ++)
								{
									textElements[i].FadeIn = false;
									
								}
							break;
						}
								once = true;
				}
			}
			if (place == 1)
			{
				//update pong logic
				
				FlxG.overlap(balls.boundingBox,paddle1.boundingBox,rebound);
				FlxG.overlap(balls.boundingBox,paddle2.boundingBox,rebound);
				score1.text = "Score : + " + scoreOne;
				score2.text = "Score : + " + scoreTwo;
				if (balls.y < 0)
				{
					scoreTwo ++;
					balls.y = 200;
					balls.x = 200;
					balls.velocity.y = 100;
				}
				if (balls.y > 480)
				{
					scoreOne ++;
					balls.y = 200;
					balls.x = 200;
					balls.velocity.y = -100;
				}
				AI();
				if (scoreOne >= 3 || scoreTwo >= 3)
				{
					place = 2;
						for (var i : int = 0; i < textElements.length; i ++)
								{
									textElements[i].FadeIn = false;
									
								}
								paddle1.FadeOut = true;
								paddle2.FadeOut = true;
								balls.FadeOut = true;
								score1.FadeIn = false
								score2.FadeIn = false;
								
						var temp : Textthingy = new Textthingy("BEST GAME EVER!!", new FlxPoint(10, 10), 600, new FlxPoint(50, 700), new FlxPoint(700, 50), 120, this, 0xff161616, 300, 500,120);
						textElements.push(temp);
						temp = new Textthingy("( not :D )", new FlxPoint(10, 450), 600, new FlxPoint(600, 600), new FlxPoint(-500, 600), 10, this, 0xffff6600, 300, 500,10, new BreakOut);
						textElements.push(temp);
						once = false;		
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
			var objectOfIntrest : FlxSprite;
			if (object1 is Ball)
			{
				objectOfIntrest = object2 as FlxSprite;
			}
			else
			{
				objectOfIntrest = object1 as FlxSprite;
			}
			trace("Collide");
			
			if (objectOfIntrest.y < 100)
			{
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
		public function AI() : void
		{
			
				if (paddle1.boundingBox.x < balls.x - 5)
				{
					paddle1.velocity.x = 100;
				}
				else if (paddle1.boundingBox.x > balls.x + 5 )
				{
					paddle1.velocity.x = -100;
				}
				else
				{
					paddle1.velocity.x = 0;
				}
			
			
		}
		override public function draw():void 
		{
			super.draw();
		}
		
	}
}