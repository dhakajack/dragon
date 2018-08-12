"Dragon2" by Jack Welch

Include Vorple Element Manipulation by Juhana Leinonen.
Include Vorple Hyperlinks by Juhana Leinonen.
Include Vorple Command Prompt Control by Juhana Leinonen.
Include Vorple Modal Windows by Juhana Leinonen.
Include Vorple Notifications by Juhana Leinonen.  
Include Vorple Multimedia by Juhana Leinonen.

Release along with the "Vorple" interpreter.
Release along with style sheet "dragon.css".
Release along with the file "balloons.png" and the file "plucky.mp3".

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
	place a block level element called "powered";
	move the element called "powered" under "footer";
	place a block level element called "debugWindow";
	display text "JMAIL" in element called "logo";
	set output focus to the element called "column-right";
	place an image "balloons.png" with the description "A cluster of colorful party balloons", centered;
	place a block level element called "bigred";
	set output focus to the element called "bigred";
	say "Congratulations![paragraph break]You have hit zero inbox!";	
	move the element called "bigred" under "column-right";
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
	set output focus to the element called "powered";
	say "Powered by ";
	place a link to the command "link inform" reading "Inform";
	say " and ";
	place a link to the command "link vorple" reading "Vorple";
	say ".";
	set output focus to the element called "debugWindow".
	[later, the debug window will be made invisible]
	

	
Linkaging is an action applying to one topic.  Understand "link [text]" as linkaging.

Carry out Linkaging:
	now the topicDuJour is the topic understood.

Report Linkaging:
	say "The [topic understood] link was selected."
	
After Linkaging when topicDuJour is "TDWTYFN":
	clear the element called "column-right";
	open HTML tag "iframe" called "dragonWindow";
	close HTML tag;
	move the element called "dragonWindow" under "column-right";
	execute JavaScript command "$(document.getElementsByClassName('dragonWindow')).attr('src', 'http://ifarchive.org/if-archive/games/competition2017/The%20Dragon%20Will%20Tell%20You%20Your%20Future%20Now/The%20Dragon%20Will%20Tell%20You%20Your%20Future%20Now.html')";
	set output focus to the element called "debugWindow".
	
After Linkaging when topicDuJour is "junk":
	display a notification with title "Achievement" reading "Checked Junk!".
	
After Linkaging when topicDuJour is "inform":
	clear the element called "column-right";
	set output focus to the element called "column-right";
	say banner text;
	say line break;
	say "Thanks to all those who have worked on Inform and in the Inform ecosystem. This story was written in [bold type]Inform 7[roman type] and compiled for the [bold type]Glulx[roman type] virtual machine.";
	set output focus to the element called "debugWindow".
	
After Linkaging when topicDuJour is "vorple":
	clear the element called "column-right";
	set output focus to the element called "column-right";
	say "[bold type]Vorple[roman type] version 3.0 [italic type]preview[roman type] by Juhana Leinonen[paragraph break]";
	open HTML tag "u";
	say "Modules";
	close HTML tag;
	say ":[line break]";
	open HTML tag "ul";
	place "li" element reading "Vorple Element Manipulation";
	place "li" element reading "Command Prompt Control";
	place "li" element reading "Vorple Hyperlinks";
	place "li" element reading "Notifications";
	place "li" element reading "Multimedia";
	close HTML tag;
	set output focus to the element called "debugWindow".

