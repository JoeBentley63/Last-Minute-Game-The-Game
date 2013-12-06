package  
{
	import com.newgrounds.API;
	/**
	 * ...
	 * @author Christy Carroll
	 */
	public class MedalManager 
	{
		private static var me : MedalManager;
		public var start : Boolean = false;
		public var pong : Boolean = false;
		public var breakout : Boolean = false;
		public var fin : Boolean = false;
		public function MedalManager() 
		{
		
		}
		public static function getInstance() : MedalManager
		{
			if (me == null)
			{
				me = new MedalManager();
			}
			return me;
		}
		public function update():void
		{
			if ( start)
			{
				unlock("You started the Game");
			}
			if ( pong)
			{
				unlock("Beat the pong level");
			}
			if ( breakout)
			{
				unlock("Broke out of Breakout");
			}
			if ( fin)
			{
				unlock("Game over");
			}
		}
		
		public function unlock(name:String):void
		{
			if (!API.getMedal(name).unlocked)
			{
				API.unlockMedal(name);
			}
		}
			
	}

}