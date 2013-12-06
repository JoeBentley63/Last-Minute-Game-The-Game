package
{
	import flash.geom.Point;
	import flash.text.engine.TextElement;
	import org.flixel.*;
	
	public class PlayState extends FlxState
	{
		
		//[Embed(source = '\\Assets\\office.png')] public var officeTex:Class;
		public var textElements : Array = new Array();
		public var place : int = 0;
		public var once : Boolean = false;
		public var medalManager : MedalManager;
		public function PlayState():void
		{	
		}
		
		override public function create():void
		{
			FlxG.bgColor = 0xffffffff;
			FlxG.mouse.show();
			var temp : Textthingy = new Textthingy("last minute game", new FlxPoint(0, 0), 600, new FlxPoint(0, 700), new FlxPoint(700, 50), 120, this, 0xff161616, 300, 500,120);
			textElements.push(temp);
			var temp : Textthingy = new Textthingy("A game, whos art was made in 10 seconds  (the download time for the font)", new FlxPoint(0, 0), 600, new FlxPoint(0, -700), new FlxPoint(50, -700), 10, this, 0xff161616, 300, 500,10);
			textElements.push(temp);
			var temp : Textthingy = new Textthingy("The flash game of the movie based on a novel, based off a game, based on an idea,that was spelt out in my alphabety spaghetti.", new FlxPoint(0, 400), 600, new FlxPoint(00, 700), new FlxPoint(-500,400), 20, this, 0xff161616, 300, 500,20);
			textElements.push(temp);
			
			medalManager = MedalManager.getInstance();
		
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
					switch(place)
					{
						case 1: 
							for (var i : int = 0; i < textElements.length; i ++)
							{
								textElements[i].FadeIn = false;
							}
							medalManager.unlock("You started the Game");
			
							var temp : Textthingy = new Textthingy("Hello", new FlxPoint(50, 50), 300, new FlxPoint(50, 700), new FlxPoint(700, 50), 30, this, 0xff161616, 300, 500);
							textElements.push(temp);
							
							temp  = new Textthingy("So...Ludum Dare and stuff. I didn't have much time.", new FlxPoint(130, 120), 500, new FlxPoint(100, -900), new FlxPoint(-600, 120), 20, this, 0xff161616, 300, 500,20);
							textElements.push(temp);
							
							temp = new Textthingy("So I Made THIS :D", new FlxPoint(10, 200), 320, new FlxPoint(10, 900), new FlxPoint(10, -400), 80, this, 0xff161616, 300, 500,80);
							textElements.push(temp);
							temp = new Textthingy("To quote a friend 'THERE'S GAMEPLAY I SWEAR' :D:D", new FlxPoint(320, 260), 320, new FlxPoint(10, 900), new FlxPoint(10, 1000), 10, this, 0xffff6600, 300, 500,10);
							textElements.push(temp);
						
							temp = new Textthingy("Click to continue", new FlxPoint(320, 300), 320, new FlxPoint(10, 900), new FlxPoint(10, -1000), 30, this, 0xffff6600, 300, 500,30);
							textElements.push(temp);
							break;
						case 2:
							for (var i : int = 0; i < textElements.length; i ++)
							{
								textElements[i].FadeIn = false;
							}
							var temp : Textthingy = new Textthingy("So, ya, This years Theme was 10 Seconds..", new FlxPoint(50, 50), 300, new FlxPoint(50, 700), new FlxPoint(700, 50), 20, this, 0xff161616, 300, 500,20);
							textElements.push(temp);
							
							temp  = new Textthingy("(sounds like the amount of time it took to make this..)", new FlxPoint(130, 120), 500, new FlxPoint(100, -900), new FlxPoint(-600, 120), 20, this, 0xff161616, 300, 500,20);
							textElements.push(temp);
							
							temp = new Textthingy("NOT TRUE!", new FlxPoint(320, 150), 320, new FlxPoint(10, 900), new FlxPoint(10, -400), 100, this, 0xff161616, 300, 500,100);
							textElements.push(temp);
							temp = new Textthingy("More like, a few hours really. Took me ages to find a font.", new FlxPoint(10, 260), 320, new FlxPoint(10, 900), new FlxPoint(10, 1000), 10, this, 0xffff6600, 300, 500,10);
							textElements.push(temp);
						
							temp = new Textthingy("did you know you have to pay for Helvetica...eff that shit", new FlxPoint(10, 300), 320, new FlxPoint(10, 900), new FlxPoint(10, -500), 30, this, 0xffff6600, 300, 500,30);
							textElements.push(temp);
							temp = new Textthingy("(sigh) Also, like positioning things...its hard.I decided to make a game, and try to do the art in 10 seconds.", new FlxPoint(10, 450), 600, new FlxPoint(600, 600), new FlxPoint(-500, 600), 10, this, 0xffff6600, 300, 500,10);
							textElements.push(temp);
							break;
							case 3:
							for (var i : int = 0; i < textElements.length; i ++)
							{
								textElements[i].FadeIn = false;
							}
							var temp : Textthingy = new Textthingy("FUCK THIS IS HIPSTER", new FlxPoint(10, 10), 600, new FlxPoint(10, 700), new FlxPoint(700, 50), 120, this, 0xff161616, 300, 500,120,new Pong);
							textElements.push(temp);
							
							break;
						case 4:
							
							for (var i : int = 0; i < textElements.length; i ++)
							{
								textElements[i].FadeIn = false;
							}
														
							break;
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