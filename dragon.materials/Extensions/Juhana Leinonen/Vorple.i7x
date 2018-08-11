Version 3/170429 of Vorple (for Glulx only) by Juhana Leinonen begins here.

"Core functionality of Vorple, including JavaScript evaluation and adding HTML elements."

Use authorial modesty.


Chapter 1 - Run-time errors

To throw Vorple run-time error (desc – text):
	say "  *** Vorple run-time error: [desc] ***  ".
	

Chapter 2 - Interpreter handshake

The file of Vorple Handshake is called "VpHndshk".

Vorple support is truth state that varies. Vorple support is false.

This is the detect interpreter's Vorple support rule:
	if the file of Vorple Handshake exists:
		write "Callooh!" to the file of Vorple Handshake;
		mark the file of Vorple Handshake as ready to read;
		if "[text of the file of Vorple Handshake]" is "Callay!":
			now Vorple support is true.

The detect interpreter's Vorple support rule is listed before the when play begins stage rule in the startup rulebook.

To decide whether Vorple/JavaScript is supported/available:
	if Vorple support is true, decide yes;
	decide no.

To decide whether Vorple/JavaScript is not supported/available:
	if Vorple support is true, decide no;
	decide yes.

To decide whether Vorple/JavaScript is unsupported/unavailable:
	decide on whether or not Vorple is not supported.


Chapter 3 – JavaScript code execution

Section 1 – Executing code

The file of JavaScript Evaluation Input is called "VpJSEval".

To execute JavaScript code/command (JavaScript code - text):
	if Vorple is supported:
		write JavaScript code to the file of JavaScript Evaluation Input;
		mark the file of JavaScript Evaluation Input as ready to read.


Section 2 – Return values

The file of JavaScript Return Value is called "VpJSRtrn".

To decide which text is the value returned by the JavaScript code/command:
	if Vorple is not supported:
		decide on "";
	decide on substituted form of "[text of the file of JavaScript Return Value]".

To decide which text is the type of (source - text):
	if Vorple is not supported:
		decide on "nothing";
	let rval be source;
	if rval is:
		-- "": decide on "nothing";
		-- "undefined": decide on "nothing";
		-- "null": decide on "nothing";
		-- "true": decide on "truth state";
		-- "false": decide on "truth state";
		-- "NaN": decide on "NaN";
		-- "Infinity": decide on "infinity";
		-- "-Infinity": decide on "infinity";
	let initial character be character number 1 in rval;
	let last character be character number (number of characters in rval) in rval;
	if initial character is:
		-- "'":
			if the number of characters in rval is 1 or the last character is not "'":
				decide on "unknown";
			decide on "text";
		-- "[bracket]":
			decide on "list";
		-- "{":
			decide on "object";
	if word number 1 in rval is "function":
		decide on "function";
	if rval matches the regular expression "^\-?\d+(\.\d+)?$":
		decide on "number";
	decide on "unknown".

To decide which text is the text returned by the JavaScript code/command:
	if Vorple is not supported:
		decide on "";
	let rval be the value returned by the JavaScript command;
	if the type of the value returned by the JavaScript command is not "text":
		decide on rval;
	replace character number (number of characters in rval) in rval with "";
	replace character number 1 in rval with "";
	decide on rval.

[The algorithm that converts text to numbers has been adapted from the extension Guncho Mockup by Guncho Cabal.]
To decide which number is text (T - text) converted into a number:
	let S be 1;
	let L be the number of characters in T;
	if L is 0, decide on 0;
	let negated be false;
	let previous-result be 0;
	if character number 1 in T is "-":
		let negated be true;
		let S be 2;
	let result be 0;
	repeat with N running from S to L:
		let C be character number N in T;
		let D be 0;
		if C is:			
			-- "0": let D be 0;
			-- "1": let D be 1;
			-- "2": let D be 2;
			-- "3": let D be 3;
			-- "4": let D be 4;
			-- "5": let D be 5;
			-- "6": let D be 6;
			-- "7": let D be 7;
			-- "8": let D be 8;
			-- "9": let D be 9;
			-- ".": 
				let first decimal be text character number N + 1 in T converted into a number;
				if first decimal > 5:
					increment result;
				else if first decimal is 5:
					if negated is false:
						increment result;
					otherwise unless T exactly matches the regular expression "\-\d+\.50*":
						increment result;
				break;
		let result be (result * 10) + D;
		if previous-result > result:
			throw Vorple run-time error "Number [T] exceeds Glulx number range";
			decide on 0;
		now previous-result is result;
	if negated is true:
		decide on 0 - result;
	decide on result.
	
To decide which number is the number returned by the JavaScript code/command:
	if Vorple is not supported:
		decide on 0;
	let rval be the value returned by the JavaScript command;
	if the type of the value returned by the JavaScript command is "text":
		now rval is the text returned by the JavaScript command;
	otherwise if the type of the value returned by the JavaScript command is not "number":
		throw Vorple run-time error "Trying to convert return value of type [type of the value returned by the JavaScript command] into a number";
		decide on 0;
	decide on text rval converted into a number.

To decide if the JavaScript code/command returned (x - truth state):
	if Vorple is not supported:
		decide on false;
	if the type of the value returned by the JavaScript command is not "truth state":
		throw Vorple run-time error "Trying to convert return value of type [type of the value returned by the JavaScript command] into a number";
		decide on false;
	if the value returned by the JavaScript command is "true" and x is true:
		decide on true;
	if the value returned by the JavaScript command is "false" and x is false:
		decide on true;
	decide on false.
	

Section 3 - Escaping text for JavaScript

To decide which text is escaped (string - text):
	decide on escaped string using "" as line breaks.

To decide which text is escaped (string - text) using (lb - text) as line breaks:
	let safe-string be text;
	repeat with X running from 1 to number of characters in string:
		let char be character number X in string;
		if char is "'" or char is "[apostrophe]" or char is "\":
			now safe-string is "[safe-string]\";
		if char is "[line break]":
			now safe-string is "[safe-string][lb]";
		otherwise:
			now safe-string is "[safe-string][char]";
	decide on safe-string.


Chapter 4 – HTML tags

Section 1 - Opening and closing

To open a/-- HTML tag (name - text) called (classes - text):
	execute JavaScript command "vorple.layout.openTag('[name]','[classes]')".

To open a/-- HTML tag (name - text):
	open HTML tag name called "".

To close the/a/-- HTML tag:
	execute JavaScript command "vorple.layout.closeTag()".


Section 2 - Placing elements

To place a/an/-- (element - text) element called (classes - text) reading (content - text):
	open HTML tag element called classes;
	say content;
	close HTML tag.
		
To place a/an/-- (tag - text) element called (classes - text):
	place tag element called classes reading "".
		
To place a/an/-- (tag - text) element reading (content - text):
	place tag element called "" reading content.
	
To place a/an/-- (tag - text) element:
	place tag element called "" reading "".
	
To place an/-- inline/-- element called (classes - text) reading (content - text):
	place "span" element called classes reading content.
	
To place an/-- inline/-- element called (classes - text):
	place inline element called classes reading "". 

To place an/-- inline/-- element reading (content - text):
	place inline element called "" reading content. 

To place a/-- block level/-- element called (classes - text) reading (content - text):
	place "div" element called classes reading content.
	
To place a/-- block level/-- element called (classes - text):
	place block level element called classes reading "". 

To place a/-- block level/-- element reading (content - text):
	place block level element called "" reading content.
	
To place an/-- element called (classes - text) at the top level:
	execute JavaScript command "vorple.layout.focus('main#haven')";
	place block level element called classes.
	

Section 3 - Displaying content

To display text (content - text) in all the/-- elements called (classes - text):
	let print-safe content be escaped content using "\n" as line breaks;
	execute JavaScript command "$('.[classes]').text('[print-safe content]')".

To display text (content - text) in the/-- element called (classes - text):
	display text content in all elements called "[classes]:last".

Section 4 - Output focus
	
To set output focus to the/an/-- element called (target - text):
	execute JavaScript command "vorple.layout.focus('.[target]')".

To set output focus to the/-- main window:
	execute JavaScript command "vorple.layout.focus('#window0')".


Section 5 - Counting and testing for existence

To decide which number is the number of elements called (classes - text):
	execute JavaScript command "$('.'+'[classes]'.split(' ').join('.')).length";
	decide on the number returned by the JavaScript command.

To decide if an/the/-- element called (classes - text) exists:
	if the number of elements called classes is greater than 0:
		decide yes;
	decide no.

To decide if an/the/-- element called (classes - text) doesn't exist:
	if the element called classes exists:
		decide no;
	decide yes.


Section 6 - Scrolling

To scroll to an/the/-- element called (classes - text):
	execute JavaScript command "vorple.layout.scrollTo('.[classes]:last')".

To scroll to the/-- end/bottom of the/-- page:
	execute JavaScript command "vorple.layout.scrollToEnd()".


Chapter 5 - User Interface Setup

The Vorple interface setup rules is a rulebook.

This is the Vorple interface setup stage rule:
	if Vorple is supported:
		execute JavaScript command "window._vorpleSetupRulebookHasRun||false";
		if the JavaScript command returned false:
			follow the Vorple interface setup rules;
			execute JavaScript command "window._vorpleSetupRulebookHasRun=true".

The Vorple interface setup stage rule is listed before the when play begins stage rule in the startup rulebook.


Chapter 6 - Prompt

[This is an internal helper variable that shouldn't be changed manually. To change the prompt, changing the usual "command prompt" variable should work fine.]
The Vorple prompt is text that varies. The Vorple prompt is "".

Last before reading a command (this is the convert default prompt to Vorple prompt rule):
	if Vorple is supported:
		let new prompt be the substituted form of the command prompt; [this prevents any say phrases with side effects inside the command prompt from triggering twice]
		if the Vorple prompt is not the new prompt:
			now the Vorple prompt is the new prompt;
			execute JavaScript command "vorple.prompt.setPrefix('[escaped Vorple prompt]')".

Last rule for clarifying the parser's choice (this is the change Vorple prompt when clarifying choice rule):
	follow the convert default prompt to Vorple prompt rule;
	make no decision.
	
Last after asking which do you mean (this is the change Vorple prompt when asking which do you mean rule):
	follow the convert default prompt to Vorple prompt rule;
	make no decision.

First rule for printing a parser error when the latest parser error is the I beg your pardon error (this is the change Vorple prompt when input is empty rule):
	follow the convert default prompt to Vorple prompt rule;
	make no decision.
	

Include (-
Replace PrintPrompt;
-) before "Printing.i6t".

Include (-
[ PrintPrompt i;
	RunTimeProblemShow();
	ClearRTP();
	style roman;
	EnsureBreakBeforePrompt();
	if( ~~(+ Vorple support +) )  TEXT_TY_Say( (Global_Vars-->1) );
	ClearBoxedText();
	ClearParagraphing(14);
];
-) after "Printing.i6t".


Chapter 7 - Unique identifiers
	
To decide which text is unique identifier:
	let id be "id";
	repeat with X running from 1 to 3:
		let rnd be a random number from 1000 to 9999;
		now id is "[id][rnd]";
	decide on id.


Chapter 8 - UI blocking

To block the user interface:
	execute JavaScript command "vorple.layout.block()".

To unblock the user interface:
	execute JavaScript command "vorple.layout.unblock()".


Chapter 9 - Window title

First when play begins (this is the set window title to story title rule):
	execute JavaScript command "document.title='[escaped story title]'".


Chapter 10 - Credits

[The Vorple version is shown in the banner by default, but there is no obligation to display it or otherwise credit Vorple (other than good manners.) The rule can be removed with "The display Vorple credits rule is not listed in any rulebook."]
First after printing the banner text (this is the display Vorple credits rule):
	if Vorple is supported:
		execute JavaScript command "vorple.version";
		let version number be the text returned by the JavaScript command;
		say "Vorple версия [version number] preview[line break]" (A).

	
Vorple ends here.


---- DOCUMENTATION ----

The Vorple core extension defines the basic structure that's needed for the story file to communicate with the web browser, as well as other low-level rules and phrases that other extensions use to add more features to Vorple.

Authors who are not familiar with JavaScript or who wish to just use the basic Vorple features can read only the first three chapters (Vorple setup, compatibility with offline interpreters and the brief note about the command prompt). The rest of this documentation handles more advanced usage. For more practical usage of Vorple, see other Vorple extensions that implement specific features like multimedia support and hyperlinks.


Chapter: Vorple setup

Every Vorple story must include at least one Vorple extension and the custom web interpreter.

	*: Include Vorple by Juhana Leinonen.
	Release along with the "Vorple" interpreter.

All standard Vorple extensions already have the "Include Vorple" line, so it's not necessary to add it to the story project if at least one of the other extensions are used.

In contrast to previous versions that were only for Z-Machine, version 3 of Vorple is for Glulx only. The project's story file format must be set to Glulx in Inform's Settings pane.
	
At the time of release of the current, third version of Vorple, the latest Inform release 6M62 includes the older version 2 of Vorple which is not compatible with the new extensions. The latest Vorple interpreter template is in the same package as these extensions.

Also note that old Vorple extensions are not compatible with the current version of Vorple. If you get en error message about an extension being for Z-Machine only, the project is trying to include an old extension.

For more detailed instructions on how to get started see the documentation at the vorple-if.com website.


Chapter: Compatibility with offline interpreters

Even though Vorple can accomplish many things that are plain impossible to do with traditional interpreters, it's always a good idea to make the story playable text-only as well if at all possible. There are many players to whom a web interpreter or Vorple's features aren't accessible, and it's the Right Thing To Do to not exclude people if it's possible to include them.

A story file can detect if it's being run on an interpreter that supports Vorple. The same story file can therefore be run on both the Vorple web interpreter and other interpreters that have text-only features and display substitute content if necessary. We can test for Vorple's presence with "if Vorple is supported":

	Instead of going north:
		if Vorple is supported:
			play sound file "marching_band.mp3";
		otherwise:
			say "A marching band crossing the street blocks your way."

(The above example uses the Vorple Multimedia extension.)

The say phrase in the above example is called a "fallback" and it's displayed only in normal non-Vorple interpreters.

All Vorple features do nothing by default if they're not supported by the interpreter, unless otherwise stated in the extension's documentation. If substitute content is not necessary, we don't need to specifically check for Vorple compatibility:

	Instead of going north:
		play sound file "marching_band.mp3".
		
Many Vorple features can be replicated at least to some extent on standard Glulx interpreters, but in general Vorple extensions don't try to use those Glulx features as a default fallback, but opt to printing plain text where applicable or doing nothing at all. Authors can use their choice of Glulx extensions and the above mentioned "if Vorple is supported" checks to make fallbacks that are most suitable for their story.


Chapter: The command prompt

To gain more control over the command prompt, Vorple replaces the built-in prompt with its own. The process should be completely automated: changing the "command prompt" variable should change the Vorple prompt as well, apart from some fringe cases where the source text or an extension does something exotic with the Glulx prompt. The prompt and the player's command are printed on the screen with custom techniques so they will not be included in the usual story output flow. It means that Glulx extensions that capture output text will not be able to read them.

The extension Vorple Command Prompt Control offers features to manipulate the command prompt and the interpreter's line input in general.


Chapter: Embedding HTML elements

We can embed simple HTML elements into story text with some helper phrases.

	place an "article" element;
	place a "h1" element called "title";
	place a block level element called "inventory";
	place an inline element called "name";

The previous example generates elements equivalent to this HTML markup:

	<article></article>
	<h1 class="title"></h1>
	<div class="inventory"></div>
	<span class="name"></span>
	
The element's name should be one word only and a valid CSS class name. It's safest to only use letters, numbers, underscores and dashes.

Text content can be added on creation:

	place a "h1" element called "title" reading "An exciting story";
	place a "h2" element reading "Story so far:";

...or after the elements have been created:
	
	say "You shall be known as ";
	place an inline element called "name";
	display text "Anonymous Adventurer" in the element called "name";
	
This technique can be used to modify the story output later (see example "Scrambled Eggs").

If the text is included at the same time when creating the element, the default behavior in non-Vorple interpreters is to print the text normally. Text added later will not do anything. In other words, 'place a "h1" element called "title" reading "An exciting story"' will print "An exciting story" in all interpreters, but 'display text "Anonymous Adventurer" in the element called "name"' will not print anything in anywhere other than the Vorple interpreter.

In the above examples element contents should be plain text only. Trying to add nested tags or text styles will lead to erratic behavior. For longer and more complex contents the tags can be opened and closed manually:

	Report reading the letter:
		open HTML tag "div" called "letter";
		place "h2" element reading "Dear Esther,";
		say "I'm writing to tell you...";
		close HTML tag.

When there are multiple elements with the same name, only the last element will be updated. This is to accommodate repeat actions and specifically UNDO which can easily generate duplicate content. To modify all elements, use the following phrase:
	
	display "Hello World!" in all elements called "greeting";

We can also test whether an element exists or not, or count the number of elements:
	
	let n be the number of elements called "greeting";
	if an element called "greeting" exists: ...
	if an element called "greeting" doesn't exist: ...
	
The extension Vorple Element Manipulation contains more tools for working with the HTML document.
	
Finally, the Vorple interpreter uses a concept called "output focus" to decide where it should print the story text. Any HTML element* can have the output focus, and any text coming from the story will be appended to the end of that element. For example we can have a separate element where the player's inventory is printed:
	
(* The element that has output focus must be able contain child elements, so void elements, for example <img> or <hr>, can receive output focus but any output is ignored.)

	Before taking inventory:
		set output focus to the element called "inventory".
		
	After taking inventory:
		set output focus to the main window;
		continue the action.
		
"Set output focus to the main window" returns the focus back to the default location.


Chapter: Scrolling to elements

The page can be scrolled to bring a named element into view:
	
	scroll to the element called "target";
	
The page then scrolls so that the target element's top is near the browser window's top. If the element is already fully visible on the page and its top position is on the top half of the window, the phrase does nothing.

A similar phrase can be used to scroll to the bottom of the page:
	
	scroll to the end of the page;


Chapter: Executing JavaScript code

Vorple breaks out of the Glulx sandbox by letting the story file send JavaScript code for the web browser to evaluate. An "execute JavaScript command" phrase is provided to do just this:

	execute JavaScript command "alert('Hello World!')";

There are no safeguards against invalid or potentially malicious JavaScript. If an illegal JavaScript expression is evaluated, the browser will show an error message in the console and the interpreter will halt. (Although this might sound ominous, there's no real danger unless you're doing some very complex things that involve evaluating JavaScript from unknown or untrusted sources, and the web browser itself has its own safeguards. Using any of the official Vorple extensions is safe.)

Any value the JavaScript code returns can be retrieved with "the value returned by the JavaScript command" which gives the return value as text. If we know the type of the return value, we can use specific phrases to retrieve values of those types:
	
	the text returned by the JavaScript command
	the number returned by the JavaScript command
	the truth state returned by the JavaScript command
	
There's also a shorthand phrase for testing for boolean return values:
	
	if the JavaScript command returned true:
		say "Yup."
	
The type of the return value can be retrieved with "the type of the value returned by the JavaScript command". The list of all possible return value types is in the technical documentation (link below).

The return value gets overwritten by the next JavaScript command's return value (or "undefined" if it doesn't return anything), so it's best to save the value immediately to a variable after executing the command. Otherwise another JavaScript between executing the command and reading the value might cause a hard to detect bug. The other code call might not be obvious, for example changing the font style with the Vorple Screen Effects extension involves a JavaScript call.

	execute JavaScript command "[bracket]'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'[close bracket][bracket]new Date().getDay()[close bracket]";
	let weekday be the text returned by the JavaScript command;
	say "It's [weekday]!"

See the technical documentation at http://github.com/vorple/vorple/wiki for more details.


Chapter: Escaping strings

When evaluating JavaScript expressions, quotation marks must often be exactly right. Inform formats quotes according to literary standards which doesn't necessarily work together with JavaScript. Consider the following example:

	To greet (name - text):
		execute JavaScript command "alert( 'Hello [name]!' )".

	When play begins:
		greet "William 'Bill' O'Malley".

This leads to a JavaScript error because all single quotes (except the one in "O'Malley") are converted to double quotes, which in turn leads to a JavaScript syntax error. Changing the string delimiters to single quotes wouldn't help because there's an unescaped single quote as well inside the string.

To escape text we can prefix it with "escaped", which adds backslashes before characters that might cause problems inside strings:

	To greet (name - text):
		execute JavaScript command "alert( 'Hello [escaped name]!' )".

Now the string can be safely used in the JavaScript expression.

By default escaping removes newlines. If we want to turn them into, for example, HTML line breaks, or just preserve them:

	To greet (name - text):
		let safe name be escaped name using "\n" as line breaks;
		execute JavaScript command "alert( 'Hello [safe name]!' )".
		
Remember to use "[bracket]" and "[close bracket]" for square brackets in JavaScript code.

	execute JavaScript command "var myArray = [bracket]1, 2, 3[close bracket]".


Chapter: User interface setup

Vorple provides a separate rulebook called "Vorple interface setup" for setting up the user interface on the browser side. It runs during startup before the "when play begins" rules. The rulebook is meant for rules that build or initialize the user interface that has to be ready before the story does anything else. 

The following example sets up a click handler that adds a custom CSS class to the command prompt. Depending on the CSS rule it might flash the prompt to draw attention to it.

	Vorple interface setup rule:
		execute JavaScript command "$(document).on('click', function() { $('#lineinput').addClass('highlight') }".

When building any user interface elements we need to remember that through save/restore the player can continue the story potentially from any point or rewind actions with undo or restart, unless the story has disabled those commands. We can't rely on JavaScript code that has been run during previous commands because the player might have skipped them by restoring a later save, and we can't assume that turns happen only once because the player might undo and replay a turn. Therefore it's best to initialize the user interface at story start instead of along the way as the story progresses.

There's a mechanism in place that prevents the interface setup rules from running more than once during one session, even if the player restarts the story. In other words the interface setup rules run only when the web page loads. This guarantees that we can't add duplicate event handlers by mistake or otherwise run things twice that should only be run once.


Chapter: Blocking the user interface

If at some point we need to wait for a network request or some other asynchronous operation to finish before continuing with the story, we can prevent the player from doing anything in the meanwhile by blocking the user interface. When the user interface is blocked the player can't type or click on anything, but they can still scroll the page normally. The phrases to block and unblock the user interface are:
	
	block the user interface;
	unblock the user interface;

Usually it's the JavaScript code that will unblock the user interface when it's ready by running a "vorple.layout.unblock()" call, but the Inform 7 phrase is provided for cases where the script executes a parser command that causes the story to continue normally.

Note that manually blocking the user interface is necessary only in asynchronous operations, most notably network requests via Ajax. Normal synchronous code already blocks the user interface so the turn can't end before all code has been executed.

The example "The Sum of Human Knowledge" shows one use case where we might want to block the user interface: it takes some time for the request to Wikipedia to finish and we don't want the player to continue before the response has been shown on the screen.

Even though typing is disabled while the user interface is blocked, the command prompt is still visible by default (if the story is waiting for line input). In the extension Vorple Command Prompt Control there are phrases to hide the command prompt which can be used together with or instead of blocking the user interface.

		
Example: ** Convenience Store - Displaying the inventory styled as a HTML list.

We'll display the inventory listing using HTML unordered lists ("ul"). It might not be immediately obvious why one would want to do this, but if the items are displayed in a proper HTML structure it's possible to use CSS to style them further.
		
	*: "Convenience Store"
	
	Include Vorple by Juhana Leinonen.
	Release along with the "Vorple" interpreter.

	Carry out taking inventory (this is the print inventory using HTML lists rule):
		if Vorple is supported:
			say "[We] [are] carrying:[line break]" (A);
			open HTML tag "ul";
			repeat with item running through things carried by the player:
				place "li" element reading "[item]";
				if the item contains something:
					open HTML tag "ul";
					repeat with content running through things contained by the item:
						place "li" element reading "[content]";
					close HTML tag;
			close HTML tag;
		otherwise:
			follow the print standard inventory rule.
				
	The print inventory using HTML lists rule is listed instead of the print standard inventory rule in the carry out taking inventory rules.  

	The Convenience store is a room. The eggs, the milk, the jar of pickles, the magazine, and the can opener are in the Convenience store. The paper bag is an open container in the Convenience store.
	
	Test me with "take all / i / put all in paper bag / i".


Example: ** Scrambled Eggs - Hints that are initially shown obscured and revealed on request.

The hint system works by wrapping scrambled hints in named elements. Their contents can then be later replaced with unscrambled text.

	
	*: "Scrambled Eggs"
	
	Include Vorple by Juhana Leinonen.
	Release along with the "Vorple" interpreter.
	
	
	Chapter 1 - World
	
	Kitchen is a room. "Your task is to find a frying pan!"
	The table is a fixed in place supporter in the kitchen.
	The frying pan is on the table. 
	
	After taking the frying pan:
		end the story finally saying "You found the pan!"
	
	After looking for the first time:
		say "(Type HINTS to get help.)".
	
	
	Chapter 2 - Hints
	
	Table of Hints
	hint	revealed (truth state)
	"The table is relevant."	false
	"Have you looked on the table?"	false 
	"The pan is on the table."	false
	
	Requesting hints is an action out of world.
	Understand "hint" and "hints" as requesting hints.

	Carry out requesting hints (this is the scramble hints rule):
		let the alphabet be { "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z" };
		let row number be 1;
		repeat through table of hints:
			let scrambled hint be "";
			say "[row number]) ";
			if revealed entry is true:
				now scrambled hint is hint entry;
			otherwise:
				repeat with index running from 1 to the number of characters in hint entry:
					if character number index in hint entry is " ":
						now scrambled hint is "[scrambled hint] ";
					otherwise:
						let rnd be a random number between 1 and the number of entries in the alphabet;
						now scrambled hint is "[scrambled hint][entry rnd in the alphabet]";
			place an element called "hint-[row number]" reading "[scrambled hint]";
			say line break;
			increment row number;
		say "[line break](Type REVEAL # where # is the number of the hint you want to unscramble.)".
		
	Revealing hint is an action out of world applying to one number.
	Understand "reveal [number]" as revealing hint.
	
	Check revealing hint (this is the check boundaries rule):
		if the number understood is less than 1 or the number understood is greater than the number of rows in the table of hints:
			say "Please choose a number between 1 and [number of rows in table of hints]." instead.
	
	Carry out revealing hint when Vorple is not supported (this is the unscrambling fallback rule):
		choose row number understood in the table of hints;
		say "[hint entry][line break]".
		
	Carry out revealing hint (this is the change past transcript rule):
		choose row number understood in the table of hints;
		display text hint entry in the element called "hint-[number understood]".
		
	Test me with "hints / reveal 1 / reveal 2 / reveal 3".


Example: *** The Grandfather Clock - Setting the story time to match the real-world time.

In the "synchronize clocks" phrase the system time is retrieved by JavaScript and the story's internal "time of day" variable is changed to match the system time. 

	*: "The Grandfather Clock"
	
	Include Vorple by Juhana Leinonen.
	Release along with the "Vorple" interpreter.
	
	The Library is a room.
	
	The grandfather clock is in the Library. "A grandfather clock shows that the current time is [synchronized time]." The description is "The clock shows the time [synchronized time]." The grandfather clock is fixed in place.
	
	The calendar is in the Library. "There's a calendar on the wall." The description is "Today's date has been circled: [today's date]."
	
	To say today's date:
		if Vorple is supported:
			execute JavaScript command "var today=new Date(); [bracket]'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'[close bracket][bracket]today.getMonth()[close bracket]+' '+today.getDate()+', '+today.getFullYear()";
			say the text returned by the JavaScript command;
		otherwise:
			say "March 9, 2017." [just some random date for non-Vorple interpreters]
	
	To synchronize clocks:
		if Vorple is supported:
			[we can't set the time directly so we have to calculate the time difference between the story time and the real time in minutes and increment the story time by that amount.]
			execute JavaScript command "var now=new Date(); now.getHours()*60+now.getMinutes()";
			let real time be the number returned by the JavaScript command;
			let story time be ((the hours part of the time of day) * 60) + the minutes part of the time of day;
			let time difference be real time - story time;
			increase the time of day by time difference minutes. 
			
	To say synchronized time:
		synchronize clocks;
		say the time of day.
		

Example: **** The Sum of Human Knowledge - Retrieving and displaying data from a third party service.

Here we set up an encyclopedia that can be used to query articles from Wikipedia. The actual querying code is a bit longer so it's placed in an external encyclopedia.js file, which can be downloaded from http://vorple-if.com/doc/resources.zip . Put the file in the project's Resources folder to include it with the release.

Note that the pause between issuing the lookup command and the encyclopedia text appearing on the screen is caused by the time it takes to send a request to and receive a response from Wikipedia.

	*: "The Sum of Human Knowledge"
	
	Include Vorple by Juhana Leinonen.
	Release along with the "Vorple" interpreter.
	Release along with JavaScript "encyclopedia.js".
	
	Library is a room. "The shelves are filled with volumes of an encyclopedia. You can look up any topic you want."
	
	Looking up is an action applying to one topic.
	Understand "look up [text]" as looking up.
	
	Carry out looking up when Vorple is supported:
		place a block level element called "dictionary-entry";		
		execute JavaScript command "wikipedia_query('[escaped topic understood]')";
		say run paragraph on;
		block the user interface. [the Wikipedia script will unblock the UI]
		
	Report looking up when Vorple is not supported:
		say "You find the correct volume and learn about [topic understood].".
	 	
	Test me with "look up ducks / look up granite / look up interactive fiction".
	
	