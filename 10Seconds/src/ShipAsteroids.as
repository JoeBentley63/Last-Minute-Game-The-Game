package  
{
	import flash.display3D.textures.CubeTexture;
	import org.flixel.FlxPoint;
	import org.flixel.FlxState;
	import org.flixel.*;
	/**
	 * ...
	 * @author Joseph Bentley
	 */
	public class ShipAsteroids extends FlxSprite
	{
		public var FadeIn : Boolean = true;
		public var FadeOut : Boolean = false;
		
		private var dest : FlxPoint;
		private var end : FlxPoint;
		public var done : Boolean = false;
		private var speedIn : int = 200;
		private var speedOut : int = 200;
		private var endScale : int;
		private var player : int = 1;
		private var bullets : Array = new Array();
		private var _start : Boolean = false;
		public var text : FlxText;
		private var state : FlxState;
		private var once : Boolean = false;
		[Embed(source="//Assets//MainFont.ttf", fontFamily="NES", embedAsCFF="false")] 	public	var	FontNES:String;	
		
		public function ShipAsteroids(text : String,destination : FlxPoint,width : int,fadeOutPos : FlxPoint,start : FlxPoint,fontSize : int,state : FlxState,color : uint,speedIn : int = 200,speedOut : int = 200,endScale : int = 60) 
		{
			super(start.x, start.y);
			this.state = state;
			this.text = new FlxText(x, y, width, text);
			this.text.color = color;
			dest = destination;
			this.x = dest.x;
			this.y = -100 - (FlxG.random() *500);
			end = fadeOutPos;
			end.x = dest.x;
			end.y = dest.y - 1000;
			FadeIn = true;
			this.text.size = fontSize;
			this.endScale = endScale;
			this.text.setFormat("NES", fontSize, 0xff161616, "left"); //font-family, font-size, color, alignment
			this.player = player;
			state.add(this);
			
			this.makeGraphic(text.length*fontSize*0.65, fontSize,0x00000000);
			state.add(this.text);
			this.speedIn = speedIn;
			this.speedOut = 100 + (FlxG.random() *500);
		
			
		}
		
		override public function update():void 
		{
			//trace("in : " + FadeIn + "out : " + FadeOut);
			text.x = this.x;
			text.y = this.y;
			
			if (FadeIn)
			{
				if (text.size < endScale)
				{
					text.size++;
				}
				if (FlxU.getDistance(new FlxPoint(x, y), dest) < 5 && text.size == endScale)
				{
					FadeIn = false;
				
					//this.velocity.x = 0;
				}
				if (this.x < dest.x - 5)
				{
					this.velocity.x = speedIn;
				}
				else if (this.x > dest.x + 5)
				{
					this.velocity.x = -speedIn;
				}
				else
				{
					this.velocity.x = 0
				}
				
				if (this.y < dest.y - 5)
				{
					this.velocity.y = speedIn;
				}
				else if (this.y > dest.y + 5)
				{
					this.velocity.y = -speedIn;
				}
				else
				{
					this.velocity.y = 0
				}
			}
			else if(FadeOut)
			{
				if (this.x < end.x - 5)
				{
					this.velocity.x = speedOut;
				}
				else if (this.x > end.x + 5)
				{
					this.velocity.x = -speedOut;
				}
				else
				{
					this.velocity.x = 0
				}
				
				if (this.y < end.y - 5)
				{
					this.velocity.y = speedOut;
				}
				else if (this.y > end.y + 5)
				{
					this.velocity.y = -speedOut;
				}
				else
				{
					this.velocity.y = 0
				}
			}
			else
			{
				super.update();
				if (FlxG.keys.SPACE && once == false)
				{
					bullets.push(new Bullet("Pew", new FlxPoint(x + 100, y), 320, new FlxPoint(x + 100, y), new FlxPoint(x + 100, y), 30, state, 0xffff6600, 900, 900,30));
					once = true;
				}
				if (!FlxG.keys.SPACE && once == true)
				{
					once = false;
				}
				if (FlxG.keys.UP)
				{
					this.velocity.y = -100;
				}
				else if (FlxG.keys.DOWN)
				{
					this.velocity.y = 100;
				}
				else
				{
					this.velocity.y = 0;
				}
				
				if (FlxG.keys.LEFT)
				{
					this.angle--;
				}
				else if (FlxG.keys.RIGHT)
				{
					this.angle++;
				}
				else
				{
					this.velocity.x = 0;
				}
				
			}
		}
		
	}

}