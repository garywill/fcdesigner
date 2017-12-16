/* List local font with swf and call the fontList([userfonts]) javascript
 * function of the containing html page.
 *
 * Compile as: 
 *     mtasc -swf listfont.swf -main -header 800:600:0 listfont.as
 * You can change 800:600 to 1:1
 *
 * Version: 0.1
 */

class LocalFonts {
    static var app : LocalFonts;
    function LocalFonts() {
	var userfonts = TextField.getFontList();
	userfonts.sort();
	// Call fontList() of the embeding html page.
	// void(0) will stop the page jump to whatever fontList() returns.
	getURL('javascript:fontList("' + escape(userfonts) + '");void(0);', 
	    '_self');

	// Test our result
	if (0) {
	    // creates a 'tf' TextField size 800x600 at pos 0,0
	    _root.createTextField("tf",0,0,0,800,600);
	    // write some text into it
	    _root.tf.text = userfonts;
	}
    }

    // entry point
    static function main(mc) {
	app = new LocalFonts();
    } 
}

// vim:syntax=javascript
