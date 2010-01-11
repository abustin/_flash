package {
	import flash.display.Sprite;

	public class Demo extends Sprite
	{
		public function Demo(){
			
			addChild($flash.load("http://farm3.static.flickr.com/2603/4198853411_73b1a0d780.jpg", {
				x: stage.stageWidth/2,
				y: stage.stageHeight/2,
				success:function() {
					trace("it loaded!");
				},
				click: function() {
					trace("click");
					$flash.navigate("http://thebackbutton.com/blog/93/flash-11-should-be-a-switch-to-javascript/");
				},
				mouseMove: function() {
					trace("the mouse is a movin'");
				},
				enterFrame: function() {
					this.rotation+=Math.PI*2;
				}
				
			}));
			
		}
	}
}
