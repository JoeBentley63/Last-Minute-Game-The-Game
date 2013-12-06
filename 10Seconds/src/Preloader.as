package  
{
    import org.flixel.system.*;
	
    import com.newgrounds.*;
    import com.newgrounds.components.*;
    import flash.display.MovieClip;
	import flash.media.SoundTransform;
	public class Preloader extends FlxPreloader
	{
		private const id:String = "33814:jlz7Ff2b";
		private const key:String = "ec19xDpAyTPNmWvAnjpQX4iscSkp9zJs"; //KEEP THIS SECRET!
	
		public function Preloader():void
		{
		//	className = "Main";
			super();
			 var apiConnector:APIConnector = new APIConnector();
            apiConnector.className = "Main";
            apiConnector.apiId = id;
            apiConnector.encryptionKey = key;
            addChild(apiConnector);
			
            if(stage)
            {
                apiConnector.x = (stage.stageWidth - apiConnector.width) / 2;
                apiConnector.y = (stage.stageHeight - apiConnector.height) / 2;
            }
			var medalPopup:MedalPopup = new MedalPopup();
			medalPopup.soundTransform = new SoundTransform(0); //WILL MUTE THE MEDALPOPUP SOUND FROM NEWGROUNDS
			addChild(medalPopup);
		}
	}
}