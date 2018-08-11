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
[ NEW_VM_STARTUP_R;
	CarryOutActivity(STARTING_VIRTUAL_MACHINE_ACT);
	VM_Initialise();
	rfalse;
];
-)

The virtual machine startup rule is not listed in any rulebook.
The new VM startup rule translates into I6 as "NEW_VM_STARTUP_R".
The new VM startup rule is listed first in the startup rulebook.


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
	open HTML tag "div" called "header";
	open HTML tag "div" called "logo";
	display text "JMAIL" in element called "logo";
	close HTML tag;[/logo]
	[place a link to the command "link close" called "closeButton" reading "Close";]
	close HTML tag; [/header]
	open HTML tag "div" called "row";
	open HTML tag "div" called "column left";
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
	close HTML tag; [/column.left]
	open HTML tag "div" called "column right";
	close HTML tag; [/column.right]
	close HTML tag; [/row]
	open HTML tag "div" called "footer";
	close HTML tag;[/footer]
	set output focus to the element called "column right";
	say "Here is some mail content.";	
	set output focus to the element called "footer".



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
	say "Doing something.";
	set output focus to the main window;
	open HTML tag "iframe" called "dragonWindow";
	close HTML tag;
	execute JavaScript command "$(document.getElementsByClassName('dragonWindow')).attr('src', 'http://ifarchive.org/if-archive/games/competition2017/The%20Dragon%20Will%20Tell%20You%20Your%20Future%20Now/The%20Dragon%20Will%20Tell%20You%20Your%20Future%20Now.html')";
	set output focus to the element called "debugWindow".


After Linkaging when topicDuJour is "junk":
	display a notification with title "Achievement" reading "Checked Junk!".