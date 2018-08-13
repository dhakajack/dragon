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

Chapter 1 - Globals

The debug flag is a truth state that varies. The debug flag is true.

The topicDuJour is a text that varies. The topicDuJour is "inbox".

The history buffer is a list of text that varies. The history buffer is {"inbox"}.

Chapter 2 - Kinds

Section 1 - Epistles

An epistle is a kind of thing.
An epistle has some text called date, recipient, carboncopy, subject, and payload.
An epistle can be read. An epistle is usually not read.
The date of an epistle is usually "".
The recipient of an epistle is usually "".
The carboncopy of an epistle is usually "".
The subject of an epistle is usually "".
The payload of an epistle is usually "".
Every epistle is in the lab.

Section 2 - MailFolders

A mailfolder is a kind of thing. 
A mailfolder has a list of epistles called manifest.
The manifest of a mailfolder is usually {}.

Chapter 3 - Start Up

[To make inform happy, here's a room.]

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
	[hide the prompt;   <-- is this really necessary given the output redirection each turn?]
	now the default notification duration is 3;
	layout the screen.

The display Vorple credits rule is not listed in any rulebook.
	
Rule for printing the name of a room:
	do nothing.

To layout the screen:	
	place a block level element called "header";
	place a block level element called "logo";
	[place a block level element called "controls";]
	move the element called "logo" under "header";
	display text "JMAIL" in element called "logo";
	place a link to the command "link back" called "control-back" reading "Back";
	move the element called "control-back" under "header";
	place a block level element called "row";
	place a block level element called "column-left";
	place a block level element called "column-right";
	move the element called "column-left" under "row";
	move the element called "column-right" under "row";
	place a block level element called "footer";
	place a block level element called "powered";
	move the element called "powered" under "footer";
	place a block level element called "debugWindow";
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
	
Chapter 4 - Linkaging
	
Linkaging is an action applying to one topic.  Understand "link [text]" as linkaging.

Check Linkaging:
	[don't do something unless it's a change from current display]
	if the topicDuJour is the topic understood:
		if debug flag is true:
			say "Duplicate action rejected: [topicDuJour].";
		stop the action.
	
Carry out Linkaging:
	say "The topic understood is [quotation mark][topic understood][quotation mark].";
	if "back" is the topic understood:
		if debug flag is true:
			say "Going back!";
		let N be the number of entries in the history buffer;
		if debug flag is true:
			say "N is [N].";
		if N is greater than 1:
			now the topicDuJour is entry (N - 1) of the history buffer;
			if debug flag is true:
				say "Changing the topicDuJour to [topicDuJour].";
			change the history buffer to have (N - 1) entries;
			clear the element called "column-right";
	otherwise:
		now the topicDuJour is the topic understood;
		add the topicDuJour to the history buffer;
		if debug flag is true:
			say "history buffer added [topicDuJour] for [number of entries of the history buffer] entries.";
		clear the element called "column-right".
		
Report Linkaging:
	say "The [topic understood] link was selected and the current topic is [topicDuJour]."


Section 1 - Handle Links

[This wonky bit handles all display of all the epistles]
After Linkaging when topicDuJour matches the text "mail-":
	let V be topicDuJour;
	replace the text "mail-" in V with "";
	say "V is [V].";
	repeat with item running through epistles:
		say "Checking out [item].";
		if "[item]" is "[v]":
			clear the element called "column-right";
			set output focus to the element called "column-right";
			say "[bold type]Subject: [subject of item][roman type][line break][bold type]Date: [roman type][date of item][line break][bold type]To: [roman type]IFTF Admin[line break]";
			if carboncopy of the item is not "":
				say "[bold type]CC: [roman type][carboncopy of the item][line break]";
			place a block level element called "hrsub";
			say payload of item;
			break.
	
After Linkaging when topicDuJour is "TDWTYFN":
	open HTML tag "iframe" called "dragonWindow";
	close HTML tag;
	move the element called "dragonWindow" under "column-right";
	execute JavaScript command "$(document.getElementsByClassName('dragonWindow')).attr('src', 'http://ifarchive.org/if-archive/games/competition2017/The%20Dragon%20Will%20Tell%20You%20Your%20Future%20Now/The%20Dragon%20Will%20Tell%20You%20Your%20Future%20Now.html')".
	
After Linkaging when topicDuJour is "inform":
	set output focus to the element called "column-right";
	say banner text;
	say line break;
	say "Thanks to all those who have worked on Inform and in the Inform ecosystem. This story was written in [bold type]Inform 7[roman type] and compiled for the [bold type]Glulx[roman type] virtual machine."
	
After Linkaging when topicDuJour is "vorple":
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
	close HTML tag.
	
After Linkaging when topicDuJour is "junk":
	[display a notification with title "Achievement" reading "Checked Junk!";]
	set output focus to the element called "column-right";
	repeat with item running through manifest of junkFolder:
		place a link to command "link mail-[item]" reading "[subject of item]";
		say paragraph break.
	
Section 2 - Story Links

	
Chapter 6 - Every Turn

Every turn:
	set output focus to the element called "debugWindow".	

Chapter 7 - Mail Objects

Section 1 - Epistles

[Epistle Template

XXX is an epistle. XXX is read.
The date of XXX is usually "YYY".
The recipient of XXX is usually "YYY".
The carboncopy of XXX is usually "YYY".
The subject of XXX is usually "YYY".
The payload of XXX is usually "YYY".
]

SEO is an epistle. SEO is read.
The date of SEO is usually "YYY".
The recipient of SEO is usually "YYY".
The carboncopy of SEO is usually "YYY".
The subject of SEO is usually "Huge SEO Oppourtunity".
The payload of SEO is usually "HI[paragraph break]Hope you are doing well.[paragraph break]
My name is Ephram Zockspoon and working with reputed leading Search Engine Optimization Company having the experience of getting our customer's websites top in Zoodle and producing high revenue with top page rank.[paragraph break]I was searching related to your business on Zoodle and saw your website is not on first page on Zoodle for most of the relevant and user oriented keywords pertaining to your domain so I was wondering.[paragraph break]If you would be interested in getting very Affordable Search engine optimization done for your website.[paragraph break]You Can contact me with:-[paragraph break]I'd be happy to send you our package, pricing and past work details, if you'd like to assess our work.[paragraph break]Feel free to discuss any other any queries.[paragraph break]Thanks & Regards[line break]Ephram Zockspoon[line break]Manager-Business Development Team."

Chow is an epistle. Chow is read.
The date of Chow is usually "YYY".
The recipient of Chow is usually "YYY".
The carboncopy of Chow is usually "YYY".
The subject of Chow is usually "Private Bank Communication".
The payload of Chow is usually "Hello,[paragraph break]I am Roderick Chow, Business Relationship Manager with Hsing Pu Bank Ltd. I am getting in touch with you regarding the estate of a deceased client with similar last name as you, and an investment placed under our banks management some years ago.[paragraph break]Please note that I am making this contact in a private capacity, rather than on behalf of the bank. Sending you this mail is not without a measure of apprehension as to the consequences, should you not be interested in my proposal.[paragraph break]However, I appreciate within me that nothing worthwhile is ever gained without a bold venture, and that success and riches never come easy. This is the one truth I have learned from my private banking clients.[paragraph break]I will respect your freewill if you do not want to be involved. kindly let me know so I shall refrain from further communication with you.[paragraph break]Thanking you for taking the time to read my proposal, I await your response.[paragraph break]Sincerely,[paragraph break]Roderick Chow[paragraph break]".

Fatima is an epistle. Fatima is read.
The date of Fatima is usually "YYY".
The recipient of Fatima is usually "YYY".
The carboncopy of Fatima is usually "YYY".
The subject of Fatima is usually "sallut".
The payload of Fatima is usually "Cher Ami,[paragraph break]S'il vous plaît, ne soyez pas surpris dans ce message. Acceptez mes excuses si Cela vous a embarrassé. Cependant, il est urgent d'avoir un partenaire étranger qui m'a fait prendre contact avec vous.[paragraph break]Avec tout le respect que je vous dois, je m'appelle Mme Fatima, l'épouse de l'ancien directeur de l'aviation de mon pays, la République de Sahara Oriental, mais a été tué dans un conflit politique. Je suis basé au Fauzania pour un asile politique à cause de l'allégation contre mon mari selon laquelle il a détourné les fonds publics, et maintenant le gouvernement est derrière moi, c'est pourquoi j'ai dû fuir. Pour l'instant je ne peux pas retourner jusqu'à ce que toute la situation soit réglée.[paragraph break]Je dois visiter votre pays pour savoir s'il est possible d'investir l'argent de ma famille. Mais, les chambres de commerce m'ont conseillé de faire équipe avec le citoyen du pays, de sorte que je trouverai facile d'établir l'entreprise, c'est pourquoi j'ai besoin de quelqu'un en qui j'ai confiance.[paragraph break]J'aimerai investir sept millions, cinq cent mille dollars (7 500 000 $) et je veux que vous promettiez la transparence et le respect dans les contrats de partenariat. Ce sera un plaisir de vous donner 15% de l'argent total que je vais investir dans l'investissement, à cause de toute l'assistance nécessaire que vous ferez pendant l'installation.[paragraph break]J'apprécierai si vous pouvez me répondre, afin que nous puissions discuter plus loin.[paragraph break]Merci, que Dieu vous bénisse.[line break]Mme, Fatima Kala-Azar.".


Section 2 - Mail Folders

InboxFolder is a mailfolder.

JunkFolder is a mailfolder. The manifest of JunkFolder is { SEO , Chow , Fatima }.

SentFolder is a mailfolder.




