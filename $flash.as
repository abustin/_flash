package {
	
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	import flash.net.navigateToURL;
	import flash.net.sendToURL;
	
	public class $flash {
		
		public static var e; // Holds last event;
		
		public static const events = {
		    click: "click",
		    contextMenu: "contextMenu",
		    doubleClick: "doubleClick",
		    focusIn: "focusIn",
		    focusOut: "focusOut",
		    keyDown: "keyDown",
		    keyFocusChange: "keyFocusChange",
		    keyUp: "keyUp",
		    mouseDown: "mouseDown",
		    mouseFocusChange: "mouseFocusChange",
		    mouseMove: "mouseMove",
		    mouseOut: "mouseOut",
		    mouseOver: "mouseOver",
		    mouseUp: "mouseUp",
		    mouseWheel: "mouseWheel",
		    rollOut: "rollOut",
		    rollOver: "rollOver",
		    tabChildrenChange: "tabChildrenChange",
		    tabEnabledChange: "tabEnabledChange",
		    tabIndexChange: "tabIndexChange"
		}
				
		
		public static function load(url, callback=null) {

			var loader:Loader = new Loader();
			callback&&callback.success&&loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function(e) {
				callback.success(loader)
			});
			callback&&callback.error&&loader.contentLoaderInfo.addEventListener(Event.COMPLETE, function(e) {
				callback.error("load operation to failed")
			});
			
			loader.load(new URLRequest(url));
			
			copyProps(loader, callback, {success:true, error:true})
			interact(loader, callback);
			return loader;
			
		}
		
		public static function interact(targ=null, funcs=null) {
			
			if (targ is IEventDispatcher) {
				for (var i in funcs) {
					if ($flash.events[i] != null) {
						(function() {
							var func = funcs[i];
							targ.addEventListener(i, function(e) {$flash.e = e; func&&func()})
						})();
					}
				}
			}
			
			return targ;
		}
		
		
		public static function copyProps(targ=null, src=null, blacklist=null) {
			if (src && targ) {
				blacklist = blacklist || {}
				for (var i in src) {
					if (!blacklist[i] && !events[i]) {
						try {
							targ[i] = src[i];
						} catch (e) {}
					}
				}
			}
			return targ;
		}
		
		public static function createSprite(props=null) {
			var s = new Sprite();
			copyProps(s, props);
			interact(s, props);
			return s;
		}
		
		public static function navigate(url, target=null) {
			navigateToURL(new URLRequest(url),target)
		}
		
		public static function sendVars(url, vars=null) {
			var variables:URLVariables = new URLVariables(); 
			for (var i in vars) {
				variables[i] = vars[i];
			}
			
			var request:URLRequest = new URLRequest(url);
            request.data = variables;
            sendToURL(request);
		}
		
		

	}
}