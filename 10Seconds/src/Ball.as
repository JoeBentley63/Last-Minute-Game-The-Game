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
	public class Ball extends FlxText
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
		private var _beginningVel : FlxPoint = new FlxPoint(100, 100); ;
		private var _start : Boolean = false;
		public var boundingBox : FlxSprite;
		[Embed(source="//Assets//MainFont.ttf", fontFamily="NES", embedAsCFF="false")] 	public	var	FontNES:String;	
		
		public function Ball(text : String,destination : FlxPoint,width : int,fadeOutPos : FlxPoint,start : FlxPoint,fontSize : int,state : FlxState,color : uint,speedIn : int = 200,speedOut : int = 200,endScale : int = 60) 
		{
			super(start.x, start.y, width, text);
			
			this.color = color;
			dest = destination;
			end = fadeOutPos;
			FadeIn = true;
			this.size = fontSize;
			this.endScale = endScale;
			this.setFormat("NES", fontSize, 0xff161616, "left"); //font-family, font-size, color, alignment
			this.player = player;
			state.add(this);
			boundingBox = new FlxSprite(x, y);
			boundingBox.makeGraphic(text.length*fontSize*0.65, fontSize,0x00000000);
			state.add(boundingBox);
			this.speedIn = speedIn;
			this.speedOut = speedOut;
		
			
		}
		
		override public function update():void 
		{
			trace("Pos :" + y);
			boundingBox.x = this.x;
			boundingBox.y = this.y;
			
			if (FadeIn)
			{
				if (this.size < endScale)
				{
					this.size++;
				}
				if (FlxU.getDistance(new FlxPoint(x, y), dest) < 5 && size == endScale)
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
				if (!_start)
				{
					this.velocity = _beginningVel;
					_start = true;
				}
				if (this.x < 0)
				{
					if (this.velocity.x < 0)
					{
						this.velocity.x *= -1.2;
					
					}
				}
				if (this.x > 600)
				{
					if (this.velocity.x > 0)
					{
						this.velocity.x *= -1.2;
					}
				}
				
			}
			if (velocity.x > 200)
			{
				velocity.x = 200;
			}
			if (velocity.y > 200)
			{
				velocity.y = 200;
			}
		}
		
	}

}