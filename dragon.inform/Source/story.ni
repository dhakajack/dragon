"Dragon2" by Jack Welch

Include Vorple Element Manipulation by Juhana Leinonen.
Include Vorple Hyperlinks by Juhana Leinonen.
Include Vorple Command Prompt Control by Juhana Leinonen.
Include Vorple Modal Windows by Juhana Leinonen.
Include Vorple Notifications by Juhana Leinonen.  

Release along with the "Vorple" interpreter.
Release along with style sheet "dragon.css".

The topicDuJour is a text that varies.

The lab is a room.


[Get ride of the three line feeds that occur before the start of play; they are hardwired into the the built in startup routine, which is found in OrderOfPlay.i6t]

Include (-
[ VIRTUAL_MACHINE_STARTUP_R;
   CarryOutActivity(STARTING_VIRTUAL_MACHINE_ACT);
   VM_Initialise();
   rfalse;
];
-) instead of "Virtual Machine Startup Rule" in "OrderOfPlay.i6t".

When play begins:
	hide the prompt;
	now the default notification duration is 3;
	layout the screen.

The display Vorple credits rule is not listed in any rulebook.
	
Rule for printing the banner text:
	do nothing.
	
Rule for printing the name of a room:
	do nothing.

To layout the screen:	
	place a block level element called "header";
	place a block level element called "logo";
	place a block level element called "controls";
	move the element called "logo" under "header";
	move the element called "controls" under "header";
	place a block level element called "row";
	place a block level element called "column-left";
	place a block level element called "column-right";
	move the element called "column-left" under "row";
	move the element called "column-right" under "row";
	place a block level element called "footer";
	place a block level element called "debugWindow";
	display text "JMAIL" in element called "logo";
	set output focus to the element called "column-right";
	say "Here is some mail content.";	
	place a block level element called "folders";
	move the element called "folders" under "column-left";
	place a link to the command "link inbox" called "folder-inbox" reading "Inbox";
	place a link to the command "link sent" called "folder-sent" reading "Sent";
	place a link to the command "link junk" called "folder-junk" reading "Junk";
	place a link to the command "link about" called "folder-about" reading "About";
	place a link to the command "link credits" called "folder-credits" reading "Credits";
	place a link to the command "link TDWTYFN" called "folder-tdwtyfn" reading "TDWTYFN";
	move the element called "folder-inbox" under "folders";
	move the element called "folder-sent" under "folders";
	move the element called "folder-junk" under "folders";
	move the element called "folder-about" under "folders";
	move the element called "folder-credits" under "folders";
	move the element called "folder-tdwtyfn" under "folders";
	set output focus to the element called "debugWindow".



[To setUpMail:
	place a block level element called "logo";
	display text "JMAIL" in the element called "logo";
	place a block level element called "mailContent";
	open HTML tag "div" called "folders";
	place a link to the command "link inbox" called "folderOption" reading "Inbox";
	say line break;
	place a link to the command "link sent" called "folderOption" reading "Sent";
	say line break;
	place a link to the command "link junk" called "folderOption" reading "Junk";
	say line break;
	place a link to the command "link about" called "folderOption" reading "About";
	say line break;
	place a link to the command "link credits" called "folderOption" reading "Credits";
	say line break;
	place a link to the command "link TDWTYFN" called "folderOption" reading "TDWTYFN";
	say line break;
	close HTML tag;
	place a block level element called "debugWindow";
	set output focus to the element called "mailContent";
	say "Here is some mail content.";
	set output focus to the element called "debugWindow".]
	
Linkaging is an action applying to one topic.  Understand "link [text]" as linkaging.

Carry out Linkaging:
	now the topicDuJour is the topic understood.

Report Linkaging:
	say "The [topic understood] link was selected."
	
After Linkaging when topicDuJour is "TDWTYFN":
	clear the element called "column-right";
	set output focus to the main window;
	open HTML tag "iframe" called "dragonWindow";
	close HTML tag;
	move the element called "dragonWindow" under "column-right";
	execute JavaScript command "$(document.getElementsByClassName('dragonWindow')).attr('src', 'http://ifarchive.org/if-archive/games/competition2017/The%20Dragon%20Will%20Tell%20You%20Your%20Future%20Now/The%20Dragon%20Will%20Tell%20You%20Your%20Future%20Now.html')";
	set output focus to the element called "debugWindow".


After Linkaging when topicDuJour is "junk":
	display a notification with title "Achievement" reading "Checked Junk!".