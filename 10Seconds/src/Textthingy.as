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
	public class Textthingy extends FlxText
	{
		public var FadeIn : Boolean = true;
		private var dest : FlxPoint;
		private var end : FlxPoint;
		public var done : Boolean = false;
		private var speedIn : int = 200;
		private var speedOut : int = 200;
		private var endScale : int;
		private var scene : FlxState;
		[Embed(source="//Assets//MainFont.ttf", fontFamily="NES", embedAsCFF="false")] 	public	var	FontNES:String;	
		
		public function Textthingy(text : String,destination : FlxPoint,width : int,fadeOutPos : FlxPoint,start : FlxPoint,fontSize : int,state : FlxState,color : uint,speedIn : int = 200,speedOut : int = 200,endScale : int = 60,sceneToSwitchTo : FlxState = null) 
		{
			super(start.x, start.y, width, text);
			this.color = color;
			dest = destination;
			end = fadeOutPos;
			FadeIn = true;
			this.size = fontSize;
			this.endScale = endScale;
			this.setFormat("NES", fontSize, 0xff161616, "center"); //font-family, font-size, color, alignment
			this.scene = sceneToSwitchTo;
			state.add(this);
			this.speedIn = speedIn;
			this.speedOut = speedOut;
			
		}
		public function ChangeScene() : void
		{
			if (scene != null)
			{
				FlxG.switchState(scene);
			}
		}
		
		override public function update():void 
		{
			super.update();
			if (FadeIn )
			{
				if (this.size < endScale)
				{
					this.size++;
				}
				if (FlxU.getDistance(new FlxPoint(x, y), dest) < 5 && size == endScale)
				{
					done = true;
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
			else
			{
				if (FlxU.getDistance(new FlxPoint(x, y), end) < 5 && size == endScale)
				{
					ChangeScene();
				}
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
		}
		
	}

}