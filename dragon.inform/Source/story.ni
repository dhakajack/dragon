"Re: Dragon" by Jack Welch

The story genre is "fantasy".
The release number is 3.
The story creation year is 2018.

Include Vorple Element Manipulation by Juhana Leinonen.
Include Vorple Hyperlinks by Juhana Leinonen.
Include Vorple Notifications by Juhana Leinonen.  
Include Vorple Multimedia by Juhana Leinonen.
Include Vorple Modal Windows by Juhana Leinonen.
Include Vorple Tooltips by Juhana Leinonen.

The release number is 3. [Beta]

Release along with the "Vorple" interpreter.
Release along with style sheet "dragon.css".
Release along with [cover art, ]a file of "Blurb" called "blurb.txt", a file of "Walkthrough" called "walkthrough.txt", the file "balloons.png", the file "plucky.mp3", the file "Fax-machine-sound.mp3", and the file "place65.png".

Chapter 1 - Vorple Overrides

[to add the "followMouse" attribute so tooltip location follows pointing device]
To attach a/-- tooltip (tip - text) on/to all the/-- elements called (classes - text):
	execute JavaScript command "$('.[classes]').last().attr('title','[escaped tip]').powerTip({followMouse:true})".

Chapter 2 - Globals

The topicDuJour is a text that varies. The topicDuJour is "inbox".

The lastWormTopic is a text that varies. The lastWormTopic is "worm-start".

The turn hold flag is a truth state that varies. The turn hold flag is false.
The turnTimer is a number that varies. The turnTimer is 0.

ScryView enabled flag is a truth state that varies. The scryView enabled flag is false.
DragonView enabled flag is a truth state that varies. The DragonView enabled flag is false.

Section 1 - World State Flags

The reviewed flag is a truth state that varies. The reviewed flag is false.
The informal flag is a truth state that varies. The informal flag is false.
The coffee flag is a truth state that varies. The coffee flag is false.
The coffee_gone flag is a truth state that varies. The coffee_gone flag is false.
The squeaky_hinge flag is a truth state that varies. The squeaky_hinge flag is true.
The dimensionality_explained flag is a truth state that varies. The dimensionality_explained flag is false.
The last_mail_received flag is a truth state that varies. The last_mail_received flag is false.

Chapter 3 - Kinds

Section 1 - Epistles

An epistle is a kind of thing.
An epistle has some text called date, correspondent, carboncopy, subject, and payload.
An epistle has a number called receiveTime. The receiveTime of an epistle is usually -1.
An epistle can be read. An epistle is usually not read.
The date of an epistle is usually "".
The correspondent of an epistle is usually "IFTFF Admin".
The carboncopy of an epistle is usually "".
The subject of an epistle is usually "".
The payload of an epistle is usually "".
Every epistle is in the lab.

Section 2 - MailFolders

A mailfolder is a kind of thing. 
A mailfolder has a list of epistles called manifest.
The manifest of a mailfolder is usually {}.
[maximum age of emails in this folder in minutes, 1440 in a day; keep less then 32k]
A mailfolder has a number called maxAge.
The maxAge of a mailfolder is usually 2880.

Chapter 4 - Start Up

[To make inform happy, here's a room.]

The lab is a room.

[Get ride of the three line feeds that occur before the start of play; they are hardwired into the the built in startup routine, which is found in OrderOfPlay.i6t -- thanks Zarf for that info]

Include (-
[ VIRTUAL_MACHINE_STARTUP_R;
   CarryOutActivity(STARTING_VIRTUAL_MACHINE_ACT);
   VM_Initialise();
   rfalse;
];
-) instead of "Virtual Machine Startup Rule" in "OrderOfPlay.i6t".

When play begins:
	now the default notification duration is 3;
	layout the screen;
	backdate email.

The display Vorple credits rule is not listed in any rulebook.
	
Rule for printing the name of a room:
	do nothing.

To layout the screen:	
	[stick the function on the page -- we'll call it later, e.g., when timestamping mail messages]
	execute Javascript command "function timestamp(temporalOffset) {
		var today=new Date(); 
		today.setMinutes(today.getMinutes()- temporalOffset); 
		var min=today.getMinutes(); 
		var hr=today.getHours(); 
		if (hr == 0) {
			hr = 12; 
		}
		else if ( hr > 12) {
			hr -= 12;
		}
		return ([bracket]'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'[close bracket][bracket]today.getMonth()[close bracket]+' '+today.getDate()+', '+today.getFullYear()+' '+(hr < 10 ? ' ' : '')+hr+':'+(min < 10 ? '0':'')+min+' '+(today.getHours() > 11 ? 'PM' : 'AM'));
	}";
	place a block level element called "header";
	place a block level element called "logo";
	move the element called "logo" under "header";
	display text "JMAIL" in element called "logo";
	place a block level element called "row";
	place a block level element called "column-left";
	place a block level element called "column-right";
	move the element called "column-left" under "row";
	move the element called "column-right" under "row";
	place a block level element called "footer";
	place a block level element called "powered";
	move the element called "powered" under "footer";
	place a block level element called "debugWindow";
	display party screen;
	move the element called "bigred" under "column-right";
	place a block level element called "folders";
	move the element called "folders" under "column-left";
	place a block level element called "navSelect";
	move the element called "navSelect" under "column-left";
	place a link to the command "link ScryDragon" called "ScryDragon" reading "Scry the Dragon";
	move the element called "ScryDragon" under "navSelect";
	hide the element called "ScryDragon";
	attach a tooltip "Click to astrally spy upon the events of 2017; return any time to email by clicking one of the folder, above." on the element called "ScryDragon";
	place a link to the command "link inbox" called "folder-inbox" reading "Inbox";
	place a link to the command "link sent" called "folder-sent" reading "Sent";
	place a link to the command "link junk" called "folder-junk" reading "Junk";
	place a link to the command "link about" called "folder-about" reading "About";
	place a link to the command "link credits" called "folder-credits" reading "Credits";
		place a link to web site "mailto:redragon@templaro.com" called "folder-bugs" reading "Feedback";
	move the element called "folder-inbox" under "folders";
	move the element called "folder-sent" under "folders";
	move the element called "folder-junk" under "folders";
	move the element called "folder-about" under "folders";
	move the element called "folder-credits" under "folders";
	move the element called "folder-bugs" under "folders";
	set output focus to the element called "powered";
	say "Powered by ";
	place a link to the command "link inform" reading "Inform";
	say " and ";
	place a link to the command "link vorple" reading "Vorple";
	say ".";
	set output focus to the element called "debugWindow".
	[debug window is invisible; to make it visible, alter the css to remove hidden attribute]
	
To backdate email:
	repeat with folder running through mailfolders:
		let timeOffset be 0;
		let minuteDecrement be maxAge of folder / (number of entries in the manifest of folder + 1);
		repeat with mail running through manifest of folder:
			let timeSalt be a random number between 1 and 13;
			now timeOffset is timeOffset + minuteDecrement + timeSalt;
			say "folder [folder] / mail [mail] - maxage [maxage of the folder], minutedec [minuteDecrement], timeOffset [timeOffset].";
			execute JavaScript command "timestamp([timeOffset]);";
			now the date of the mail is the text returned by the JavaScript command.
			
To say this page:
	execute Javascript command "window.location.href;";
	say the text returned by the JavaScript command.
	
Chapter 5 - Linkaging
	
Linkaging is an action applying to one topic.  Understand "link [text]" as linkaging.

Check Linkaging:
	[don't do something unless it's a change from current display]
	if the topicDuJour is the topic understood:
		say "Duplicate action rejected: [topicDuJour].";
		now the turn hold flag is true;
		stop the action.
	
Carry out Linkaging:
	say "The topic understood is [quotation mark][topic understood][quotation mark].";
	now the topicDuJour is the topic understood;[it's a new topic]
	if the topicDuJour is "ScryDragon":
		now the TopicDuJour is lastWormTopic;
		say "Redirecting to the most recent Scrying topic: [lastWormTopic].";
	if the topicDuJour matches the text "worm-":
		now the lastWormTopic is the topicDuJour;[book mark it as the most recent worm command];
		hide the element called "ScryDragon";
		add name "back-blue" to the element called "column-right";
	otherwise:
		remove name "back-blue" from the element called "column-right"; 
		if ScryView enabled flag is true:
			show the element called "ScryDragon";
	clear the element called "column-right";
	set output focus to the element called "column-right".

Report Linkaging:[fires if no after rule supersedes it]
	say "Error. If you are seeing this, no After Rule has captured a link click event. The [topic understood] link was selected and the current topic is [topicDuJour]. Tracking the last worm topic as [lastWormTopic]."

Section 1 - Mail Links

[Everything is a link. Pages are links, options are links, emails are links, yada, yada.]

[This wonky bit handles all display of all the epistles]

After Linkaging when topicDuJour matches the text "mail-":
	let V be topicDuJour;
	replace the text "mail-" in V with "";
	set output focus to the element called "debugWindow";
	say "V is [V].";
	repeat with item running through epistles:
		say "Checking out [item].";
		if "[item]" is "[v]":
			clear the element called "column-right";
			set output focus to the element called "column-right";
			say "[bold type]Subject: [subject of item][roman type][line break][bold type]Date: [roman type][date of item][line break][bold type]To: [roman type][correspondent of item][line break]";
			if carboncopy of the item is not "":
				say "[bold type]CC: [roman type][carboncopy of the item][line break]";
			place a block level element called "hrsub";
			say payload of item;
			now the item is read;
			break.
			
Section 2 - Top Level Links
	
After Linkaging when topicDuJour is "TDWTYYFN":
	let outLinkURL be "http://ifarchive.org/if-archive/games/competition2017/The%20Dragon%20Will%20Tell%20You%20Your%20Future%20Now/The%20Dragon%20Will%20Tell%20You%20Your%20Future%20Now.html";
	set output focus to the element called "column-right";
	now reviewed flag is true;
	open HTML tag "a" called "link-outLink";
	place an image "place65.png" called "outlinkImage" with the description "A screen capture from the 2017 IFcomp website entry for The Dragon Will Tell You Your Future Now, which ranked 65th in that competition.", centered;
	close HTML tag;
	execute JavaScript command "$('a.link-outLink').attr('href','[escaped outLinkURL]')";
	execute JavaScript command "$('a.link-outLink').attr('target','_blank')";
	place a link to the web site  "[outlinkURL]" called "outLink" reading "[bracket]Open the 2017 game, [quotation mark][italic type]The Dragon Will Tell You Your Fortune Now[roman type][quotation mark] in a new window.[close bracket]";
	show a modal window reading "After reviewing this outrage, don't forget to come back to your email -- Victor.".
	
After Linkaging when topicDuJour is "inform":
	say banner text;
	say line break;
	say "Thanks to all those who have worked on Inform and in the Inform ecosystem. This story was written in [bold type]Inform 7[roman type] and compiled for the [bold type]Glulx[roman type] virtual machine."
	
After Linkaging when topicDuJour is "about":
	say "There really was a game entered into the 2017 IF Comp (the real one) with the title [quotation mark][italic type]Now The Dragon Will Tell You Your Fortune[roman type][quotation mark]. The author entered under a pseudonym. As far as I know, the identify of the author is not known, but let me assert that it wasn't me. This current game can, therefore, be considered an [quotation mark]unauthorized[quotation mark] sequel.[paragraph break]Because the original game was unwinnable, most folks considered a joke entry, so relatively few people played it. I thought that the writing in that game was very good, however, and that it was a shame that it didn't reach a wider audience. After playing it, I lingered over the question of why the client wanted his fortune told and most of all, why it was so hard to get through the door to meet the dragon. Well, now the story can be told at last.[paragraph break][italic type]Source code for the game is available at: github.com/dhakajack/dragon[roman type]."
	
After Linkaging when topicDuJour is "credits":
	say "Thanks to the real IFTF and everyone who has taken on the mantle of coordinating IFcomp over the years for providing a forum for games like this. Of course, thanks to the author of [italic type]The Dragon Will Tell You Your Fortune Now[roman type], known by the pseudonym Newsreparter.[paragraph break]I would also like to acknowledge beta testers including Andrew Schultz, Ben Collins-Sussman, Lara Welch, David White and XXX other folks.[paragraph break]The toy balloon image is public domain[line break][italic type](Balloons-aj.svg on commons.wikimedia.org)[roman type][paragraph break]This project used sounds effects made available under creative commons licenses:[paragraph break]plucky.mp3[line break][italic type](notificationsounds.com)[roman type][paragraph break]Fax-machine-sound.mp3[line break][italic type](www.orangefreesounds.com)[roman type]".
	
After Linkaging when topicDuJour is "vorple":
	say "[bold type]Vorple[roman type] version 3.0 [italic type]preview[roman type] by Juhana Leinonen[paragraph break]";
	open HTML tag "u";
	say "Modules";
	close HTML tag;
	say ":[line break]";
	open HTML tag "ul";
	place "li" element reading "Element Manipulation";
	place "li" element reading "Modal Windows";
	place "li" element reading "Notifications";
	place "li" element reading "Multimedia";
	place "li" element reading "Hyperlinks";
	place "li" element reading "Tooltips";
	close HTML tag.
	
After Linkaging when topicDuJour is "junk":
	show index of junkFolder.
	
After Linkaging when topicDuJour is "inbox":
	if the number of entries in manifest of inboxFolder is 0:
		display party screen;
	otherwise:
		show index of inboxFolder.
		
To display party screen:
	set output focus to the element called "column-right";
	place an image "balloons.png" called "balloons" with the description "A cluster of colorful party balloons", centered;
	place a block level element called "bigred";
	set output focus to the element called "bigred";
	say "Congratulations![paragraph break]You have hit inbox zero! [paragraph break][paragraph break]".
	
After Linkaging when topicDuJour is "sent":
	show index of sentFolder.
	
To show index of (dossier - a mailfolder):
	set output focus to the element called "column-right";
	open HTML tag "table";
	open HTML tag "tr";
	open HTML tag "th";
	if dossier is SentFolder:
		say "To:";
	otherwise:
		say "From:";
	close HTML tag;
	open HTML tag "th";
	say "Subject:";
	close HTML tag;
	open HTML tag "th";
	say "Date:";
	close HTML tag;
	close HTML tag;
	repeat with item running through manifest of dossier:
		open HTML tag "tr";
		open HTML tag "td";
		say correspondent of item;
		close HTML tag; [/td]
		open HTML tag "td";
		open HTML tag "span" called "[if the item is read]read[otherwise]unread[end if]";
		place a link to command "link mail-[item]" reading "[subject of item]";
		close HTML tag; [/span]
		close HTML tag; [/td]
		open HTML tag "td";
		say date of the item;
		close HTML tag;[/td]
		close HTML tag;[/tr]
	close HTML tag.[/table]
		
Section 3 - Story Links

After Linkaging when topicDuJour is "satanNipples":
	say "The Book of Revelations had to stop at some point and it was an editorial decision to omit mention of the seven nipples of the Beast and all of his piercings, multitudinous though they be. Also, I should mention that this is an area of some sensitivity, so if you could refrain from mousing over the seven nipple rings of Our Dark Lord repeatedly, that would be appreciated.[paragraph break]Now that you have had your jollies, return to my [backToVictor2] of extreme importance."
	
After Linkaging when topicDuJour is "tmworm":
	say "Oh, don’t bother going looking for the theosophic mentality worm, it has already devoured its way through some superfluous memories (were they? I suppose they are now [unicode 8212] How would know?) and has sunk its hooked limbs deep into the fleshy pit of your soul. Already, it is leaching away your awareness of your surroundings and infiltrating your thoughts with its hallucinatory mind poisons. Oh, you are going to have some magnificent dreams tonight, if you survive.[paragraph break]Enough. Return to my masterfully written [backToVictor3]."
	
To say backToVictor2:
	place a link to the command "link mail-nextVictor" reading "email".
	
To say backToVictor3:
	place a link to the command "link mail-finalVictor" reading "email".
	
After Linkaging when topicDuJour is "worm-start":
	say "[start]".
		
To say start:
	say "Polymorphed into bipedal form so you can fit through the door of your secluded sylvan office, you breeze into the waiting room.[paragraph break][quotation mark]What have we got tonight?[quotation mark] you ask Dmitri, the cream-colored spectacled owl sitting behind the reception.[paragraph break][quotation mark]Greetings, your Draconic Lordship,[quotation mark] says Dmitri bowing at his spindly talons. [quotation mark]We have one client, a Mr. Nobspike, who made a last minute appointment by phone just this evening. He is a half-orc, half-gnome born in the seventh radiant of Umek, within the cusp of Norimar, with both Reevan-the-Warrior and Borram-the-Seeker rising in an opposing configuration.[quotation mark][paragraph break][quotation mark]How does that even happen?[quotation mark] you ask.[paragraph break][quotation mark]Reevan-the-Warrior was eclipsed by Borimar-the-Devastator until this afternoon, your Lordship.[quotation mark][paragraph break][quotation mark]No, I mean the half-orc, half-gnome part.[quotation mark][paragraph break][quotation mark]Yes, your Lordship. A curious pairing, indeed.[quotation mark] Dmitri hands you a stack of papers including the client’s chart, the latest astrological report, and the evening news. [pick table of start options]";
	remove the element called "ScryDragon";
	place a link to the command "link ScryDragon" called "ScryDragon" reading "Continue Scrying";
	attach a tooltip "Return to viewing the events of 2017; return to email any time." on the element called "ScryDragon";
	move the element called "ScryDragon" under "navSelect";
	hide the element called "ScryDragon".

		
Table of Start
OptionText	Link
"[quotation mark]How was your day, Dmitri?[quotation mark]"	"worm-yourDay"
"[quotation mark]Could you be a bit less formal?[quotation mark]"	"worm-lessFormal"
"[quotation mark]Where is my coffee?[quotation mark]"	"worm-whereCoffee"

After Linkaging when topicDuJour is "worm-yourDay":
	say "[yourDay]".	
	
To say yourDay:
	say “[quotation mark]Your Draconic Lordship is most kind to inquire.[quotation mark] Dmitri’s feathers fluff proudly. [quotation mark]I was up with the setting of the sun and since no clients were booked until tonight’s midnight read, I thought I would spend the early evening tightening up the tolerances on the threshold.[quotation mark][paragraph break][quotation mark]Did you?[quotation mark][paragraph break][quotation mark]I was interrupted several times by phone calls from Mr. Nobspike, our client, but I did have time to check the threshold, and the tolerances are quite tight, essentially unchanged since the last calibration. Time is on spec to within 1";
	place text "ppm" with a tooltip reading "FYI: ppm = parts per million.";
	say ", and all the other axes are balanced.[quotation mark][paragraph break][quotation mark]Fine work, Dmitri. Precision astrology is only as good as our referents, after all.[quotation mark][paragraph break][quotation mark]Service to your Draconic Lordship is my most delightful reward.[quotation mark][enterDoors]".
	
To say enterDoors:
	say "[paragraph break]You open the ";
	place a link to the command "link worm-doors" reading "doors";
	say " to your office.".
	
To say dragonName:
	if informal flag is false:
		say "Your Draconic Lordship";
	otherwise:
		say "Lord Venkath".
	
After Linkaging when topicDuJour is "worm-lessFormal":
	say "[quotation mark]How do you desire that I address you, my Draconic Lordship?[quotation mark][paragraph break][quotation mark]How about [apostrophe]Lord Venkath[apostrophe]? That seems much less stuffy that all this [apostrophe]your Draconic Lordship[apostrophe] business.[quotation mark][paragraph break][quotation mark]Your Lordship[apostrophe]s kindness touches me deeply. Do you prefer, [apostrophe]Lord Venkath of the Seven Plates[apostrophe] or just [apostrophe]Lord Venkath[apostrophe]?[paragraph break][quotation mark]Just [apostrophe]Lord Venkath[apostrophe] seems adequate.[quotation mark][paragraph break][quotation mark]Yes, Lord Venkath, so it shall be. But I could not possibly address you so in the presence of our clients, of course.[quotation mark][paragraph break][quotation mark]Of course. Etiquette must prevail.[quotation mark][paragraph break][quotation mark]Your Lordship[apostrophe]s wisdom is incontrovertible.[quotation mark] [enterDoors]";
	now the informal flag is true.
	
After Linkaging when topicDuJour is "worm-whereCoffee":
	say "[quotation mark]I have it right here in my flight sack, Your Draconic Lordship. A twenty-ounce Costa Rican Tarazu with frosty spider eggs and a touch of salt.[quotation mark][paragraph break][quotation mark]Excellent,[quotation mark] you say, taking the proffered Styrofoam cup. While taking human form is in many ways a crippling inconvenience, being able to experience caffeine makes it all worthwhile. [enterDoors]";
	now the coffee flag is true.

After Linkaging when topicDuJour is "worm-doors":
	say "The heavy mahogany doors swing inward, over the dimensional discontinuity that leads into your office. You notice that one of the hinges has gotten a bit creaky again.[pick Table of Sticky Doors options]".
	
Table of Sticky Doors
OptionText	Link
"[quotation mark]Dmitri [unicode 8212] would you give that hinge a quick shot of WD-40?[quotation mark]"	"worm-unsqueaky"
"You fix the squeaky hinge yourself with a minor cantrip, a trivial use of your talents."	"worm-unsqueaky"
"A squeaky hinge is nothing in the grand scheme. You ignore it."	"worm-office1"

After Linkaging when topicDuJour is "worm-office1":
	say weirdFeeling.
	
After Linkaging when the topicDuJour is "worm-unsqueaky":
	now the squeaky_hinge flag is false;
	say weirdFeeling.
	
To say weirdFeeling: 
	say "As you stride [if the squeaky_hinge flag is true]past the squeaky doors [end if]into your office[if coffee flag is true] sipping your coffee[end if], something doesn’t quite feel right.[paragraph break]You set [if coffee flag is true]the coffee and [end if]your papers down on your desk and heighten your awareness along the anterior temporal gradient.[paragraph break]No, something about this is [notRightAtAll]."
	
To say notRightAtAll:
	place a link to the command "link worm-notRightAtAll" reading "not right at all".
	
After Linkaging when topicDuJour is "worm-notRightAtAll":
	say "[quotation mark]Dmitri, we have a problem.[quotation mark][paragraph break]Since he can[apostrophe]t widen his eyes any further, Dmitri[apostrophe]s ears perk up in surprise. [quotation mark]A problem, [dragonName]?[quotation mark][paragraph break][quotation mark]Yes, we are being scryed upon. I only got a brief glimpse, but if I am not mistaken, someone employing a theosophic mentality worm is watching our every action.[quotation mark][paragraph break][quotation mark]Most disconcerting, [dragonName]. Why ever would anyone wish to do that? Is this an audit?[quotation mark][paragraph break][quotation mark]No, I don[apostrophe]t think so, Dmitri, as audits are contemporaneous and to be effective have to be more discreet. No, this person, who I believe is in our future, lacks the least semblance of finesse.[quotation mark][paragraph break][quotation mark]What shall we do about it, [dragonName]? Shall I dial up the Association?[quotation mark][paragraph break][quotation mark]No, let[apostrophe]s see how this plays out. There is usually a reason for this sort of thing, although it is annoying. Also, I[apostrophe]m afraid we have little choice in the matter if someone wants to play willy-nilly with multiversal manifolds, we just have to go along with it, repeating our actions and choices [italic type]ad infinitum[roman type] for their amusement.[quotation mark][paragraph break][quotation mark]Sounds dreadful.[quotation mark][paragraph break][quotation mark]Yes, but unless I pull myself out of the stream, we won[apostrophe]t even notice it, so best to just ignore it. But I do say this [unicode 8212] and now I am addressing myself our ill-mannered interloper: realize that your observation has already distorted future history, has greatly complicated my calculations for this evening, and may have destroyed any number of hypothetical realities.[quotation mark][paragraph break][quotation mark]Now then,[quotation mark] you continue, [quotation mark]I[apostrophe]m off to my [office2link].[quotation mark]".
	
To say office2link:
	place a link to the command "link worm-office2" reading "office".
	
After Linkaging when topicDuJour is "worm-office2":
	say "[one of]The heavy mahogany doors swing shut behind you[if squeaky_hinge flag is true] with an annoying squeak[end if].[paragraph break]As you set your [if coffee flag is true][drinkCoffee] and [end if][deskPapers] down, the causality stream drifts back on course and the universe assumes the more comfortable shape to which you have become accustomed.[paragraph break]Before you start the evening's work, which has already gotten off to a bumpy start, you decide to take a moment and center yourself. You recline in your black ergonomic chair and prop your feet up on the broad antique desk that fills half your office. It has been a while since you’ve seen your actual feet, which spend most of their time tucked between your ponderous body and the hoard that you have amassed over the millennia, but you find your human feet pleasing enough and enjoy wearing stylish leather shoes[or]A stack of [deskPapers] stands on your desk[if coffee flag is true and coffee_gone flag is false] next to a full cup of steaming hot [drinkCoffee][end if].[paragraph break]Daylight pours in through the [window] to the side of your desk, and outside fairies and sprites dart back and forth between the trees of the dense forest surrounding your office[if the number of filled rows in Table of Reads is 0]. You debate with yourself whether to press the [intercom] button, knowing full well that the moment the client comes in, Dmitri will let you know[end if][stopping].";
	set output focus to the element called "debugWindow";
	receive VenkathAware into inboxFolder.[redundant calls are ignored]
	
To say window:
	place a link to the command "link worm-window" reading "window".
	
To say intercom:
	place a link to the command "link worm-intercom" reading "intercom".
	
To say drinkCoffee:
	place a link to the command "link worm-drinkCoffee" reading "coffee".
	
To say deskPapers:
	place a link to the command "link worm-deskPapers" reading "papers".
	
After Linkaging when topicDuJour is "worm-drinkCoffee":
	say "The warmth of the coffee instantly puts you at ease and you fork your tongue slightly to fully appreciate its most subtle flavors. Coffee is an expensive luxury, but indispensable to achieve optimal focus for your readings. Coffee beans are not native to your Plane of Existence and are only delivered sporadically by a woman and her dog when they show up in Holsberg with a spaceship crammed full of mundane delicacies.[paragraph break]You finish sipping your coffee and toss the cup into the timeless void between space, ready to get back to [backToWork].";
	now the coffee_gone flag is true;
	receive rover into inboxFolder.
	
To say backToWork:
	place a link to the command "link worm-office2" reading "work".
	
After Linkaging when topicDuJour is "worm-deskPapers":
	say "[if the number of filled rows in Table of Reads is greater than 0]You are a little obsessive about going through all the paperwork before the first client arrives. Apparently, there is no rush tonight, since the client is so late, so you take your time to peruse the pile:[pick Table of Reads options][otherwise]You realize you have spent an unconscionable amount of your valuable time fiddling with this petty paperwork and are eager to get back to [backToWork].[end if]"
	
Table of Reads
OptionText	Link
"Tomorrow's newspaper"	"worm-newspaper"
"A freshly printed astrological update"	"worm-update"
"The client's chart"	"worm-chart"
"A gold-embossed invitation"	"worm-galaInvite"
"A computer-generated bill"	"worm-ddBill"

	
After Linkaging when the topicDuJour is "worm-galaInvite":
	say "Well, not as interesting as you would have thought from the fancy envelope: it's an invitation to speak at this year's Guild Dinner. Sigh.[pick table of Guild Dinner options]";
	wipe row "worm-galaInvite" in Table of Reads.
	
After Linkaging when the topicDuJour is "worm-ddBill":
	say "Hmm. Looks like an invoice from the Dimension Dwarves: the paper is covered with arcane symbols and calculations.[pick table of DDbill options]";
	wipe row "worm-ddBill" in Table of Reads.
	
After Linkaging when topicDuJour is "worm-newspaper":
	say "You leaf through tomorrow’s newspaper looking for any short term perturbations or causal inconsistencies, but ignore the news itself, which is too fluid to be reliable. You take particular joy in reading through the sham horoscopes and weather forecasts, which keep professional seers like you in business.[paragraph break][morePapers]";
	wipe row "worm-newspaper" in Table of Reads.
	
To say morePapers:
	say "There are plenty more [deskPapers] on the desk that demand your attention."

After Linkaging when topicDuJour is "worm-update":
	say "You start with the headlines: The long-anticipated Age of Boort-the-Deceiver is only a few days away, so there will be a mad rush to align those temples in the next couple days (despite Dentar Ten Plate having forecasted the event almost two hundred years ago).[paragraph break]Above the ecliptic, Togam-the-Fishwife is transiting the Hoary Field of Incertitude, the meaning of which, of course, is anyone’s guess.[paragraph break]On the broad sheet, the Houses of Yaptog-the-Willful and Erelam-the-Incontinent are nearing opposition along a line roughly orthogonal to Peetsokh-the-Unready. That may open up some interesting opportunities for some of your elven conjurer corporate clients.[paragraph break]Nothing interesting going on in the Minor Houses, and there are no Shadow Aspects that bear mentioning.[paragraph break]In more mundane matters, you make note that effluent from a geoeffective coronal mass ejection should reach the magnetosphere tonight, which sometimes prompts clients to drop by when they mistake an aurora for a supernatural portent. That's always good for business.[paragraph break][morePapers]";
	wipe row "worm-update" in Table of Reads.
	
After Linkaging when topicDuJour is "worm-chart":
	say "You flip past the HIPAA-compliant coversheet and glance at the demographic info, which Dmitri has hastily scrawled at the top of the intake form:[paragraph break]Name: Paisley Nobspike[line break]Race: [unicode 9745] Orc [unicode 9745] Gnome.[line break]Birth: The 17th of Ubij in the Systematized Year 128A[paragraph break]Dmitri has helpfully penciled in some of the relevant influences at birth, noting that the client was born in seventh radiant of Umek, within the cusp of Norimar, with both Reevan-the-Warrior and Borram-the-Seeker rising in an opposing configuration. There is no mention of crossed Shadow Aspects, but that will come out in the interview, so no worries there.[paragraph break]You dutifully scan past his address and insurance information but are surprised that the rest of the pages are blank. Unfortunately, the client did not provide the necessary information to Dmitri. You’ll have to waste time during the intake session completing this drudgery. If you weren[apostrophe]t in human form, tendrils of black smoke would now be rising from your nostrils.[pick table of charting options]";
	wipe row "worm-chart" in Table of Reads.

Table of Guild Dinner
OptionText	Link
"Throw out the invitation, it’s been on your desk too long."	"worm-garbageInvitation"
"[quotation mark]Dmitri, let the awards folks know that I’ll do the talk.[quotation mark]"	"worm-willTalk"
"[quotation mark]Dmitri, make up some excuse to get me out of the Awards Dinner talk.[quotation mark]"	"worm-wontTalk"

After Linkaging when topicDuJour is "worm-garbageInvitation":
	say "You toss the balled-up invitation backwards over your shoulder towards a rift in space-time that you manifest near the bookshelves. The wad of paper goes wide and lands on the floor. You pick it up again with annoyance and chuck it into the depthless Absence of Being and award yourself two points rather than three. You can’t be too critical of yourself, after all: the eyes on your current face are just too close together to afford reasonable depth perception.[paragraph break][morePapers]".
	
After Linkaging when topicDuJour is "worm-willTalk":
	say "[quotation mark]Is that the Draconian Prophecy Alliance Gala, [dragonName]?[quotation mark] Dmitri asks you over the office intercom.[paragraph break][quotation mark]No, it[apostrophe]s the Soothsaying Guild Annual Awards Dinner [unicode 8212] at the Hill Giant Lodge, if I recall.[quotation mark][paragraph break][quotation mark]Ah, fine. Okay, I will send a reply on the first rabbit that hops by. What shall I say will be your topic?[quotation mark][paragraph break][quotation mark]Let[apostrophe]s brush off the [apostrophe]Teach An Old Dragon New Tricks[apostrophe] talk from last year[apostrophe]s DraconiCon. No one on this Plane of Existence has heard it.[quotation mark][paragraph break][quotation mark]Very good, [dragonName].[quotation mark][paragraph break][DmitriInvite]".

After Linkaging when topicDuJour is "worm-wontTalk":
	say "You inform Dmitri over the office intercom of your decision not to speak at this year[apostrophe]s Awards Dinner.[paragraph break][quotation mark]I am sure your absence will be greatly felt by them, [dragonName].[quotation mark][paragraph break][quotation mark]That would be fine by me. If they miss me enough, maybe next year they[apostrophe]ll comp their speakers. These awards dinners are a self-congratulatory scam.[quotation mark][paragraph break][DmitriInvite]"
	
To say DmitriInvite:
	say "Dmitri flutters in, grasps the invitation in his beak and is gone in flash.[paragraph break][morePapers]"

Table of DDbill
OptionText	Link
"Throw out the bill, surely it’s been paid by now."	"worm-garbageBill"
"[quotation mark]Dmitri? I found an old double-D invoice [unicode 8212] should I throw it out?[quotation mark]"	"worm-checkBill"

After Linkaging when topicDuJour is "worm-garbageBill":
	say "You open the tiniest portal deep within a gravity well and watch the invoice tear itself atom-from-atom as its spaghettifies and spirals out of existence awash in a burst of hard X-rays. In an instant, it is gone and the rupture seals behind it. Done and done.[paragraph break][morePapers]".
	
After Linkaging when topicDuJour is "worm-checkBill":
	say "Your inquiry about the Dimension Dwarf invoice elicits a worried clucking from the other end of the intercom.[paragraph break][quotation mark][dragonName], may I respectfully beseech that we retain that invoice?[quotation mark][paragraph break][quotation mark]You don[apostrophe]t think we[apostrophe]re paid up?[quotation mark][paragraph break][quotation mark]We make automatic payments from the Unicorn account, but there was a billing issue last month [unicode 8212] the office portals got bent around into sort of a Klein bottle topology and they tried to charge us an infinite sum. I don[apostrophe]t know if they[apostrophe]ve credited that back to the account yet.[quotation mark][paragraph break][quotation mark]Fine,[quotation mark] you reply and hand the receipt over to Dmitri. He hops in and out, and closes the squeaky door behind him.[paragraph break][morePapers]".

Table of Charting
OptionText	Link
"[quotation mark]Dmitri, how am I supposed to tell a fortune without an intake sheet?[quotation mark]"	"worm-whereIntake"
"[quotation mark]Dmitri, tell Mr. Nobspike to reschedule after he fills out the intake sheet.[quotation mark]"	"worm-bump"
"[quotation mark]Dmitri, cancel Nobspike and set him up next week with HDL Cormouth.[quotation mark]"	"worm-turf"


After Linkaging when topicDuJour is "worm-whereIntake":
	say "[quotation mark]I do most humbly apologize, [dragonName]. Mr. Nobspike called several times today [unicode 8212] he is a most anxious individual. He spoke so fast that I could barely understand him.[quotation mark][paragraph break][quotation mark]And you didn[apostrophe]t get his history on any of those calls?[quotation mark][paragraph break][quotation mark]Again, [dragonName], I beg your indulgence. Every time he called, I had to reassure him about coming here, specifically, that you would not eat him.[quotation mark][paragraph break][quotation mark]Eat him![quotation mark] Your teeth begin to elongate and wing stubs stir in your back, but you quell the transformation. [quotation mark]Of all the prejudiced… You know, maybe I should.[quotation mark][paragraph break]Polite, nervous laughter echoes over the intercom.[paragraph break][morePapers]".

After Linkaging when topicDuJour is "worm-bump":
	say "[quotation mark]Why don[apostrophe]t we call it a night. You can bump his appointment to the next alignment, I think the 25th should do.[quotation mark][commonDisposition]".
	
After Linkaging when topicDuJour is "worm-turf":
	say "[quotation mark]I can[apostrophe]t be wasting my time on trivial cases like this [unicode 8212] see if you can reach him and send him over to Cormouth. He[apostrophe]s always looking for clients.[quotation mark][commonDisposition]".

To say commonDisposition:
	say "[paragraph break][quotation mark]I weep sorrowfully that I cannot do as you command, [dragonName].[quotation mark][paragraph break][quotation mark]But it[apostrophe]s almost midnight and he[apostrophe]s not even here. Also, knock it off with the weeping. That[apostrophe]s not what I want clients to see when the step into the waiting room. Now what[apostrophe]s the issue?[quotation mark][paragraph break][quotation mark]Mr. Nobspike claims to be a Class-A with direct referral from the Spire.[quotation mark][paragraph break][quotation mark]Fine. Send him in whenever he deigns grace our doorstep and we[apostrophe]ll muddle through.[quotation mark][paragraph break][quotation mark]It will be my greatest joy to so serve you, [dragonName].[quotation mark][paragraph break][morePapers]".
	
After Linkaging when topicDuJour is "worm-window":
	say "A large window is centered on the wall to your left and looks out on nothing but the lush forest surrounding your office.[no line break][one of][paragraph break]The remoteness of the office suits your desire to run something of a boutique practice, offering services only to those willing to make the trek through the woods, at midnight no less. Not only has this cut down on the number of flaky referrals, but the perception of exclusivity has allowed you to jack your fees up beyond even what they are raking in back in Holsberg.[paragraph break]On a practical note, the office is located next to a river that flows past your mountain lair, so the commute is a no-brainer: you just fly along the course of the river.[no line break][or][stopping][paragraph break][one of]For an instant, you think you see someone crouched down at the edge of the forest watching you... but it must have been a trick of the light. When you try to get a better look, nothing seems amiss[or]Birds sing loudly from the branches above your office[or]A rabbit scampers past, just below the window[or]A breeze stirs the high tree branches, admitting shafts of sunlight[stopping].[paragraph break]Enough daydreaming. The [backToWork] won't do itself!"
	
To say dayDreaming:
	say "[paragraph break]Enough daydreaming. The [backToWork] won’t do itself.".

	
After Linkaging when topicDuJour is "worm-intercom":
	say "As your finger hovers indecisively over the intercom button, Dmitri comes flapping into your office so quickly that the office doors continue to swing [if the squeaky_hinge flag is true]squeakily[end if] back and forth behind him several times before coming to rest. [paragraph break]Dmitri opens his beak to plunk down a wad of irregularly shaped papers before announcing, [quotation mark]He[apostrophe]s here. Your client is here and he[apostrophe]s cowering in the waiting room. He brought some items that he thought you would like to read before seeing him. Apparently, he is convinced that he is cursed.[quotation mark][paragraph break][quotation mark]Cursed,[quotation mark] you say unenthusiastically. [quotation mark]That is a very imprecise term; effectively meaningless. Does he mean that someone has worked a hex against him, that his luck has been stained, that he attracted an inimical wrongfulness, that he has come into possession of contrabeneficent articles –- what?[quotation mark][paragraph break]Dmitri ruffles his shoulder feathers and spins his head, as if looking for an answer to your unanswerable question. [quotation mark]Regrettably, he was incapable of expressing himself in more proper terms, [dragonName]. All I managed to coax from him was that he had been researching his predicament on the [internet]…[quotation mark]".
	
To say internet:
	place a link to the command "link worm-internet" reading "internet".
	
After Linkaging when topicDuJour is "worm-internet":
	say "[quotation mark]The internet![quotation mark] you boom. Scales erupt on your skin, and horns poke through the fabric of your suit all along your spine. You occupy fully half the volume of the office before you are able to get a handle on things and squeeze back into your human form. Your exquisite three-piece suit keeps pace, contracting back down with you and sealing over the ruptures, proving once again that your tailor is worth every dime.[paragraph break][quotation mark]I absolutely detest it when clients get it into their heads that they can tell their own futures. I suppose there are tarot cards in that pile?[quotation mark] you ask, keeping your voice guardedly neutral.[paragraph break][quotation mark]Yes, [dragonName]. A few. Also, he said he made some marginal notes and highlighted some passages that may deserve your particular attention.[quotation mark][paragraph break]This provokes another brief burst of outrage. It is a few minutes before you are able to fully rewind your tail into your body.[paragraph break][quotation mark]Well, tell him that I will give it a ‘thorough[apostrophe] look.[quotation mark] you say dryly. [quotation mark]I will send for him when I am ready.[quotation mark][paragraph break][quotation mark]Very good, [dragonName].[quotation mark][paragraph break][quotation mark]Also,[quotation mark] you add, [quotation mark]he[apostrophe]s a half-gnome right? They are jittery little folk. Why don[apostrophe]t you let him simmer down for a moment with a cup of tea. The sort with an extra, let[apostrophe]s say, fifty milligrams of [Kusmiz].[quotation mark][paragraph break][quotation mark]An excellent idea, [dragonName]. I shall do so immediately.[quotation mark] Bowing out backwards, Dmitri takes his leave of you.[paragraph break]You eye your client[apostrophe]s [quotation mark][research][quotation mark] with disdain."
	
To say Kusmiz:
	place a link to the command "link worm-kusmiz" reading "Kusmiz[apostrophe]s Concoction of Placid Compliance".
	
After Linkaging when topicDuJour is "worm-kusmiz":
	say "[bold type]Kusmiz[apostrophe]s Concotion of Placid Compliance[roman type][paragraph break]Ingredients:[paragraph break]3 parts Bombay Sapphire Gin[line break]1 part St. Germain Elderberry Liquor[line break]1 part rosemary simple syrup[line break]1/2 fresh squeezed lemon[line break]1 fairy thimble of unicorn sparkles (coarse)[paragraph break]While standing naked on a boulder, combine Sapphire, St. Germain, [rosemarySyrup], lemon juice over ice in a wide-mouthed crystal beaker. Spin once widdershins and then add unicorn sparkles, pronouncing Wozniak[apostrophe]s Apoplectic Incantation. Shake, strain into a wine glass (strictly speaking, this part doesn[apostrophe]t have to be done on the boulder). Carefully overlay with an equal volume champagne. Garnish with rosemary sprig. Administer one teaspoon to small creatures, two to medium, three to large and titrate to effect. Certain species-specific [interactions] have been reported.[paragraph break][b2internet]".
	
To say b2internet:
	place a link to the command "link worm-internet" reading "Back"

To say research: 
	place a link to the command "link worm-research" reading "research".
	
To say interactions:
	place a link to the command "link worm-interactions" reading "interactions".
	
To say rosemarySyrup:
	place a link to the command "link worm-rosemarySyrup" reading "rosemary syrup".
	
After Linkaging when topicDuJour is "worm-interactions":
	say "Adverse Reactions:[paragraph break]";
	open HTML tag "div" called "finePrint";
	say "Like most potions, Kusmiz’s Concoction of Placid Compliance has absolutely no effect on dwarves. Most other species find it deeply reassuring, with minimal sedation. Except imps. They have been reported to experience adverse reactions including astromania and lunacy, drapophila, and disaffective phototropism after ingesting even trace amounts of the concoction. More severe overdoses have results in persistent tetanic planking, which can become life-threatening.[paragraph break]";
	close HTML tag;
	say b2kusmiz.
	
To say b2kusmiz:
	place a link to the command "link worm-kusmiz" reading "Back".
	
After Linkaging when topicDuJour is "worm-rosemarySyrup":
	say "Combine 1 cup water, sugar, and rosemary leaves in a small saucepan and heat to boil, stirring in sugar until fully dissolved.  Allow to cool to ambient temperature. Strain out rosemary and store refrigerated.[paragraph break][b2kusmiz]"
	
After Linkaging when topicDuJour is "worm-research" or topicDuJour is "worm-research2":
	say "[one of]You lay out on your desk the various items that the owl dragged in, your client’s so-called proof that he is cursed, or more properly, that he is [quotation mark]fate constrained[quotation mark][or]Your desk is covered by items related to your client’s paranoid and pitifully amateur attempt to read his own future[stopping]. These items include: some [tarotCards], a few small [scraps], an [article] torn from a magazine, a stack of green-and-white [fanfold], and a crudely drawn [NebuPlot]."
	
To say tarotCards:
	place a link to the command "link worm-tarot" reading "tarot cards".
	
To say scraps:
	place a link to the command "link worm-scraps" reading "scraps of paper".
	
	
To say article:
	place a link to the command "link worm-article" reading "article".
	
To say fanfold:
	place a link to the command "link worm-fanfold" reading "fanfold paper".
	
	
To say NebuPlot:
	place a link to the command "link worm-nebuplot" reading "Nebuchadnezzar Plot".
	
After Linkaging when topicDuJour is "worm-tarot":
	say "There are three tarot cards, and your client has inked up their reverse sides with annotations. Before you give them another glance, though, you pull a jeweler[apostrophe]s loupe out of the top drawer of your desk and cast Ingemar[apostrophe]s Incandescent  Slug. As the slug crawls along your desktop, you examine the tarots by the bright yellow light of its slimy trail. [paragraph break]Just as you expected, the cards are nothing more than cardboard with pictures on them. Not true tarot cards at all. You dismiss the slug and wipe the slime up with your handkerchief.[paragraph break]As for what your client may have concluded from these cards, let[apostrophe]s see. Here they are along with Mr. Nobspike[apostrophe]s scribblings:[paragraph break][bold type]The Page of Pentacles[roman type][paragraph break][italic type]The page turns for the fifth time, just as I am entering my fifth decade of life. But towards what?[roman type][paragraph break][bold type]The Moon[roman type][paragraph break][italic type]A tide is turning against me. Soon I will be awash in whatever horrible fate this curse conveys upon me. I cannot hide from it in the brightness of the moon[apostrophe]s unmerciful light.[roman type][paragraph break][bold type]The Hierophant[roman type][paragraph break][italic type]For reasons unknown to me, my inevitable downfall has drawn the attention of those on high, of the very Spire itself. How is my destiny wrapped up with that of the Empire? How do the great and mighty hang from the threads of my fate?[roman type][paragraph break]What hogwash.[pick Table of InternetResearch options]".
	
Table of InternetResearch
OptionText	Link
"Continue reviewing your client[apostrophe]s research"	"worm-research"
"Check in with Dmitri about how your client is doing"	"worm-checkWaitingRoom"
"Toss the lot of it in the trash and call Mr. Nobspike in"	"worm-callInClient"

After Linkaging when topicDuJour is "worm-scraps":
	say "There are five scraps, little bits of paper about a quarter inch wide and two inches long. Thankfully, they are too small for Mr. Nobspike to have added any of his useless annotations.[paragraph break]The scraps read:[paragraph break][quotation mark][italic type]You[apostrophe]re [bracket]sic[close bracket] troubles will be short-lived.[roman type][quotation mark][paragraph break][quotation mark][italic type]A thrilling time is in your immediate future.[roman type][quotation mark][paragraph break][quotation mark][italic type]Don[apostrophe]t ask, don[apostrophe]t say. Everything lies in silence.[roman type][quotation mark][line break](The word [quotation mark]lies[quotation mark] is underlined twice)[paragraph break][quotation mark][italic type]You will take a chance in something in the near future.[roman type][quotation mark][line break](this one is highlighted in pink fluorescent marker)[paragraph break][quotation mark][italic type]Anger begins with folly, and ends with regret.[roman type][quotation mark][quotation mark][paragraph break]Great Azazoth[apostrophe]s Shiny Buttocks! Who knows what sort of twisted conclusions Mr. Nobspike might have drawn from these no doubt entirely authentic oracular predictions plucked from restaurant cookies.[pick table of InternetResearch options]".
	
After Linkaging when topicDuJour is "worm-article":
	say "It[apostrophe]s torn out of the sort of fashion magazine one might pick up on the grocery checkout line. You wonder if he bought the rest of the magazine or just yanked the article, which is entitled, [quotation mark]Tell Your Own Future: Five Easy Steps[quotation mark]. [paragraph break]Fire builds within your chest, but you swallow it down.[paragraph break]It[apostrophe]s not even a how-to article. It[apostrophe]s a series of infographics that say essentially nothing, even about how to map fate against strong cosmic influencers. On the other hand, it has some salacious gossip pieces about Draconic Celebrities. You feel a little ashamed about how much time you spend pouring over those bits.[paragraph break]Mr. Nobspike has highlighted every instance of the words [quotation mark]fate[quotation mark] and [quotation mark]destiny[quotation mark] within the article. [paragraph break]You go back and re-read the side article about [one of]the green satin dress that Her Draconic Lordship Homlek wore to last year[apostrophe]s Guild Dinner[or]Grand Wizard Tarassen[apostrophe]s dating an Elven Dancer twelve hundred years younger[or]the bitter break up between Prince Finestar and Princess Mouvecrat – which, come to think of it, you saw coming a long time ago[in random order].[pick table of InternetResearch options]".
	
After Linkaging when topicDuJour is "worm-fanfold":
	say "This is old school: green-and-white tractor fed fanfold paper printed by a dot-matrix printer with a dying ribbon. The text is barely legible, even less so thanks to all of the highlighting that Mr. Nobspike has added in yellow, orange, and pink, seemingly at random.[paragraph break]It is the worst of internet self-prognostication coupled with a healthy dose of conspiracy theory. It[apostrophe]s too painful to read in detail so you just scan through the amateur alchemy, quotations from Draconic Soothsayers taken entirely out of context, and some old archived posts from rec.arts.draconic.soothsaying.[pick table of InternetResearch options]".
	
After Linkaging when topicDuJour is "worm-nebuplot":
	say "You find Nebu Plots to be of great use for day-to-day fortune telling, and generally you like to have one in front of you when talking to a client. However, they are not for the faint of heart. The basics of Nebu Plots are introduced at the Novitiate level, but it isn[apostrophe]t until the Third or Fourth Plate that most Draconic Oracles can produce robust Plots. [paragraph break]Not surprisingly, this one is a mess. Somehow Mr. Nobspike must have gotten his hands on the raw materials to conjure one, but everything is wrong about it: for starters, his birth peak isn[apostrophe]t even at the center, so of course, everything is going to be skewed. [paragraph break]From some of his calculations, you can see that he doesn[apostrophe]t have the slightest idea of what he[apostrophe]s doing: the lines between the Great Houses seem to be measured in degrees rather than radians, he hasn[apostrophe]t normalized for the passage of time, and there is no correction at all for self-reference in the prognostication. [paragraph break]You can[apostrophe]t bear to look at it any more.[pick table of InternetResearch options]".
	
After Linkaging when topicDuJour is "worm-checkWaitingRoom":
	say "[one of][waiting1][or][waiting2][or][waiting3][or][waiting4][or][waiting5][stopping]";
	now the lastWormTopic is "worm-research2";
	now the topicDuJour is "worm-research2".
	
To say waiting1:
	say "[quotation mark]Dmitri, how is Mr. Nobspike doing?[quotation mark][paragraph break][quotation mark]He[apostrophe]s acting really weird,[quotation mark] whispers the owl over the office intercom.[paragraph break][quotation mark]That seems in character for him.[quotation mark][paragraph break][quotation mark]No, I mean he[apostrophe]s really spaced out. He[apostrophe]s just sitting there, staring at my lamp shade.[quotation mark][paragraph break][quotation mark]It is a nice lamp shade,[quotation mark] you note. [quotation mark]Maybe he[apostrophe]s really into lamp shades.[quotation mark][paragraph break][quotation mark]No, I don[apostrophe]t think so. He[apostrophe]s not even blinking.[quotation mark][paragraph break][quotation mark]That does sound odd. Why don[apostrophe]t you turn him around so he[apostrophe]s not looking at it?[quotation mark][paragraph break][quotation mark]Yes, [dragonName], let me try that.[quotation mark][paragraph break]A moment passes.[paragraph break][quotation mark][dragonName]?[quotation mark][paragraph break][quotation mark]Yes?[quotation mark][paragraph break][quotation mark]It worked. He kept spinning back to look at the lamp shade, so I wedged his head into the corner near the bookcase with some pillows, and that seems to have done the trick.[quotation mark][paragraph break][quotation mark]Superb thinking, Dmitri. Let me finish reviewing the material he brought it, maybe that will shed some light on his unusual behavior.[quotation mark][pick table of InternetResearch options]".

To say waiting2:
	say "[quotation mark]How now, Dmitri? Is he over his lampshade infatuation?[quotation mark][paragraph break][quotation mark]I unscrewed the lampshade and put it in the storage closet. That worked. But now he[apostrophe]s fondling the velvet curtains.[quotation mark][paragraph break][quotation mark]Fondling?[quotation mark][paragraph break][quotation mark]Yes, he[apostrophe]s standing next to them, running his hands over the material and babbling to himself.[quotation mark][paragraph break][quotation mark]No harm in that, I suppose. The curtains are not sharp and they are too big to swallow, so it sounds safe enough.[quotation mark][paragraph break][quotation mark]Do you want me to send him in now?[quotation mark][paragraph break][quotation mark]Not quite yet, I still have some of his items to look through.[quotation mark][pick table of InternetResearch options]".
	
To say waiting3:
	say "[quotation mark]Dmitri, please tell me that the curtains have survived his romantic overtures.[quotation mark][paragraph break][quotation mark]Yes, he[apostrophe]s moved on from the curtains to the skylight. He[apostrophe]s now lying on the carpet under the dome and looking up at the stars.[quotation mark][paragraph break][quotation mark]Gremwas Nine Plate of Tortsboro once told me there would be nights like this.[quotation mark][paragraph break]You turn back to the task at hand.[pick table of InternetResearch options]".
	
To say waiting4:
	say "[quotation mark]I[apostrophe]m just about done with the items Mr. Nobspike brought in. How is he holding up?[quotation mark][paragraph break][quotation mark]He[apostrophe]s back on his feet. Now he[apostrophe]s pacing around the office: he keeps walking right up to the doors to your office and then backs away again. Over and over. I wish he would go back to lying on the carpet.[quotation mark][paragraph break][quotation mark]Ask him what he[apostrophe]s doing.[quotation mark][paragraph break][quotation mark]One moment, Your Dragonic Lordship,[quotation mark]. Dmitri[apostrophe]s voice sounds more distant as he says, [quotation mark]Mr. Nobspike? Mr. Nobspike? Hello? What are you doing?[quotation mark] [paragraph break]Again next to the intercom, Dmitri continues, [quotation mark]It[apostrophe]s no use, Your Draconic Lordship, it[apostrophe]s like he[apostrophe]s in his own world.[quotation mark][paragraph break]You draw the appropriate sigils and confirm to Dmitri that Mr. Nobspike is not in his own world and then instruct him to keep an eye on him while you wrap up your research.[pick table of InternetResearch options]".

To say waiting5:
	wipe row "worm-checkWaitingRoom" in Table of InternetResearch;
	say "You check in again with Dmitri, and the client continues to pace back and forth in front of the door. At least he[apostrophe]s not harming anything, you figure, and go back to your research.[pick table of InternetResearch options]".
	
After Linkaging when topicDuJour is "worm-callInClient":
	say "[quotation mark]Very well, Dmitri,[quotation mark] you say over the intercom, [quotation mark]I have sorted through Mr. Nobspike[apostrophe]s documents and I am not one iota more enlightened. Do send him into my office now.[quotation mark][paragraph break][quotation mark]My heart bleeds with profuse apologies, Your Draconic Lordship, but I am unable. Having for some time stared catatonically at my lampshade, the velvet drapes, and the skylight, our client has now fallen stiff like a board, his head resting on my desk. Talking to him is of no avail.[quotation mark][paragraph break]Suddenly it comes together for you: his phototropism, drapophilia, astromania, and now planking behavior. [paragraph break][quotation mark]Dmitri, could he be an imp? They are rather rare these days, but I understand that they have something of the appearance of a half-orc, half-gnome.[quotation mark][paragraph break][quotation mark]I… I suppose so, Your Draconic Lordship. I have never seen one [unicode 8212] only read about them in my history texts.[quotation mark][paragraph break][quotation mark]Yes, I think that is what we have on our hands: an imp. Imps are known to have an idiosyncratic reaction to Kusmiz[apostrophe]s Concoction of Placid Compliance; it is in the fine print on the bottle. He was no doubt ashamed of his Impish heritage and tried to pass himself off as something else on our intake form.[quotation mark][paragraph break][quotation mark]Your Draconic Lordship[apostrophe]s knowledge is boundless![quotation mark][paragraph break][quotation mark]Yes, it is. Open up the contingency cabinet and crush a capsule of [Langley] near his left ear and then [sendHimIn].[quotation mark]".
	
To say Langley:
	place a link to the command "link worm-Langley" reading "Langley[apostrophe]s Shocking Revitalizer".
	
To say b2callInClient:
	place a link to the command "link worm-callInClient" reading "Back"
	
After Linkaging when topicDuJour is "worm-Langley":
	say "[bold type]Langley's Shocking Revitalizer[roman type][paragraph break]1 part Bombay Sapphire Gin[line break]1 heavy splash homemade angelica root/lemon zest bitters[line break]1 part Tonka bean infused vodka [line break]1 part simple syrup/lime juice mix [line break](in a pinch, a tablespoon of frozen limeade concentrate)[line break]2 Ole Smoky Moonshine maraschino cherries[paragraph break]Combine liquids, mix in bitters, stir in lime syrup. Pour over ice and top with cherries. [paragraph break]Crawl into a pit deep enough that your head does not extend above ground level. Crouching is permitted. Consume the above. Tie the stems of the two cherries into a double fisherman[apostrophe]s knot with your tongue. While retaining the two cherry pits in your cheeks, perform the Dance of Pygmalion. Place the two seeds at the vertex of a peaked roof on a moonless night. Experience suggests that the climbing of steep roofs in the dark occur on a night other than the one on which the potion was consumed. In the morning, the pits can be used as per Borbeck[apostrophe]s Compendium.[paragraph break][b2callInClient]".
			
To say sendHimIn:
	place a link to the command "link worm-sendHimIn" reading "send in Mr. Nobspike".
	
After Linkaging when topicDuJour is "worm-sendHimIn":
	say "More time passes than it should have, and the client has not entered your office. You become aware of thudding at the doors to your office: at first quiet, but growing more and more violent. With some annoyance, you again press the intercom.[paragraph break][quotation mark]Dmitri, what is going on with the door? Where is Mr. Nobspike?[quotation mark][paragraph break]The doors reverberate with the loudest thud yet.[paragraph break][quotation mark]Your Draconic Lordship, I must report that the client seems unable to open the doors to your office. He tried the door in the usual way first, and then started hitting it, and just now threw himself bodily against it. He[apostrophe]s now lying on the carpet again, stunned.[quotation mark][paragraph break][quotation mark]Is he still under the influence of Kusmiz[apostrophe]s Concoction?[quotation mark][paragraph break][quotation mark]No, the Revitalizer seemed to have worked entirely. It[apostrophe]s like the door is locked.[quotation mark][paragraph break][quotation mark]As you well know, Dmitri, that door has no lock. Why don[apostrophe]t you try it yourself, since Mr. Nobspike seems incapable of something so trivial as turning a door knob.[quotation mark][paragraph break]Again, some noises at the door, and you see the knob twisting back and forth. Still, it does not open.[paragraph break][quotation mark]So?[quotation mark] you ask impatiently.[paragraph break][quotation mark]It[apostrophe]s true. I can see the latch draw back when I turn the knob, but the doors feel like a steel barrier. They have absolutely no give.[quotation mark][paragraph break][quotation mark]I see.[quotation mark] You don[apostrophe]t but you no doubt will. [quotation mark]This is obviously no mere physical obstruction.[quotation mark][pick Table of FirstDoor options]".
	
Table of FirstDoor
OptionText	Link
"[quotation mark]Let me try the door myself.[quotation mark][line break]"	"worm-doorMyself"
"[quotation mark]I[apostrophe]ve had it with Mr. Nobspike. send him away.[quotation mark]"	"worm-sendAway"
"[quotation mark]This is what happens when we don[apostrophe]t follow our process.[quotation mark]"	"worm-intakeForm"
"[quotation mark]Dmitri, how about a fresh cup of coffee?[quotation mark]"	"worm-moreCoffee"

After Linkaging when topicDuJour is "worm-doorMyself":
	wipe row "worm-doorMyself" in Table of FirstDoor;
	say "You give the door a quick pull, not really expecting it to open and it doesn[apostrophe]t.[paragraph break]Yelling through the thick doors, you call for Dmitri. [quotation mark]What time is it?[quotation mark][paragraph break][quotation mark]Five past midnight, Your Draconic Lordship,[quotation mark] comes the muffled reply.[paragraph break][quotation mark]I see,[quotation mark] you say, mostly to yourself. [quotation mark]Then the appointment has started.[quotation mark][paragraph break]Dmitri[apostrophe]s voice comes over the intercom, [quotation mark]Was Your Draconic Lordship successful?[quotation mark][paragraph break][quotation mark]Given that the doors are still shut, what do you think?[quotation mark][paragraph break][quotation mark]No?[quotation mark][paragraph break][quotation mark]Precisely. The doors are not stuck, but are fixed in place by some epiphenomenon related to the appointment itself.[quotation mark][pick Table of FirstDoor options]".
	
After Linkaging when topicDuJour is "worm-moreCoffee":
	wipe row "worm-moreCoffee" in Table of FirstDoor;
	say "[if coffee flag is true][quotation mark]Another cup?[quotation mark] asks Dmitri. [quotation mark]But Your Draconic Lordship never has two cups of coffee in the same night. I thought you said that one puts you on edge. The effect of two… [quotation mark][paragraph break][quotation mark]Now![quotation mark] you bellow.[paragraph break][end if]Long accustomed to obeying your every command without further reflection, Dmitri sails into your office through the [if squeaky_hinge flag is true]infuriatingly squeaky [end if]doors, which yield to him without the slightest hesitation.[paragraph break]He sets the coffee on your desk mechanically and is gone before you can get a word in. As soon as he is back at his desk, though, your intercom lights up.[paragraph break][quotation mark]Your Draconic Lordship! I just realized: our problems are solved. The doors are working again.[quotation mark][paragraph break][quotation mark]No, I[apostrophe]m afraid not. We[apostrophe]re definitely dealing with an issue around the door[apostrophe]s warding: you were able to walk through just now because your intentions had nothing to do with fortune telling.[quotation mark][paragraph break][quotation mark]Can you lift the ward?[quotation mark][paragraph break][quotation mark]No, it is a federal seal, installed by the Environmental Protection Agency. We[apostrophe]ll have to figure out where the problem is, and it could be anything: administrative, regulatory, ethical, technical, or who knows what else. Seals can be finicky. The best course of action is for us to follow our S.O.Ps.[quotation mark][pick Table of FirstDoor options]";
	
After Linkaging when topicDuJour is "worm-sendAway":
	wipe row "worm-sendAway" in Table of FirstDoor;
	receive victorRetCon into inboxFolder;
	say "[quotation mark]Send Mr. Nobspike away: we had no problems until he set foot in the office. I can[apostrophe]t do him any good if I can[apostrophe]t see him, so send him packing.[quotation mark][paragraph break][quotation mark]I hesitate to bring this up, Your Draconic Lordship, but the appointment has already begun. He will have to be charged for the appointment and without a telling, this would be considered a Forfeiture of Prophecy.[quotation mark][paragraph break][quotation mark]So be it. If fate won[apostrophe]t let me see him, I guess he has his answer.[quotation mark][paragraph break][quotation mark]Yes, Your Draconic Lordship, I shall inform him.[quotation mark][paragraph break]Well, at least now you should able to get on with the [restOfEvening] in peace.";
	receive victorRetCon into inboxFolder;
	now the lastWormTopic is "worm-writOfRetCon".
	
To say restOfEvening:
	place a link to the command "link worm-writOfRetCon" reading "rest of your evening".
	
After Linkaging when topicDuJour is "worm-writOfRetCon":
	say "Contrary to the decision that you thought you had just made, and indeed that you clearly remember making, you accept the fact that you must not have made it and swallow down any protest that you were about to voice as the memory snuffs itself out of existence.[paragraph break]You once again find yourself in your office trying to figure out how to get your client through your office doorway so you can tell his future.[pick Table of FirstDoor options]"

After Linkaging when topicDuJour is "worm-intakeForm":
	say "[quotation mark]First things first: there is a reason why we do things the way we do. Let[apostrophe]s start with the intake form that Mr. Nobspike was supposed to have furnished us before this appointment was ever accepted. Dmitri, would you put Mr. Nobspike on the intercom?[quotation mark][paragraph break][quotation mark]Right away, Your Draconic Lordship. Mr. Nobspike, please step over here. You are now speaking to His Draconic Lordship, Venkath of the Nine Plates, Supreme Seer and Prophet of the Order of Snodbroom, High Oracle of Silvery Sliver, and Eminent Soothsayer of the Guild of Imperial Fortune Tellers.[quotation mark][paragraph break][quotation mark]Hi.[quotation mark][paragraph break][quotation mark]Yes, hello, Mr. Nobspike. I understand your apprehension in approaching this appointment, and despite the irregularities which with you have conducted yourself, I now insist that we proceed strictly according to proper protocol.[quotation mark][paragraph break][quotation mark]Okay.[quotation mark][paragraph break][quotation mark]Right, so then, let us begin at the top of the intake form. Dmitri, would you hand him a blank copy?[quotation mark][paragraph break][quotation mark]So, why don't we call someone in to repair the door and we can meet somewhere else while they work on it?[quotation mark][paragraph break][quotation mark]What? Somewhere other than my office?[quotation mark][paragraph break][quotation mark]Sure, why not?[quotation mark] whines your client.[pick Table of Privilege options]".

Table of Privilege
OptionText	Link
"Explain the privileged high-order dimensionality of your office"	"worm-privilege"
"Just get on with filling out the intake form"	"worm-getOnWith-1"
	
After Linkaging when topicDuJour is "worm-privilege":
	now the dimensionality_explained flag is true;
	say "By Hastur[apostrophe]s hairy armpits, it[apostrophe]s not that simple. Do you think my office is right next door to the waiting room?[quotation mark][paragraph break][quotation mark]It[apostrophe]s not?[quotation mark][paragraph break][quotation mark]No. It[apostrophe]s halfway across the universe, down about three Planes of Being, and extruded through about eight dimensions.[quotation mark][paragraph break][quotation mark]Jeez. Sounds complicated.[quotation mark][paragraph break][quotation mark]Yes. It is. It has to be. All Dragons tell fortunes from this area, which we call temporo-spatially privileged because it is in a sort of eddy area in the multiverse, where all the various influences, motives, and shadow aspects null out. From here, we can get the closest thing possible to an absolute reading, without having to run through an endless list of corrections for each and every fortune that we tell.[quotation mark][paragraph break][quotation mark]Okay. I get it. But you[apostrophe]re a dragon, right? Couldn[apostrophe]t you just teleport me there?[quotation mark][pick Table of Teleport options]".
	
After Linkaging when topicDuJour is "worm-getOnWith-1":
	say "You dig through the top drawer of your desk trying to find your favorite quill.[paragraph break]While you rummage through an endless hoard of paperclips, staples, name tags, post-it notes, and divining rods, your client prattles on endlessly.[paragraph break][quotation mark]You[apostrophe]re a dragon aren[apostrophe]t you?[quotation mark] he asks again.[paragraph break][quotation mark]What? Sorry, I missed what you said.[quotation mark][paragraph break][quotation mark]I said, why don[apostrophe]t you teleport me into the office, you[apostrophe]re a dragon aren[apostrophe]t you? Don[apostrophe]t dragons have dominion over time and space? Why are we fussing about the door?[quotation mark][pick Table of Teleport options]".
	
Table of Teleport
OptionText	Link
"Sigh."	"worm-noTeleport"
"Sigh. [quotation mark]No, Mr. Nobspike, It’s not that simple.[quotation mark]"	"worm-noTeleport"
"Just get on with filling out the intake form"	"worm-getOnWith-2"

After Linkaging when topicDuJour is "worm-noTeleport":
	say "[quotation mark]As a dragon, I do, of course, have dominion over time and space. That is part and parcel of what we do. I can open a portal to the surface of your sun with a snap of my fingers.[quotation mark][paragraph break][quotation mark]A nice trick![quotation mark][paragraph break][quotation mark]It[apostrophe]s not a trick. It is an innate ability.[quotation mark][paragraph break][quotation mark]Sorry. So why not just snap me through this door?[quotation mark][paragraph break][quotation mark]What we dragons do not have dominion over is dimensionality. As I mentioned, we[apostrophe]re not only displaced in space-time, but there are some finicky dimensional transforms involved [unicode 8212] the type that can turn a client inside out very easily.[quotation mark][paragraph break][quotation mark]And you can[apostrophe]t do the dimensional stuff?[quotation mark][paragraph break][quotation mark]That[apostrophe]s not the issue, although I will admit that I[apostrophe]m fuzzy on the math. Rather, it is a contractual matter: the Dimension Dwarves have dominion in this matter. I pay a hefty fee for them to bridge the waiting room to my office through the door that you have repeatedly battered.[quotation mark][paragraph break][quotation mark]Huh.[quotation mark] It takes a moment for Mr. Nobspike to digest all of this, but you have to admit, he isn[apostrophe]t doing half bad for someone entirely new to these concepts. [quotation mark]So… you are in your office, where you do your fortune telling. Why don't you just tell me my fortune over the intercom?[quotation mark][pick Table of Intercom options]".
	
After Linkaging when topicDuJour is "worm-getOnWith-2":
	say "You find your favorite quill in the very back of your top desk drawer, having pulled every other item out of the drawer. You methodically stuff your hoard of stationary items back into the drawer.[paragraph break]You reassure your client on the other end of the intercom, [quotation mark]Just one more moment, Mr. Nobspike, and we can start the intake form.[quotation mark] [paragraph break]It is only now that you realize that you did not see any ink in top drawer, where it is usually kept, so you start going through the drawers on the right side of your desk.[paragraph break]Mr. Nobspike pipes up with another suggestion: [quotation mark]Why don[apostrophe]t we just do the whole fortune telling thing over the intercom? I can hear you just fine.[quotation mark][pick Table of Intercom options]".
	
Table of Intercom
OptionText	Link
"[quotation mark]Over the intercom! Are you kidding![quotation mark]"	"worm-notIntercom"
"Just fill out the intake form"	"worm-getOnWith-3"

After Linkaging when topicDuJour is "worm-notIntercom":
	say "Maybe you gave your client too much credit. You try to dim down your explanation to Mr. Nobspike[apostrophe]s level of understanding.[paragraph break][quotation mark]Mr. Nobspike, have you been following me so far?[quotation mark][paragraph break][quotation mark]Yes. I think so.[quotation mark][paragraph break][quotation mark]Aside from some regulatory and ethical reasons that require you to be in front of me when I pronounce your future, the overwhelming practical consideration is that you need to be in this space with me. You[apostrophe]re the one that all the astrological forces are acting upon, after all.[quotation mark][paragraph break][quotation mark]Oh, I see. Yes, I suppose that does make some sense.[quotation mark][paragraph break][quotation mark]I am so honored that you agree with my professional opinion. Now, this conversation has consumed enough of my valuable time, let us focus on completing this [thriceDamnedIntakeSheet].[quotation mark]"
	
To say thriceDamnedIntakeSheet:
	place a link to the command "link worm-getOnWith-3" reading "thrice damned intake sheet".
	
After Linkaging when topicDuJour is "worm-getOnWith-3":
	say "Setting aside Mr. Nobspike[apostrophe]s seemingly endless list of questions, objections, and amateur speculation, you get down to brass tacks: filling out the intake form.[paragraph break][quotation mark]Dmitri filled all the demographics earlier with you on the phone [unicode 8212] all except this one item: profession.[quotation mark][paragraph break][quotation mark]Ah, yes. I tried to explain this to him. I am a writer of interactive fiction.[quotation mark][paragraph break][quotation mark]Sounds dismal.[quotation mark][paragraph break][quotation mark]No actually, it[apostrophe]s a fascinating…[quotation mark][paragraph break][quotation mark]Okay, I wrote it on the form [unicode 8212] I don[apostrophe]t need to know anything more about it. Let[apostrophe]s get right to the existential questions.[paragraph break][itemOne]."
	
To say itemOne:
	place a link to the command "link worm-item1" reading "Item one".

To say itemTwo:
	place a link to the command "link worm-item2" reading "item two".
	
To say itemThree:
	place a link to the command "link worm-item3" reading "item three".
	
To say justAfew:
	place a link to the command "link worm-justAfew" reading "Just a few".
	
To say lastItem:
	place a link to the command "link worm-lastItem" reading "One last item".
	
After Linkaging when topicDuJour is "worm-item1":
	say "Item one: have you ever had your future told before?[quotation mark][paragraph break][quotation mark]Last summer at the amusement park, I put a quarter into…[quotation mark][paragraph break][quotation mark]Enough. I meant, professionally.[quotation mark][paragraph break][quotation mark]I suppose not. But why does that matter?[quotation mark][paragraph break][quotation mark]It[apostrophe]s a long list, Mr. Nobspike. If you interrupt me at every item, we will be here all night. I inquire because if you came here based on another fortune telling, the two readings could intermodulate, potentially setting up a strangle vortex and ending all life as we know it in the vicinity of anywhere you have ever been.[quotation mark][paragraph break][quotation mark]I see. Then, no. What is [itemTwo]?[quotation mark]".
	
After Linkaging when topicDuJour is "worm-item2":
	say "[quotation mark]Item two: Have you recently come into possession of any books of Accurséd Knowledge such as Hambi[apostrophe]s Book of Tortured Souls, any edition of the Necronomicon, Forzed[apostrophe]s Anthology of Modern Verse, or any books bearing the Equation of Zoran?[quotation mark][paragraph break][quotation mark]I bought a cookbook two weeks ago.[quotation mark][paragraph break][quotation mark]Was it in fact a cookbook, or an alien manual about subjugation of the human race?[quotation mark][paragraph break][quotation mark]It was a low-carb cookbook.[quotation mark][paragraph break][quotation mark]So, another ‘no[apostrophe]. Moving on: [itemThree]."
	
After Linkaging when topicDuJour is "worm-item3":
	say "Item three: Aside from enduring the petty tyranny of time[apostrophe]s arrow, have you ever actively traveled in time? I assume that you see why that question is relevant for telling your future?[quotation mark][paragraph break][quotation mark]Yes.[quotation mark][paragraph break][quotation mark]Yes, you have traveled in time or yes, it is obvious?[quotation mark][paragraph break][quotation mark]Yes, it is obvious, no, I have never time traveled. Are there many more of these?[quotation mark][paragraph break][quotation mark][justAfew].[quotation mark]".
	
After Linkaging when topicDuJour is "worm-justAfew":
	say "[quotation mark]Almost done with this part. Item four: To your knowledge, were you the subject of any prophecy delivered to your parents or more remote ancestors?[quotation mark][paragraph break][quotation mark]No.[quotation mark][paragraph break][quotation mark]Fine, fine,[quotation mark] you hum, relieved to be past the universe-threatening questions. [quotation mark]Any travel to other planes, dimensions, or States of Being in the last month?[quotation mark][paragraph break][quotation mark]No.[quotation mark][paragraph break][quotation mark]Are you currently possessed by any being other than yourself by astral projection, demonic means, or any other mechanism?[quotation mark][paragraph break][quotation mark]No.[quotation mark][paragraph break][quotation mark]Are you pursuing this fortune telling in an attempt to commit a crime or to escape justice for a crime already committed?[quotation mark][paragraph break][quotation mark]No. Does that happen?[quotation mark][paragraph break][quotation mark]Every so often we get investors who want to play the futures market. Also, some people try to stay a step ahead of the law, although that is obvious doomed to fail given the way fate works.[quotation mark][paragraph break][quotation mark]I should write a story about this.[quotation mark][paragraph break][quotation mark]No, Mr. Nobspike you should not. Once the fortune reading starts, the session is considered to be bound by a non-disclosure agreement except to authorized scrying.[quotation mark][paragraph break][lastItem]."
	
After Linkaging when topicDuJour is "worm-lastItem":
	say "One last item: Are you aware of any circumstance by which this fortune telling would constitute a conflict of interest on my part?[quotation mark][paragraph break][quotation mark]No, I don[apostrophe]t even know you.[quotation mark] Your client[apostrophe]s voice brightens, [quotation mark]Hey! I just had a great idea. Your office has a window [unicode 8212] I saw it when I came in. Why don[apostrophe]t I come in that way?[quotation mark][pick Table of Window options]".
	
Table of Window
OptionText	Link
"Explain why that couldn’t possibly work"	"worm-windowImpossible"
"What the hell. It’s worth a shot"	"worm-worthAshot"
"Ignore the suggestion and finish the intake form"	"worm-finishForm"

To say windowCommon:
	say "You [if dimensionality_explained flag is true]reiterate that your office is not physically located anywhere near the waiting room[otherwise]explain to the client that the doors between your office and waiting room are actually a warded interdimensional bridge and that your office is not physically next to the reception area[end if].[paragraph break][quotation mark]But I saw you through the window. You could just open it and I could come in, couldn[apostrophe]t I?[quotation mark][paragraph break][quotation mark]How could you… wait, when did you see me through the window?[quotation mark][paragraph break][quotation mark]Earlier today. I was worried about coming tonight so I spent some time watching the office from the woods. I know it sounds foolish, but you scared me because you were yelling at your receptionist, and I saw you grow much larger and get covered with scales. Horns popped out of your head and spikes along your back, and I thought you were going to eat him.[quotation mark][paragraph break][quotation mark]For what it's worth, I have never eaten a receptionist. More to the point, what you saw were the events of this evening, shortly after you arrived in the reception room. Like the door, the window is a dimensional portal, except it connects the office to a time frame shifted twelve hours earlier.[quotation mark]".
	
After Linkaging when topicDuJour is "worm-windowImpossible":
	say "[windowCommon][paragraph break][quotation mark]Why have a time-shifted window in your office?[quotation mark][paragraph break][quotation mark]First of all, because the building code requires two exits. Second, because if it weren[apostrophe]t time-shifted to daylight hours, I wouldn[apostrophe]t have anything to look at out the window when I[apostrophe]m here all night telling fortunes.[quotation mark][paragraph break][quotation mark]Oh well, I thought it was worth a try.[quotation mark][pick Table of Window2 options]".
	
Table of Window2
OptionText	Link
"[quotation mark]Maybe there is a way we could make it work.[quotation mark]"	"worm-maybeAway"
"[quotation mark]Let’s just finish the intake form.[quotation mark]"	"worm-finishForm"

After Linkaging when topicDuJour is "worm-worthAshot":
	say "[windowCommon][paragraph break]Your client takes a moment to process that.[paragraph break][quotation mark]So, how about you open your window and tell me to come in [unicode 8212] it would be this afternoon for me, but that[apostrophe]s okay since I would just get my fortune read earlier in the day. Then I guess we wouldn[apostrophe]t need this session tonight.[quotation mark][paragraph break]You are sorely tempted to give it a try but feel ethically compelled to point out the fallacy in Mr. Nobspike[apostrophe]s argument.[paragraph break][quotation mark]Mr. Nobspike, at face value it is not a bad plan, but you are somewhat naïve when it comes to the nature of time. While there would be no problem if I had to bail out of the window if the building were on fire (aside from a temporary inconvenience of there then being two of me earlier in the day), if you attempted to enter the building through the window, you would cease to exist.[quotation mark][paragraph break][quotation mark]Why is it different for me?[quotation mark][paragraph break][quotation mark]I am already in the future, relative to the area outside the window. I did exist in that time, so there is no contradiction. However, if you attempt to transit from existence in that time to existing in this relative future time without having existed in between [unicode 8212] well, you can see the problem.[quotation mark][paragraph break][quotation mark]Sort of,[quotation mark] your client admits with a tone of defeat.[pick Table of Window2 options]".
	
To say crouchingShrubs:
	say "You walk over the window and spot your client crouching inexpertly in the shrubs near an oak tree, binoculars dangling from his neck. As you haul the window pane upward for the first time in as long as you have rented this office, Mr. Nobspike presses himself lower and lower to the ground to avoid being seen.[paragraph break][quotation mark]Mr. Nobspike,[quotation mark] you yell. Most of the sound makes it through the portal, although a portion is reflected back and phase shifted, creating an awkward, tinny ringing. [quotation mark]I need to talk to you [unicode 8212] everything is alright. I am not going to eat you.[quotation mark][paragraph break]Slowly, the imp emerges from the bushes and timidly approaches the [nearerWindow].[line break]".
	
To say nearerWindow:
	place a link to the command "link worm-nearerWindow" reading "window".
	
After Linkaging when topicDuJour is "worm-maybeAway":
	say "You warn your client in the waiting room that you are going to attempt to converse with his earlier self out the window and that as a result, he might experience some strange sensations and/or cease to exist. This elicits frantic banging at the doors and owl scuffling sounds from the waiting room.[paragraph break][crouchingShrubs]".
	
After Linkaging when topicDuJour is "worm-nearerWindow":
	say "[quotation mark]How did you know it was me?[quotation mark] asks the imp.[paragraph break][quotation mark]Well, that raises an interesting ethical dilemma for me because I am twelve hours in your future. Unfortunately, anything I say could be considered, from your point of view as fortune telling.[quotation mark][paragraph break][quotation mark]How is that a problem? I have an appointment with you tonight for just that. That[apostrophe]s what I[apostrophe]m paying your for.[quotation mark][paragraph break][quotation mark]First of all, by the guidelines of my Order, I am supposed to have you in front of me when I tell your fortune.[quotation mark][paragraph break][quotation mark]I am in front of you,[quotation mark] he complains.[paragraph break][quotation mark]By [apostrophe]in front of me[apostrophe], I think they mean in both time and space, neither of which is true.  More to the point, anything that I tell you right now is almost guaranteed not to be true later. Not only does this put my reputation as a fortune teller at risk, but we are skating dangerously close to a strangle vortex.[quotation mark][paragraph break][quotation mark]Excuse me for saying so,[quotation mark] says the imp with some annoyance, [quotation mark]but this all seems a little far-fetched. Do you have any proof about any of this? Are you sure you[apostrophe]re a real fortune teller?[quotation mark][pick Table of Nearer options]".
	
Table of Nearer
OptionText	Link
"Jump through the window and devour the imp for his insolence"	"worm-devourImp"
"Roar angrily until he is driven off"	"worm-roarAngrily"
"Tell him what which tarot cards he is carrying"	"worm-whichTarots"

After Linkaging when topicDuJour is "worm-devourImp":
	say "The imp looked like easy prey: bookish and a bit chubby. When you pounce through the window, however, he turns out to be surprisingly spry, disappearing immediately into the underbrush.[paragraph break]In your anger, you go full dragon [unicode 8212] scales, wings, everything, and napalm the forest in every direction around your office, all to no avail. [paragraph break]When you calm down, you fly to your lair and calmly relate the events of the day to yourself, who is just waking up in the late afternoon and still a bit groggy. [paragraph break]Between the two of yourself, you decide to let the other you have the night off, which you convince yourself you will richly deserve, given the night that you are about to have. [paragraph break]While the other you curls back up on your hoard, you set off again for the office as the sun sets, intent on getting there early enough to watch carefully for the moment that the imp appears outside your office window. You realize that you are flirting with any number of potential temporal paradox issues, so you play it conservatively, handling things just as you did earlier (later) today, and not tipping off Dmitri.[paragraph break]Eventually, the imp appears and this time you notice him earlier than the subjectively previous iteration, so he is again surprised to see you at your office window. [paragraph break]You have essentially the same conversation that you did, except this time, you make a concerted effort to keep your cool and to try to [convinceHim] that you are telling the truth."
	
To say convinceHim:
	place a link to the command "link worm-whichTarots" reading "convince him".
	
After Linkaging when topicDuJour is "worm-roarAngrily":
	say "Your heart beat sounds loud in your ears and you exalt in the moment as the imp disappears like a frightened rabbit into the forest. As the mood wains, though, you realize that it would be prudent to check in with Dmitri.[paragraph break]Pressing the intercom, you call for your assistant.[paragraph break][quotation mark]Yes, [dragonName]?[quotation mark][paragraph break][quotation mark]Is Mr. Nobspike still there?[quotation mark][paragraph break][quotation mark]No, he continues to be a no-show. It is half-past twelve, and Mr. Porkhammer, your midnight-thirty just arrived. Shall I bring you his file?[quotation mark][paragraph break][quotation mark]No, hold on,[quotation mark] you say, realizing what a mistake you[apostrophe]ve made. When word gets around that you scared off a client, your reputation will be irreparably stained.[paragraph break]Reluctantly, you head back to the still-open window and implore Mr. Nobspike to return. After ten minutes of bellowing, he emerges from the bushes. [paragraph break]You swallow down a brief and bitter apology and try to [convinceHim] of both your sincerity and emotional stability."
	
After Linkaging when topicDuJour is "worm-whichTarots":
	say "[quotation mark]Here, let me prove my bona fides,[quotation mark] you say, trying to appear friendly. [quotation mark]Right now you are walking around with three tarot cards, five fortune cookie fortunes, a wad of computer printouts and a magazine article from some tabloid.[quotation mark][paragraph break][quotation mark]Yes, that[apostrophe]s precisely right![quotation mark] The imp emerges from the bushes and is about to rest his arms on the window sill when you explain that if he does so, his arms will be sheered off at the elbows by a dimensional discontinuity. He takes a step back.[paragraph break]You try to put Mr. Nobspike more at ease with some additional explanation. [quotation mark]I realize that all of this may be a bit much, particularly for someone who does not deal day in and day out with complex branching choices and rule-driven realities.[quotation mark][paragraph break][quotation mark]Oh, but that is exactly what we Imps excel at. Just as Dragons have domain over space and time, Dimension Dwarves over dimensionality, and Continuity Elves over the between-time realm, we Imps are responsible for setting up choices and consequences in the universe. In fact, I must admit to a certain complicity in arranging tonight[apostrophe]s events for my own benefit.[quotation mark][paragraph break]Now it is your turn to look [perplexed]."
	
To say perplexed:
	place a link to the command "link worm-perplexed" reading "perplexed".
	
After Linkaging when topicDuJour is "worm-perplexed":
	say "The imp continues, [quotation mark]This evening, you will make the sorts of choices that you do every moment of the day: for example, whether to have a cup of coffee or whether to fix a squeaky door [unicode 8212] those choices are what will lead us to this moment.[quotation mark][paragraph break][quotation mark]Then I should make a different choice?[quotation mark][paragraph break][quotation mark]Oh, heavens no![quotation mark] The imp looks alarmed. [quotation mark]You can[apostrophe]t. That would ruin everything. The whole thing would be entirely linear [unicode 8212] it would strip away all semblance of player agency. I can[apostrophe]t begin to tell you the sort of complaints that would roll in.[quotation mark][paragraph break][quotation mark]You[apostrophe]re a strange cookie, Mr. Nobspike,[quotation mark] you conclude as you hand him his completed intake form. [quotation mark]Here[apostrophe]s your paperwork for tonight[apostrophe]s visit.[quotation mark] You float the completed form through the window and the imp grabs it.[paragraph break]You add, [quotation mark]Please try to show up promptly at midnight, and I would appreciate it if you wouldn[apostrophe]t pester my receptionist Dmitri with phone calls.[quotation mark][paragraph break][quotation mark]Agreed![quotation mark] The imp reaches out to shake on it, but yanks his hand back at the last moment, before crossing the threshold of the window.[paragraph break]Causality recoils with a snap, since your most recent actions have precluded the events leading to them. None of this is apparent to you, or if it is, you do not remember it. Same difference.[paragraph break]Later that evening, you (again) find yourself sitting [backAtDesk]."
	
To say backAtDesk:
	place a link to the command "link worm-backAtDesk" reading "at your desk".
	
After Linkaging when topicDuJour is "worm-backAtDesk":
	say "Before you start the evening, you decide to take a moment and center yourself. Finishing your coffee, you recline in the black ergonomic chair and prop your feet up on the broad antique desk that fills half your office. It has been a while since you[apostrophe]ve seen your actual feet, which spend most of their time tucked between your ponderous body and the hoard that you have amassed over the millennia, but you find your human feet pleasing enough and enjoy wearing stylish leather shoes.[paragraph break]Daylight pours in through the window to the side of your desk, and outside fairies and sprites dart back and forth between the trees of the dense forest surrounding your office.[paragraph break]For just a moment, you think you catch sight of someone with binoculars at the edge of the forest, but when you look again, no one is there.[paragraph break]Dmitri just announced that your new client is here for his midnight read, so you might as well read through his [intakeFormDeux], filled out in handwriting surprisingly like your own, except for where a misspelled name has been corrected."
	
To say intakeFormDeux:
	place a link to the command "link worm-intakeFormDeux" reading "intake form".
	
After Linkaging when topicDuJour is "worm-intakeFormDeux":
	say "Name: Paisley ";
	open HTML tag "span" called "stricken";
	say "Nobspike";
	close HTML tag;
	say " Knobspike[line break]Race:  [unicode 9745] Imp[line break]Birth: The 17th of Ubij in the Systematized Year 128A[paragraph break]Dmitri has helpfully penciled in some of the relevant influences at birth, noting that the client was born in seventh radiant of Umek, within the cusp of Norimar, with both Reevan-the-Warrior and Borram-the-Seeker rising in an opposing configuration. There is no mention of crossed Shadow Aspects, but that will come out in the interview, so no worries there.[paragraph break]He has checked [quotation mark]no[quotation mark] all through the section related to existential threats to the universe, so that[apostrophe]s good.[paragraph break]The rest of the form looks in order and nothing concerning catches your attention so you tell Dmitri to [enterKnobspike] into your office."
	
To say enterKnobspike:
	place a link to the command "link worm-enterKnobspike" reading "call Mr. Knobspike".
	
After Linkaging when topicDuJour is "worm-enterKnobspike":
	say "Mr. Knobspike walks in through heavy mahogany doors that lead to your office, and he pauses to give the door knob an extra few twists. [quotation mark]Well, that[apostrophe]s novel,[quotation mark] he remarks cryptically and walks fully into the office, the doors swinging shut [if squeaky_hinge flag is true]squeakily[otherwise]silently[end if] behind him.[paragraph break][quotation mark]If you[apostrophe]ll take a seat there,[quotation mark] you point towards the leather recliner at the center of the office pentacle, [quotation mark]I will get the candles placed and start the telling.[quotation mark][paragraph break]But the imp just stands there smiling, his arms crossed on the back of the chair and his gaze directed out your window towards the woods. [quotation mark]No,[quotation mark] he says, [quotation mark]I don[apostrophe]t think I need my fortune told after all. I have what I came for.[quotation mark][paragraph break][quotation mark]And what is that?[quotation mark] you ask.[paragraph break][quotation mark]A satisfying end to this story.[quotation mark][paragraph break]THE END.";
	if the last_mail_received flag is false:
		place a link to web site "[this page]"  called "folder-replay" reading "Replay", opening in the same window;
		move the element called "folder-replay" under "folders";
		now the last_mail_received flag is true;
		remove FirstVictor from the manifest of InboxFolder, if present;
		remove nextVictor from the manifest of InboxFolder, if present;
		now the manifest of JunkFolder is {};
		now the manifest of SentFolder is {};
		receive finalLetter into inboxFolder.	
	
After Linkaging when topicDuJour is "worm-finishForm":
	say "Working over the intercom, you and Mr. Nobspike breeze through the rest of the intake form. His background sounds entirely bland and raises no red flags.[paragraph break]Having entered all of the data on the form in fine draconic script, you stick the paper into your office fax machine and prepare to send it to Dmitri.[paragraph break]It has been many years since you last used the machine, so it takes you a few tries to get it right. The whole process seems unnecessarily complex and prone to failure, so you check with Dmitri over the intercom to [fax2]."
	
To say fax2:
	place a link to the command "link worm-fax2" reading "make sure it went through".
	
After Linkaging when topicDuJour is "worm-fax2":
	play the sound effect file "Fax-machine-sound.mp3";
	say "[quotation mark]Dmitri, did you get it?[quotation mark][paragraph break][quotation mark]The client is pulling it off the fax now. It[apostrophe]s coming in real slowly.[quotation mark][paragraph break][quotation mark]It[apostrophe]s a miracle it works at all across half the universe and then some. When you get it all, have Mr. Nobspike give it a once over and if it[apostrophe]s all good to go, have him sign off on it.[quotation mark][paragraph break]In the background, you hear the imp exclaim, [quotation mark]Hah! So [italic type]that[roman type] was the problem with the door [unicode 8212] amazing.[quotation mark][paragraph break]Then, Dmitri[apostrophe]s panicked voice, [quotation mark][dragonName], he[apostrophe]s gone! The client just took the fax and left.[quotation mark][paragraph break]Unnerved by the sudden turn of events you rush into the waiting room, [quotation mark]Dmitri, bring him back! No one walks out on one of my fortune tellings![quotation mark] The owl swoops out of the reception area, his nocturnally adjusted eyes allowing him to scour the forest with predatory proficiency.[paragraph break]However, after another fifteen minutes with no word from Dmitri, you write it off as an embarrassing loss and sulk back to your office. [paragraph break]You stare out the window, a time-shifted dimensional portal to the forest around your office. You ordered this dimensional portal with the temporal offset so you enjoy a daytime view of the forest even during midnight fortune telling sessions.[paragraph break]Just then, you notice some furtive movement in the bushes just outside the window. Maybe, you think to yourself, there is [stillAway] to bring this fortune telling to a successful conclusion."
	
To say stillAway:
	place a link to the command "link worm-stillAway" reading "still a way".
	
After Linkaging when topicDuJour is "worm-stillAway":
	say "Yes, it is definitely your client out there doing Ialdagorth-knows-what at the edge of the forest. You will need to do your best to avoid scaring him off, knowing how jittery he was earlier in the day.[paragraph break][crouchingShrubs]".
	
Section 4 - Pick An Option

To say pick (optionTable - a table name) options:
	if the number of filled rows in optionTable is greater than 0:
		open HTML tag "div" called "pickOption";
		repeat through optionTable:
			place a link to the command "link [Link entry]" reading "[OptionText entry]";
		close HTML tag.
			
To wipe row (linkname - text) in (tableName - a table name):
	if linkname is a Link listed in tableName:
		choose the row with the Link of linkname in tableName;
		blank out the whole row.
	
Chapter 6 - Mail Objects

Section 1 - Epistles

[Epistle Template

XXX is an epistle. XXX is unread.
The correspondent of XXX is "YYY".
The carboncopy of XXX is "YYY".
The subject of XXX is "YYY".
The payload of XXX is "YYY".
]

SEO is an epistle. SEO is read.
The subject of SEO is "Huge SEO Oppourtunity".
The correspondent of SEO is "Ephram B. Zockspoon".
The payload of SEO is "HI[paragraph break]Hope you are doing well.[paragraph break]My name is Ephram Zockspoon and working with reputed leading Search Engine Optimization Company having the experience of getting our customer's websites top in Zoodle and producing high revenue with top page rank.[paragraph break]I was searching related to your business on Zoodle and saw your website is not on first page on Zoodle for most of the relevant and user oriented keywords pertaining to your domain so I was wondering.[paragraph break]If you would be interested in getting very Affordable Search engine optimization done for your website.[paragraph break]You Can contact me with:-[paragraph break]I'd be happy to send you our package, pricing and past work details, if you'd like to assess our work.[paragraph break]Feel free to discuss any other any queries.[paragraph break]Thanks & Regards[line break]Ephram Zockspoon[line break]Manager-Business Development Team."

Chow is an epistle. Chow is read.
The subject of Chow is "Private Bank Communication".
The correspondent of Chow is "R. Chow".
The payload of Chow is "Hello,[paragraph break]I am Roderick Chow, Business Relationship Manager with Hsing Pu Bank Ltd. I am getting in touch with you regarding the estate of a deceased client with similar last name as you, and an investment placed under our banks management some years ago.[paragraph break]Please note that I am making this contact in a private capacity, rather than on behalf of the bank. Sending you this mail is not without a measure of apprehension as to the consequences, should you not be interested in my proposal.[paragraph break]However, I appreciate within me that nothing worthwhile is ever gained without a bold venture, and that success and riches never come easy. This is the one truth I have learned from my private banking clients.[paragraph break]I will respect your freewill if you do not want to be involved. kindly let me know so I shall refrain from further communication with you.[paragraph break]Thanking you for taking the time to read my proposal, I await your response.[paragraph break]Sincerely,[paragraph break]Roderick Chow[paragraph break]".

Fatima is an epistle. Fatima is read.
The subject of Fatima is "sallut".
The correspondent of Fatima is "Lady Fatima".
The payload of Fatima is "Cher Ami,[paragraph break]S'il vous plaît, ne soyez pas surpris dans ce message. Acceptez mes excuses si Cela vous a embarrassé. Cependant, il est urgent d'avoir un partenaire étranger qui m'a fait prendre contact avec vous.[paragraph break]Avec tout le respect que je vous dois, je m'appelle Mme Fatima, l'épouse de l'ancien directeur de l'aviation de mon pays, la République de Sahara Oriental, mais a été tué dans un conflit politique. Je suis basé au Fauzania pour un asile politique à cause de l'allégation contre mon mari selon laquelle il a détourné les fonds publics, et maintenant le gouvernement est derrière moi, c'est pourquoi j'ai dû fuir. Pour l'instant je ne peux pas retourner jusqu'à ce que toute la situation soit réglée.[paragraph break]Je dois visiter votre pays pour savoir s'il est possible d'investir l'argent de ma famille. Mais, les chambres de commerce m'ont conseillé de faire équipe avec le citoyen du pays, de sorte que je trouverai facile d'établir l'entreprise, c'est pourquoi j'ai besoin de quelqu'un en qui j'ai confiance.[paragraph break]J'aimerai investir sept millions, cinq cent mille dollars (7 500 000 $) et je veux que vous promettiez la transparence et le respect dans les contrats de partenariat. Ce sera un plaisir de vous donner 15% de l'argent total que je vais investir dans l'investissement, à cause de toute l'assistance nécessaire que vous ferez pendant l'installation.[paragraph break]J'apprécierai si vous pouvez me répondre, afin que nous puissions discuter plus loin.[paragraph break]Merci, que Dieu vous bénisse.[line break]Mme, Fatima Kala-Azar.".

Journal is an epistle. Journal is read.
The correspondent of Journal is "B. Abernaty, Editor".
The subject of Journal is "authors sought".
The payload of Journal is "Dear MR GEORGE MACBRAEBURN[line break] [line break]Good Morning![line break] [line break]Can we have your article for successful release of Volume 7 Issue 2 in our International Journal of the Archives Computation Fiction? (impact factor pending).[line break] [line break]In fact, we need one article to accomplish the Issue. We hope that the single manuscript should be yours. If this is a short notice please do send 2 page opinion/mini-review/critique, we hope 2 page article isn[apostrophe]t time taken for eminent people like you.[line break] [line break]Your trust in my efforts is the highest form of our motivation, I believe in you that your eminent manuscript brings out the best citation to our Journal.[line break] [line break]We do hope you will feel able to respond positively to this invitation, and we look forward to hearing from you shortly.[line break] [line break]Anticipate for your promising response.[line break] [line break]Best Regards,[paragraph break]B. Abernathy[line break]".

secondToMildred is an epistle. secondToMildred is read.
The correspondent of secondToMildred is "Mildred Sneedpox".
The carboncopy of secondToMildred is "mail room".
The subject of secondToMildred is "Re: Re: Re: Bingo Bonanza".
The payload of secondToMildred is "Dear Mildred,[paragraph break]I’m not sure we’re on the same page. This is a competition for interactive fiction [unicode 8212] most of the stories are electronic. We’ve never had anyone actually mail in a physical game, and while we try to be inclusive, I’m not sure how your game would fit the genre. I would be pleased to discuss this with you in more detail by phone.[paragraph break]Regards,[paragraph break]George MacBraeburn,[line  break]IFTFF Administrator[paragraph break][previous mail]Dear George,[paragraph break]I printed out that page as you instructed and have filled in my information, but I still need your postal address to send you my package. The game fits in a shoebox and probably weighs about four pounds, give or take. Some of the items in the game [unicode 8212] the cheeses for instance [unicode 8212] are perishable, so the box should not be left out in the elements too long, so it would be best if someone were home to watch for it.[paragraph break]Thanks,[paragraph break]Mildred[paragraph break][previous mail]Dear Mildred,[paragraph break]Please create a login on the comp’s web page by clicking the [quotation mark]sign-in/register[quotation mark] button in the upper right-hand corner. Then, sign-in using those credentials. Then, under the [quotation mark]participate[quotation mark] tab, click on [quotation mark]register or manage your entries[quotation mark] and follow those instructions. Please do not attach your game as to an email, as we have a lot of entries and we want to be sure to get the right version of your game into the competition.[paragraph break]Regards,[paragraph break]George MacBraeburn,[line  break]IFTFF Administrator[paragraph break][previous mail][paragraph break]Dear George,[paragraph break]Thank you and the Interactive Fiction Technological Freedom Foundation for hosting this year’s interactive fiction competition. I would like to submit my game, [quotation mark]Bingo Bonanza[quotation mark], but I found your website confusing and am not sure where to mail the box. Could you please let me know?[paragraph break]Thank you,[paragraph break]Mildred Sneedpox".

firstToMildred is an epistle. firstToMildred is read.
The correspondent of firstToMildred is "Mildred Sneedpox".
The carboncopy of firstToMildred is  "IFFComp Coordinator".
The subject of firstToMildred is "Re: Bingo Bonanza".
The payload of firstToMildred is "Dear Mildred,[paragraph break]Please create a login on the comp’s web page by clicking the [quotation mark]sign-in/register[quotation mark] button in the upper right-hand corner. Then, sign-in using those credentials. Then, under the [quotation mark]participate[quotation mark] tab, click on [quotation mark]register or manage your entries[quotation mark] and follow those instructions. Please do not attach your game as to an email, as we have a lot of entries and we want to be sure to get the right version of your game into the competition.[paragraph break]Regards,[paragraph break]George MacBraeburn,[line  break]IFTFF Administrator[paragraph break][previous mail][paragraph break]Dear George,[paragraph break]Thank you and the Interactive Fiction Technological Freedom Foundation for hosting this year’s interactive fiction competition. I would like to submit my game, [quotation mark]Bingo Bonanza[quotation mark], but I found your website confusing and am not sure where to mail the box. Could you please let me know?[paragraph break]Thank you,[paragraph break]Mildred Sneedpox".

Lorentz is an epistle. Lorentz is read.
The correspondent of Lorentz is "Lorentz Umbert".
The subject of Lorentz is "Progress".
The payload of Lorentz is "Dear Lorentz,[paragraph break]With your latest instructions I was able to get Haskell running in the Atari 2600 emulator, so I was able to get into the castle. I attempted to speak with the guard at the drawbridge, but I ran into difficulty because he speaks an archaic dialect that I cannot make any sense of even using online translation programs. I agree with your argument about authenticity and historical accuracy, but I am concerned that players will not understand anything at all for the first half hour of this game. I don[apostrophe]t want to discourage innovation and certainly, players do enjoy a challenge, but you may have set the bar a little high in your current work.[paragraph break]More generally, it has been my experience that it is difficult to roll your own game engine from scratch, and that most projects are better served by building off an established platform. Your interface choices are likely to put off more casual players. Even after two days of effort, I do not feel I have fully mastered the real-time joystick interface for text entry. Also, the black-on-black text is at the best of times difficult to read.[paragraph break]I am impressed by what you have managed to get across in terms of plot and characterization using only adverbs, but here again I do feel like your self-imposed constraints may prove too limiting for general tastes.[paragraph break]Please take the comments as suggestions rather than criticisms, and I look forward to seeing your final work in this year[apostrophe]s IFF Comp.[paragraph break]Sincerely,[paragraph break]George MacBraeburn".

Brigette is an epistle. Brigette is read.
The correspondent of Brigette is "Brigette Flowers".
The subject of Brigette is "Re: Prize Pool".
The payload of Brigette is "Dear Brigette,[paragraph break]Thank you for pledging a prize for this year[apostrophe]s IFF Comp, it is indeed a generous and unique offer, however, I do not feel that the Foundation can accept this gift.[paragraph break]I have not looked into all the legal details, but I suspect that shipping a live polar bear to a winner would raise any number issues, from trafficking in endangered animals to public endangerment. There are also a number of attendant logistical issues in shipping a ferocious wild animal weighing a half-ton in a refrigerated container.[paragraph break]If I could prevail upon you to contribute instead to the Humongous Fund, that would be much appreciated.[paragraph break]Sincerely,[paragraph break]George MacBraeburn".

Section 2 - Timed Epistles

Bingo is an epistle. Bingo is not read.
The receiveTime of Bingo is 1.
The subject of Bingo is  "Re: Re: Re: Re: Re: Bingo Bonanza".
The correspondent of Bingo is "Mildred Sneedpox".
The payload of Bingo is "Dear George,[paragraph break]I have put it in the mail and it should arrive shortly. I ran out of packing peanuts, so I used some actual ones, so if it smells a bit like peanut butter, now you know why. I am so excited to be part of your competition![paragraph break]Mildred[paragraph break][previous mail][paragraph break]Dear Mildred,[paragraph break]I’m not sure we’re on the same page. This is a competition for interactive fiction [unicode 8212] most of the stories are electronic. We’ve never had anyone actually mail in a physical game, and while we try to be inclusive, I’m not sure how your game would fit the genre. I would be pleased to discuss this with you in more detail by phone.[paragraph break]Regards,[paragraph break]George MacBraeburn,[line  break]IFTFF Administrator[paragraph break][previous mail]Dear George,[paragraph break]I printed out that page as you instructed and have filled in my information, but I still need your postal address to send you my package. The game fits in a shoebox and probably weights about four pounds, give or take. Some of the items in the game [unicode 8212] the cheeses for instance [unicode 8212] are perishable, so the box should not be left out in the elements too long, so it would be best if someone were home to watch for it.[paragraph break]Thanks,[paragraph break]Mildred[paragraph break][previous mail]Dear Mildred,[paragraph break]Please create a login on the comp’s web page by clicking the [quotation mark]sign-in/register[quotation mark] button in the upper right-hand corner. Then, sign-in using those credentials. Then, under the [quotation mark]participate[quotation mark] tab, click on [quotation mark]register or manage your entries[quotation mark] and follow those instructions. Please do not attach your game as to an email, as we have a lot of entries and we want to be sure to get the right version of your game into the competition.[paragraph break]Regards,[paragraph break]George MacBraeburn,[line  break]IFTFF Administrator[paragraph break][previous mail][paragraph break]Dear George,[paragraph break]Thank you and the Interactive Fiction Technological Freedom Foundation for hosting this year’s interactive fiction competition. I would like to submit my game, [quotation mark]Bingo Bonanza[quotation mark], but I found your website confusing and am not sure where to mail the box. Could you please let me know?[paragraph break]Thank you,[paragraph break]Mildred Sneedpox".

FirstVictor is an epistle. FirstVictor is not read.
The receiveTime of FirstVictor is 3.
The correspondent of FirstVictor is "Victor Cragne, Attorney".
The carboncopy of FirstVictor is "AAPDO litigation".
The subject of FirstVictor is "Dragon".
The payload of FirstVictor is "[FirstVictorPayload]".

To say FirstVictorPayload:
	say "[CragneLawFirmHeader]I am writing to you in your capacity as Chief Administrator of the Interactive Fiction Technological Freedom Foundation, or as it is more commonly known, the IFTFF on behalf of my client, AAPDO, the American Association of Professional Draconian Oracles.[paragraph break]My client seeks redress for the libel perpetuated in the outrageous and vile misrepresentation of their professional activities as depicted in an article hosted on your website as part of last year’s competition, entitled [italic type][quotation mark]The Dragon Will Tell You Your Fortune Now[quotation mark][roman type]. Go ahead and ";
	place a link to the command "link TDWTYYFN" reading "revisit it";
	say ", if the intervening year has somehow washed the putrid taste of its baseless calumny from your maw.[paragraph break]In that particular story, circumstances were taken out of context, exaggerated by a disgruntled and unreasonable client, and important aspects of the referenced dragon’s professional behavior were omitted. The dragon in question, no less than a Supreme Prophet of the Ninth Draconian Plate, made every reasonable attempt to address unusual and extenuating paranormal circumstances on the evening in question, but his efforts were entirely glossed over in the rubbish that you saw fit to publish and continue to maintain on your site.[paragraph break]I hereby serve you with the Mother of All DCMAs: I demand that you immediately remove from the internet and destroy all copies of the above-cited twaddle in your possession. Additionally, I demand compensation in the amount of $1,000,000 for your blatant and willful maligning of my client and consequent reputational damage, pain, and suffering.[paragraph break]Furthermore, this communication is intended for settlement purposes and is without prejudice to and shall not affect, in any manner, the rights, claims, remedies, actions or causes of action which I have, had or may have, at law or in equity, including my right to be reimbursed for all legal fees associated with this matter.  This letter is inadmissible in any future proceeding pursuant to Federal Rule of Evidence 408.[paragraph break]Please be further advised that I reserve my right to commence and prosecute to completion, without further notice, any and all actions or proceedings I feel is necessary and/or appropriate.[paragraph break]You have not heard the last from me, MacBraeburn!".
	
nextVictor is an epistle. nextVictor is not read.
The correspondent of nextVictor is "Victor Cragne, Attorney".
The carboncopy of nextVictor is "AAPDO litigation".
The subject of nextVictor is "RE: Dragon".
The payload of nextVictor is "[nextVictorPayload]".

To say nextVictorPayload:
	say "[CragneLawFirmHeader]What in the name of ";
	place a link to the command "link satanNipples" called "satanNipples" reading "Satan’s seven silver spiked nipple rings";
	attach a tooltip "[quotation mark]Please stop,[quotation mark] implores The Evil One, [quotation mark]that tickles![quotation mark]" on the element called "satanNipples";
	say " is taking you so long to review this matter of utmost importance?[paragraph break]Yes, of course I know that you didn’t bother to click on the link to ";
	place a link to the command "link TDWTYYFN" reading "that abysmal story from last year";
	say " [unicode 8212] I am literally surrounded by the thirteen Trustees of the American Association of Professional Draconian Oracles [unicode 8212]  all of whom are psychic dragons. Thirteen very irritable, flame-breathing dragons of venerable age, immeasurable wisdom, and as is the way with dragons, dangerously short tempers.[paragraph break]I again recommend you spend some time rolling in the frothy bilge of that contested account, until your very pores are saturated with the rancid stench of the unforgivable folderol cranked out by that ill-bred hack.[paragraph break]We’re not through with you yet, MacBraeburn![paragraph break][unicode 8212] Victor Cragne".
	
finalVictor is an epistle. finalVictor is not read.
The correspondent of finalVictor is "Victor Cragne, Attorney".
The carboncopy of finalVictor is "AAPDO litigation".
The subject of finalVictor is "!!! Re: Dragon".
The payload of finalVictor is "[finalVictorPayload]".

To say finalVictorPayload:
	say "[CragneLawFirmHeader]";
	if the reviewed flag is true:
		say "I trust that you have indeed followed my instructions to review the ";
		place a link to the command "link TDWTYYFN" reading "shameful document";
		say " that you and your ilk let into your contest last year and persist in flaunting on your ill-reputed website.[paragraph break]Well, I suppose that little bit of suffering may have done you some good and brought you closer to our way of thinking [unicode 8212] no one could look upon pile of suppurating invective without coming away… changed.[paragraph break]And this brings me to alter, at least for now, in the nature of our relationship: my associates at the AAPDO have informed me that my customary approach, while motivated entirely by their best interests, may come across as unnecessarily harsh. [run paragraph on] ";
	otherwise:
		say "I can’t really say that I blame you. Much. Except in a legally binding sense.[paragraph break]Your reluctance to again cast your eyes for even the most infinitesimal instant of time on ";
		place a link to the command "link TDWTYYFN" reading "that pile of suppurating invective";
		say " is amongst the sensible things you have ever done.[paragraph break]My associates at the AAPDO have informed me that my customary approach, while motivated entirely by their best interests, may come across as unnecessarily harsh.[run paragraph on]";
	say "I reminded them that I personally wrote eight of the twelve Indominatable Torments in the Unmerciful Book of Zamru, but they suggested we try settling out of court first.[paragraph break]Therefore, I propose the following: Through the magic invested in my office in legal matters pertaining to the Good Repute of Draconian Oracles, I decree that you [unicode 8212] and this so-called Competition of yours [unicode 8212] shall become the very instrument of their Redemption. To wit, I have attached to this electronic letter a ";
	place a link to the command "link tmworm" reading "theosophic mentality worm";
	say ".[paragraph break]I savor the sweet irony of perverting the very tools of your crimes [unicode 8212] the internet, your computer, this very email! [unicode 8212] to serve our ";
	place a link to the command "link worm-start" reading "true narrative";
	say " and force you to experience the events of that evening last year as they actually took place.[paragraph break]Don't fret. You can still go back and forth to your precious email without losing your place, but know this: Ignore this gift at your peril! I have started polishing up Indominatable Torture Number Seven as a contingency, and I assure, it would be my most sincere pleasure to inflict it upon you.[paragraph break]Sincerely,[paragraph break]Victor Cragne";
	show the element called "ScryDragon";
	now ScryView enabled flag is true.
	
To say CragneLawFirmHeader:
	say "The Law Offices of Victor Cragne[line break]201 N. Wormwood Drive[line break]Backwater, Vermont[paragraph break]Dear Mr. MacBraeburn,[paragraph break]".
	
VenkathAware is an epistle. VenkathAware is not read.
The correspondent of VenkathAware is "HDL Venkath, 9th P".
The carboncopy of VenkathAware is "Dmitri Rasputinov".
The subject of VenkathAware is "Damnable Interloper".
The payload of VenkathAware is "[VenkathAwarePayload]".

To say VenkathAwarePayload:
	say "Dear Mr. MacBraeburn,[paragraph break]With the infallible hindsight afforded me through the efforts of my legal counsel provided by the AAPDO, I am now aware of your unscrupulous activities and complicity in this tawdry affair, both in publicizing an inaccurate account of the evening in question and now in rudely scrying upon and, even more reprehensibly, tampering with, those events of a year ago.[paragraph break]This is the worst sort of unprofessional behavior, and I would be well within my rights to fly right over there now and breathe you to ash![paragraph break]Lord Venkath of the Ninth Plate,[line break]Guildmaster of Holsberg,[line break]Luminary.";
	now the receiveTime of VenkathReprimand is turnTimer plus 4;
	now the receiveTime of AAPDOReprimand is turnTimer plus 8;
	now the receiveTime of DmitriEtiquette is turnTimer plus 12.
	
VenkathReprimand is an epistle. VenkathReprimand is not read.
The correspondent of VenkathReprimand is "Victor Cragne, Attorney".
The carboncopy of VenkathReprimand is "Dmitri Rasputinov".
The subject of VenkathReprimand is "Disregard Above.".
The payload of VenkathReprimand is "[VenkathReprimand]".

To say VenkathReprimand:
 	say "[CragneLawFirmHeader]I am instructing you to disregard the recent missive sent by Lord Venkath, who spoke without counsel, and whose remarks should only be considered figurative in nature, and not at all a threat or any indication of his intention to conduct himself in a way that could be seen as an attack upon your person or mind, or otherwise render him liable to legal response.[paragraph break][unicode 8212] V. Cragne[paragraph break][previous mail][paragraph break]Your Most Worshipped Draconic Lordship Venkath,[paragraph break]As your legal counsel, I must instruct to refrain from any communications with the defendant in this matter.[paragraph break]Ever Your Humble Servant,[paragraph break]Victor".

AAPDOReprimand is an epistle. AAPDOReprimand is not read.
The correspondent of AAPDOReprimand is "Marzitrex of the Withered Claw".
The carboncopy of AAPDOReprimand is "IFTFF Admin; Dmitri Rasputinov; HDL Venkath, 9th P; AAPDO litigation".
The subject of AAPDOReprimand is "Silence, dog!".
The payload of AAPDOReprimand is "[AAPDOReprimand]".

To say AAPDOReprimand:
	say "Remember your place, Mr. Cragne. How dare you gainsay one of our Association, much less one of such prominence! What a dragon has said, let no mortal contradict.[paragraph break]You should know better. One more outburst like that, and we will leave you to rot in that 19th Century opium den, where we dredged you up.[paragraph break]Marzitrex of the Withered Claw,[line break]On Behalf of the AAPDO Board of Trustees".

Rover is an epistle. Rover is not read.
The correspondent of Rover is "Jack Welch".
The carboncopy of Rover is "IFTFF Admin".
The subject of Rover is "Shameless plug".
The payload of Rover is "[Rover]".

To say rover:
	say "Dear gmac,[paragraph break]Since the fourth wall is already compromised, I thought I’d mention that I included a blatant reference to an earlier game, Rover’s Day Out, that I wrote a few years back with Ben Collins-Sussman. That's where the woman and dog who delivered the coffee came from. Hope that’s okay.[paragraph break]Exegetically Yours,[paragraph break][unicode 8212]Jack".
	
victorRetCon is an epistle. victorRetCon is not read.
The correspondent of victorRetCon is "Victor Cragne, Attorney".
The carboncopy of victorRetCon is "Dmitri Rasputinov; HDL Venkath, 9th P; AAPDO litigation".
The subject of victorRetCon is "RetCon Advisory".
The payload of victorRetCon is "[CragneLawFirmHeader][victorRetCon1][previous mail][victorRetCon2]".

To say victorRetCon1:
	say "I must caution you to act within the bounds of reason when exercising [italic type]in loco personae[roman type] powers temporarily accorded you by the court in fulfillment of this narrative retribution. [paragraph break]Your most recent choice would have constituted client abandonment and breach of contract on the part of HDL Venkath along with implicit negligence and potential liability for Unfortold Events. More to the point, it would have been consistent with the standing unproductive narrative, which we are endeavoring to correct through this current punitive exercise.[paragraph break]Your choice has now been blotted from the record of human experience at some significant cost to my office, and in the event of your failure to produce a satisfying and true narrative reflective of professional conduct of my client, I will pass related costs on to your Foundation in addition to torturing your soul for all eternity. This is your one and only warning.[paragraph break]Sincerely,[paragraph break]Victor Cragne,[line break]Attorney".
	
To say victorRetCon2:
	say "Your Most Worshipped Dragonic Lordship Venkath,[paragraph break]It has come to my attention that last year you dismissed from your office an Imp client who was having some difficulty passing through the doors between your waiting room and your reading chamber. [paragraph break]I should advise you, that this situation came about as a result of third-party intervention, which has altered the record and is at odds with True History. That party was named in a suit brought by the AADPO, which I represent. In that suit, the party is charged with propagating a false narrative of the evening[apostrophe]s events, which cast you and your practice in a poor light and by extension brought shame to Draconic Prophecy as an industry.[paragraph break]Given that the party was making use of scrying powers enabled under an Order of Discovery and that the Defendant abused the powers by committing you to a choice of action that you did not in fact choose in the first instance, I have appealed to the Board of Impquisitioners to revoke the choice with a Writ of Retcon, which has been now been duly executed. [paragraph break]Please be advised that upon receipt of this letter, the multiverse will be refolded in due compliance.[paragraph break]Sincerely,[paragraph break]Victor Cragne, [line break]Attorney".
	
To say writOfRetcon:
	place a link to the command "link worm-writOfRetcon" reading "Writ of RetCon".
	
DmitriEtiquette is an epistle. DmitriEtiquette is not read.
The correspondent of DmitriEtiquette is "Rasputinov Dmitri N.".
The carboncopy of DmitriEtiquette is "Venkath 9th PL; IFTFF Admin; Cragne LLC; HDL Venkath, 9th P; AAPDO litigation".
The subject of DmitriEtiquette is "Some email suggestions".
The payload of DmitriEtiquette is "Dear All,[paragraph break]I do not wish to give offense, but I have recently been put in copy of several electronic mails and I wish to call attention to the fact that it may be desirable in some instances to limit the scope of recipients for purposes of discretion. [paragraph break]I realize that many of higher station will not have frequent recourse to electronic mail, preferring to dictate letters or to pen them in their own hand. However, those of us who make frequent use of the digital medium often find it advantageous to select the option [quotation mark]reply[quotation mark] rather than [quotation mark]reply all[quotation mark]; or, if having hit [quotation mark]reply all[quotation mark] to then judiciously delete those recipients who should not be privy to individual letters.[paragraph break]Also, and I do not want to appear to exceed my prerogative in making these humble suggestions for your consideration, but one may in some instances delete prior communications, which are automatically included lower in the body of each reply. In that way, it is possible to avoid excessively long letters containing no new information and focus the reader[apostrophe]s attention on only the most recent item.[paragraph break]Please let me know if I can be of service in assisting your esteemed persons in these trivial matters and I apologize in advance for the time it has cost you to peruse these few unworthy thoughts.[paragraph break]Deferentially Yours,[paragraph break]Dmitri Rasputinov[line break]Executive Assistant to[line break]HDL Venkath, 9th PL".

finalLetter is an epistle. finalLetter is not read.
The correspondent of finalLetter is "Victor Cragne, Attorney".
The carboncopy of finalLetter is "Dmitri Rasputinov; HDL Venkath, 9th P; AAPDO litigation; Marzitrex of the Withered Claw".
The subject of finalLetter is "Settlement".
The payload of finalLetter is "[settlement]".

To say settlement:
	say "[CragneLawFirmHeader]My client, the American Associaton of Professional Draconic Oracles, and I are satisfied with this outcome, which demonstrates that at all times His Draconic Lordship Venkath of the Nine Plates conformed to the highest standards of professionalism in execution of his Oracular duties. [paragraph break]The Association has agreed that the original narrative can remain on your website, but enjoins you under penalty of further prosecution to retain in perpetuity the full text of the current, corrected narrative on the same site. I trust that you and your Foundation will likewise find this an agreeable resolution.[paragraph break]It is now clear that the earlier narrative was perpetrated by the imp, Paisley Knobspike, who intentionally misled HDL Venkath[apostrophe]s receptionist about the spelling of his name during their initial telephonic interview in order to exploit an administrative feature of His Lordship[apostrophe]s reception room door. Due to client confidentiality regulations, the door is warded to only admit the client specifically requested, and we all know how literal doors can be. According to subsequent testimony from the imp, he did this with the sole intent of provoking a legal response that would generate a more satisfying player experience. A jury of his peers cleared him of all further charges brought by my office, so we now consider this matter closed.[paragraph break]As is often the way with imps, his meddling resulted in an untold amount of work and complications for others, but as a legal consultant paid hourly, I have no complaints.[paragraph break]I regret that I will not have the opportunity to torture you further in this matter but look forward to our next encounter.[paragraph break]Sincerely,[paragraph break]Victor Cragne,[line break]Attorney".

Section 3 - Mail Folders

InboxFolder is a mailfolder. The manifest of InboxFolder is {}.
The maxAge of inboxFolder is 8000.
The printed name of inboxfolder is "Inbox".

JunkFolder is a mailfolder. The manifest of JunkFolder is { SEO , Chow , Fatima, Journal}.
The maxAge of junkFolder is 120.
The printed name of junkFolder is "Junk".

SentFolder is a mailfolder. The manifest of SentFolder is { secondToMildred, Lorentz, Brigette, firstToMildred }.
The maxAge of sentFolder is 180.
The printed name of sentFolder is "Sent".

To receive (email - an epistle) into (folder - a mailfolder):
	if email is not listed in the manifest of folder:
		execute Javascript command "timestamp(0);";
		now the date of email is the text returned by the JavaScript command;
		add email at entry 1 in the manifest of folder;
		play the sound effect file "plucky.mp3";
		display a notification with title "New Mail in [bracket][folder][close bracket]" reading "[subject of email]";
		set output focus to the element called "debugWindow";
		say "added [email] to [folder].";
		set output focus to the element called "column-right";
		if the topicDuJour is "inbox":
			clear the element called "column-right";
			show index of inboxFolder.
		
Section 5 - Previous Mail

To say previous mail:
	place a block level element called "hrminisub".
	
Chapter 7 - Every Turn

To look for (email - an epistle):
	if the receiveTime of the email is TurnTimer:
		receive email into inboxFolder.

Every turn:
	if the turn hold flag is false:
		increase the turnTimer by one;
	otherwise:
		now the turn hold flag is false;
	if reviewed Flag is true:
		if the receiveTime of finalVictor is -1:
			now the receiveTime of finalVictor is turnTimer plus 1;
	otherwise:
		if the turnTimer is  (receiveTime of firstVictor plus 4):
			now the receiveTime of nextVictor is turnTimer;	
			now the receiveTime of finalVictor is turnTimer plus 6;
	repeat with email running through epistles:
		if the receiveTime of the email is the TurnTimer:
			receive email into inboxFolder;
	scroll to the element called "header";
	set output focus to the element called "debugWindow".


