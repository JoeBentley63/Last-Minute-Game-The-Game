package
{
	import flash.geom.Point;
	import flash.text.engine.TextElement;
	import org.flixel.*;
	
	public class FinalScene extends FlxState
	{
		
		//[Embed(source = '\\Assets\\office.png')] public var officeTex:Class;
		public var textElements : Array = new Array();
		public var place : int = 1;
		public var once : Boolean = false;
		public var medalManager : MedalManager;
		public function FinalScene():void
		{	
			
		}
		
		override public function create():void
		{
			FlxG.bgColor = 0xffffffff;
			FlxG.mouse.show();
			var temp : Textthingy = new Textthingy("so ya.", new FlxPoint(10, 10), 300, new FlxPoint(50, 700), new FlxPoint(700, 50), 30, this, 0xff161616, 300, 500,50);
			textElements.push(temp);
			
			temp  = new Textthingy("Thats my game :D . I hope you liked it.", new FlxPoint(130, 120), 500, new FlxPoint(100, -900), new FlxPoint(-600, 120), 20, this, 0xff161616, 300, 500,20);
			textElements.push(temp);
			
			temp = new Textthingy("It was fun to make.", new FlxPoint(10, 150), 320, new FlxPoint(10, 900), new FlxPoint(10, -400), 80, this, 0xff161616, 300, 500,80);
			textElements.push(temp);
			temp = new Textthingy("i actually started on a different game on satarday,it involved trying to pee in public without people seeing you.", new FlxPoint(320, 220), 320, new FlxPoint(10, 900), new FlxPoint(10, 1000), 10, this, 0xffff6600, 300, 500,10);
			textElements.push(temp);
		
			temp = new Textthingy("I abandoned that when i woke up today at 2pm :D", new FlxPoint(320, 300), 320, new FlxPoint(10, 900), new FlxPoint(10, -1000), 30, this, 0xffff6600, 300, 500,30);
			textElements.push(temp);
			medalManager = MedalManager.getInstance();
			medalManager.unlock("Broke out of Breakout");
		}
		override public function update():void 
		{
			FlxG.worldBounds = new FlxRect(FlxG.camera.x  , FlxG.camera.y , FlxG.camera.width, FlxG.camera.height);
			super.update();
			if (FlxG.mouse.justPressed())
			{
				if (!once)
				{
					place++;
					trace(place);
					switch(place)
					{
						case 1: 
							
							break;
						case 2:
							for (var i : int = 0; i < textElements.length; i ++)
							{
								textElements[i].FadeIn = false;
							}
							var temp : Textthingy = new Textthingy("Credits Time : ", new FlxPoint(00, 00), 640, new FlxPoint(50, 700), new FlxPoint(700, 50), 20, this, 0xff161616, 300, 500,40);
							textElements.push(temp);
							
							temp  = new Textthingy("Code : Joe Bentley (Seppyb63)", new FlxPoint(130, 120), 500, new FlxPoint(100, -900), new FlxPoint(-600, 120), 20, this, 0xff161616, 300, 500,20);
							textElements.push(temp);
							
							temp = new Textthingy("Writing : Joe :D", new FlxPoint(320, 150), 320, new FlxPoint(10, 900), new FlxPoint(10, -400), 60, this, 0xff161616, 300, 500,60);
							textElements.push(temp);
							temp = new Textthingy("Art : fun fact, no assets were loaded bar the font :D. Everything was created via code. I also used FLIXEL", new FlxPoint(10, 200), 320, new FlxPoint(10, 900), new FlxPoint(10, 1000), 10, this, 0xffff6600, 300, 500,10);
							textElements.push(temp);
						
							temp = new Textthingy("The font is 'Helv Children' by Matthias Guggisberg on DaFont.com", new FlxPoint(10, 250), 320, new FlxPoint(10, 900), new FlxPoint(10, -500), 30, this, 0xffff6600, 300, 500,30);
							textElements.push(temp);
							temp = new Textthingy("Its free to use :D", new FlxPoint(320, 350), 300, new FlxPoint(600, 600), new FlxPoint(-500, 600), 50, this, 0xffff6600, 300, 500,50);
							textElements.push(temp);
							break;
							case 3:
							for (var i : int = 0; i < textElements.length; i ++)
							{
								textElements[i].FadeIn = false;
							}
							var temp : Textthingy = new Textthingy("Follow me on twitter maybe? @seppyb or maybe on Newgrounds?", new FlxPoint(0, 0), 600, new FlxPoint(50, 700), new FlxPoint(700, 50), 80, this, 0xff161616, 300, 500,80);
							textElements.push(temp);
							
							break;
						case 4:
							for (var i : int = 0; i < textElements.length; i ++)
							{
								textElements[i].FadeIn = false;
							}
							var temp : Textthingy = new Textthingy("games over now :D you can leave...i guess. I mean. im not going to make you. click again to play again :D ", new FlxPoint(0, 0), 600, new FlxPoint(700, 00), new FlxPoint(700, 00), 10, this, 0xff161616, 300, 500,10, new PlayState);
							textElements.push(temp);
							medalManager.unlock("Game over");
							break;
							case 5:
							for (var i : int = 0; i < textElements.length; i ++)
							{
								textElements[i].FadeIn = false;
							}
							medalManager.unlock("Rinse Repeat");
					}
					once = true;
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
		
		override public function draw():void 
		{
			super.draw();
		}
		private function collisionDetection() : void
		{
			
		}
	}
}