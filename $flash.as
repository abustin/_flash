package {
	
	import flash.display.Loader;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	public class $flash {
		
		public static function load(url, callback=null) {

			var loader:Loader = new Loader();
			callback&&callback.success&&loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function(e) {
				callback.success(loader)
			});
			callback&&callback.error&&loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function(e) {
				callback.error("load operation to failed")
			});
			
			loader.load(new URLRequest(url));
			
			return loader;
			
		}

	}
}