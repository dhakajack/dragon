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

The turn hold flag is a truth state that varies. The turn hold flag is false.
The turnTimer is a number that varies. The turnTimer is 0.


Section 1 - State Flags

The reviewed flag is a truth state that varies. The reviewed flag is false.
The informal flag is a truth state that varies. The informal flag is false.
The coffee flag is a truth state that varies. The coffee flag is false.
The coffee_gone flag is a truth state that varies. The coffee_gone flag is false.

Chapter 2 - Kinds

Section 1 - Epistles

An epistle is a kind of thing.
An epistle has some text called date, correspondent, carboncopy, subject, and payload.
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
	display party screen;
	move the element called "bigred" under "column-right";
	place a block level element called "folders";
	move the element called "folders" under "column-left";
	place a link to the command "link inbox" called "folder-inbox" reading "Inbox";
	place a link to the command "link sent" called "folder-sent" reading "Sent";
	place a link to the command "link junk" called "folder-junk" reading "Junk";
	place a link to the command "link about" called "folder-about" reading "About";
	place a link to the command "link credits" called "folder-credits" reading "Credits";
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
	
Chapter 4 - Linkaging
	
Linkaging is an action applying to one topic.  Understand "link [text]" as linkaging.

Check Linkaging:
	[don't do something unless it's a change from current display]
	if the topicDuJour is the topic understood:
		if debug flag is true:
			say "Duplicate action rejected: [topicDuJour].";
			now the turn hold flag is true;
		stop the action.
	
Carry out Linkaging:
	say "The topic understood is [quotation mark][topic understood][quotation mark].";
	if "back" is the topic understood:
		now the turn hold flag is true;[no advancement of story for clicking back button]
		if debug flag is true:
			say "Going back!";
		let N be the number of entries in the history buffer;
		if debug flag is true:
			say "Before back, N is [N].";
		if N is greater than 1:
			now N is N minus 1;
		now the topicDuJour is entry (N) of the history buffer;
		if debug flag is true:
			say "Changing the topicDuJour to [topicDuJour].";
		change the history buffer to have (N) entries;
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

[Evrything is a link. Pages are links, options are links, emails are links, yada, yada.]

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
			say "[bold type]Subject: [subject of item][roman type][line break][bold type]Date: [roman type][date of item][line break][bold type]To: [roman type][correspondent of item][line break]";
			if carboncopy of the item is not "":
				say "[bold type]CC: [roman type][carboncopy of the item][line break]";
			place a block level element called "hrsub";
			say payload of item;
			now the item is read;
			break.
	
After Linkaging when topicDuJour is "TDWTYYFN":
	now the reviewed flag is true;
	open HTML tag "iframe" called "dragonWindow";
	close HTML tag;
	move the element called "dragonWindow" under "column-right";
	execute JavaScript command "$(document.getElementsByClassName('dragonWindow')).attr('src', 'http://ifarchive.org/if-archive/games/competition2017/The%20Dragon%20Will%20Tell%20You%20Your%20Future%20Now/The%20Dragon%20Will%20Tell%20You%20Your%20Future%20Now.html')".
	
After Linkaging when topicDuJour is "inform":
	set output focus to the element called "column-right";
	say banner text;
	say line break;
	say "Thanks to all those who have worked on Inform and in the Inform ecosystem. This story was written in [bold type]Inform 7[roman type] and compiled for the [bold type]Glulx[roman type] virtual machine."
	
After Linkaging when topicDuJour is "about":
	set output focus to the element called "column-right";
	say "There really was a game entered into the 2018 IFcomp with the title [quotation mark]Now The Dragon Will Tell You Your Fortune[quotation mark]. There is some debate as to whether it was a joke entry, as it was unwinnable and the author entered under a pseudonym. As far as I know, the identify of the author is not known, but let me assert that it wasn't me. This current game can, therefore, be considered an [quotation mark]unauthorized[quotation mark] sequel.[paragraph break]Last year when I reviewed the original game on my [blog], I thought it was well-written, but thought it was a shame it didn't go anywhere. I found myself wondering why the client had gone to see the dragon, and most of all, why it was so hard to get into the next room to meet the dragon. Well, now the story can be told at last."
	
To say blog:
	place a link to the command "link blog" reading "blog".
	
After Linkaging when topicDuJour is "blog":
	open HTML tag "iframe" called "dragonWindow";
	close HTML tag;
	move the element called "dragonWindow" under "column-right";
	execute JavaScript command "$(document.getElementsByClassName('dragonWindow')).attr('src', 'http://blog.templaro.com/review-dragon-will-tell-future-now')".
	
After Linkaging when topicDuJour is "credits":
	set output focus to the element called "column-right";
	say "Credits go here."

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
	show index of junkFolder.
	
After Linkaging when topicDuJour is "inbox":
	if the number of entries in manifest of inboxFolder is 0:
		display party screen;
	otherwise:
		show index of inboxFolder.
		
To display party screen:
	set output focus to the element called "column-right";
	place an image "balloons.png" with the description "A cluster of colorful party balloons", centered;
	place a block level element called "bigred";
	set output focus to the element called "bigred";
	say "Congratulations![paragraph break]You have hit zero inbox!".
	
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
		
Section 2 - Story Links

After Linkaging when topicDuJour is "satanNipples":
	set output focus to the element called "column-right";
	say "The Book of Revelations had to stop at some point and it was an editorial decision to omit mention of the seven nipples of the Beast and all of his piercings, multitudinous though they be. Also, I should mention that this is an area of some sensitivity, so if you could refrain from mousing over the seven nipple rings of Our Dark Lord repeatedly, that would be appreciated.[paragraph break]Now that you have had your jollies, click the [quotation mark]Back[quotation mark] button to return to my email of extreme importance."
	
After Linkaging when topicDuJour is "worm":
	set output focus to the element called "column-right";
	say "Oh, don’t bother going looking for the theosophic mentality worm, it has already devoured its way through some superfluous memories (were they? I suppose they are now) and has sunk its hooked anchor limbs deep into the fleshy pit of your soul. Already, it is leaching away your awareness of your surroundings and infiltrating your thoughts with its hallucinatory mind poisons. Oh, you are going to have some magnificent dreams tonight, if you survive."
	
After Linkaging when topicDuJour is "start":
	set output focus to the element called "column-right";
	say "[start]".
		
To say start:
	say "Polymorphed into bipedal form so you can fit through door of your secluded sylvan office, you breeze into the waiting room.[paragraph break][quotation mark]What have we got tonight?[quotation mark] you ask Dmitri, the cream-colored spectacled owl sitting behind the reception.[paragraph break][quotation mark]Greetings, your Draconic Lordship,[quotation mark] says Dmitri bowing at his spindly talons. [quotation mark]We have one client, a Mr. Nobspike, a half-orc, half-gnome born in the seventh radiant of Umek, within the cusp of Norimar, with both Reevan-the-Warrior and Borram-the-Seeker rising in an opposing configuration.[quotation mark][paragraph break][quotation mark]How does that even happen?[quotation mark] you ask.[paragraph break][quotation mark]Reevan-the-Warrior was eclipsed by Borimar-the-Devastator until this afternoon, your Lordship.[quotation mark][paragraph break][quotation mark]No, I mean the half-orc, half-gnome part.[quotation mark][paragraph break][quotation mark]Yes, your Lordship. A curious pairing, indeed.[quotation mark] Dmitri hands you a stack of papers including the client’s chart, the latest astrological report, and the evening news. [pick table of start options]";
	if the number of filled rows in Table of Start is less than 1:
		say enterDoors.
	
Table of Start
OptionText	Link
"[quotation mark]How was your day, Dmitri?[quotation mark]"	"yourDay"
"[quotation mark]Could you be a bit less formal?[quotation mark]"	"lessFormal"
"[quotation mark]Where is my coffee?[quotation mark]"	"whereCoffee"

After Linkaging when topicDuJour is "yourDay":
	set output focus to the element called "column-right";
	say "[yourDay]".	
	
To say yourDay:
	say “[quotation mark]Your Draconic Lordship is most kind to inquire.[quotation mark] Dmitri’s feathers fluff proudly. [quotation mark]I was up with the setting of the sun and since no clients were booked until tonight’s midnight read, I thought I would spend the early evening tightening up the tolerances on the threshold.[quotation mark][paragraph break][quotation mark]Did you?[quotation mark][paragraph break][quotation mark]I was interrupted several times by phone calls from Mr. Nobspike, our client, but I did have time to check the threshold, and the tolerances are quite tight, essentially unchanged since the last calibration. Time is on spec to within 1ppm, and all the other axes are balanced.[quotation mark][paragraph break][quotation mark]Fine work, Dmitri. Precision astrology is only as good as our referents, after all.[quotation mark][paragraph break][quotation mark]Service to your Draconic Lordship is my most delightful reward.[quotation mark][enterDoors]";
	wipe row "yourDay" in Table of Start.
	
To say enterDoors:
	say "[paragraph break]You open the ";
	place a link to the command "link doors" reading "doors";
	say " to your office.".
	
To say dragonName:
	if informal flag is false:
		say "Your Draconic Lordship";
	otherwise:
		say "Lord Venkath".
	
After Linkaging when topicDuJour is "lessFormal":
	set output focus to the element called "column-right";
	say "[quotation mark]How do you desire that I address you, my Draconic Lordship?[quotation mark][paragraph break][quotation mark]How about [apostrophe]Lord Venkath[apostrophe]? That seems much less stuffy that all this [apostrophe]your Draconic Lordship[apostrophe] business.[quotation mark][paragraph break][quotation mark]Your Lordship[apostrophe]s kindness touches me deeply. Do you prefer, [apostrophe]Lord Venkath of the Seven Plates[apostrophe] or just [apostrophe]Lord Venkath[apostrophe]?[paragraph break][quotation mark]Just [apostrophe]Lord Venkath[apostrophe] seems adequate.[quotation mark][paragraph break][quotation mark]Yes, Lord Venkath, so it shall be. But I could not possibly address you so in the presence of our clients, of course.[quotation mark][paragraph break][quotation mark]Of course. Etiquette must prevail.[quotation mark][paragraph break][quotation mark]Your Lordship[apostrophe]s wisdom is incontrovertible.[quotation mark] [enterDoors]";
	now the informal flag is true;
	wipe row "lessFormal" in Table of Start.
	
After Linkaging when topicDuJour is "whereCoffee":
	set output focus to the element called "column-right";
	say "[quotation mark]I have it right here in my flight sack, [dragonName]. A twenty-ounce Costa Rican Tarazu with frosty spider eggs and a touch of salt.[quotation mark][paragraph break][quotation mark]Excellent,[quotation mark] you say, taking the proffered Styrofoam cup. While taking human form is in many ways a crippling inconvenience, being able to experience caffeine makes it all worthwhile. [enterDoors]";
	now the coffee flag is true;
	wipe row "whereCoffee" in Table of Start.

	
After Linkaging when topicDuJour is "doors":
	set output focus to the element called "column-right";
	say "[one of][firstDoor][or][secondDoor][or][thirdDoor][stopping][paragraph break]".
	
To say firstDoor:
	say "The heavy mahogany doors swing inward, over the dimensional discontinuity that leads into your office. You remark that one of the hinges is a bit creaky and instruct Dmitri to pick up some DW-40 next time he’s on the Mundane Plane. You proceed into your [office1link]."
	
To say secondDoor:
	say "[quotation mark]Dmitri, we have a problem.[quotation mark][paragraph break]Since he can[apostrophe]t widen his eyes any further, Dmitri[apostrophe]s ears perk up in surprise. [quotation mark]A problem, [dragonName]?[quotation mark][paragraph break][quotation mark]Yes, we are being scryed upon. I only got a brief glimpse, but if I am not mistaken, someone employing a theosophic mentality worm is watching our every action.[quotation mark][paragraph break][quotation mark]Most disconcerting, [dragonName]. Why ever would anyone wish to do that? Is this an audit?[quotation mark][paragraph break][quotation mark]No, I don[apostrophe]t think so, Dmitri, as audits are contemporaneous and to be effective have to be more discreet. No, this person is entirely lacking in finesse [unicode 8212] it felt like they just ham-handedly rewound time a bit. A moment from now I was in my office, and now I[apostrophe]m back out here.[quotation mark][paragraph break][quotation mark]What shall we do about it, [dragonName]? Shall I dial up the Association?[quotation mark][paragraph break][quotation mark]No, let[apostrophe]s see how this plays out. There is usually a reason for this sort of thing, although it is annoying. Also, I[apostrophe]m afraid we have little choice in the matter if someone wants to play willy-nilly with time[apostrophe]s arrow. We[apostrophe]ll just have to go along with it, repeating our actions and choices ad infinitum for their amusement.[quotation mark][paragraph break][quotation mark]Sounds dreadful.[quotation mark][paragraph break][quotation mark]Yes, but unless I pull myself out of the stream, we won[apostrophe]t even notice it, so best to just ignore it. But I do say this [unicode 8212] and now I am addressing myself our ill-mannered interloper: realize that if you back your way through time, any future events will be undone entirely and you risk forking the multiverse in an untrue fashion and destroying an untold number of realities.[quotation mark][paragraph break][quotation mark]Now then,[quotation mark] you continue, [quotation mark]I[apostrophe]m off to my [office2link].[quotation mark]".
	
To say thirdDoor:
	say "With some annoyance, you again explain to Dmitri that some busybody has been scrying on you and monkeying with causality and temporal flow. With a shrug of your shoulders, you just head back (for the first time) to your [office2link]."
		
To say office1link:
	place a link to the command "link office" reading "office".
	
To say office2link:
	place a link to the command "link office2" reading "office".

After Linkaging when topicDuJour is "office":
	set output focus to the element called "column-right";
	say "As you stride into your office[if coffee flag is true] sipping your coffee[end if], something doesn’t quite feel right.[paragraph break]You set [if coffee flag is true]the coffee and [end if]your papers down on your desk and heighten your awareness along the anterior temporal gradient."
	
After Linkaging when topicDuJour is "office2":
	set output focus to the element called "column-right";
	say "[one of]The heavy mahogany doors swing shut behind you with an annoying squeak.[paragraph break]As you set your [if coffee flag is true][drinkCoffee] and [end if][deskPapers] down, you are vaguely aware of a passive temporal merge taking place and time assumes the more comfortable shape to which you have become accustomed[or]A stack of [deskPapers] stands on your desk[if coffee flag is true and coffee_gone flag is false] next to a full cup of steaming hot [drinkCoffee][end if][stopping].[no line break][one of] Before you start the evening's work, which has already gotten off to a bumpy start, you decide to take a moment and center yourself. You recline in the black ergonomic chair and prop your feet up on the broad antique desk that fills half your office. It has been a while since you’ve seen your actual feet, which spend most of their time tucked between your ponderous body and the hoard that you have amassed over the millennia, but you find your human feet pleasing enough and enjoy wearing stylish leather shoes.[no line break][or][stopping][paragraph break]Daylight pours in through the window to the side of your desk, and outside fairies and sprites dart back and forth between the trees of the dense forest surrounding your office.";
	set output focus to the element called "debugWindow";
	receive VenkathAware into inboxFolder.
	
To say drinkCoffee:
	place a link to the command "link drinkCoffee" reading "coffee".
	
To say deskPapers:
	place a link to the command "link deskPapers" reading "papers".
	
After Linkaging when topicDuJour is "drinkCoffee":
	set output focus to the element called "column-right";
	say "The warmth of the coffee instantly puts you at ease and you fork your tongue slightly to fully appreciate its most subtle flavors. Coffee is an expensive luxury, but indispensable to achieve optimal focus for your readings. Coffee beans are not native and are only delivered sporadically when a ship piloted by a woman and her dog arrives in Holsberg with a cargo hold full of mundane delicacies.[paragraph break]You finish sipping your coffee and toss the cup into the timeless void between space.";
	set output focus to the element called "debugWindow";
	now the coffee_gone flag is true;
	receive rover into inboxFolder.
	
After Linkaging when topicDuJour is "deskPapers":
	set output focus to the element called "column-right";
	say "[one of]When you walked in you tossed the documents that Dmitri had handed you onto some other [or]There are a number of [stopping]papers on the corner of your desk. Poking through the pile, you see tomorrow’s [newspaper], a freshly printed astrological [update], and your client’s [chart]. Further down in the pile, you [one of]dig out the invitation to speak at this year’s Soothsaying Guild Annual Awards Dinner.[pick Table of Guild Dinner options][or]find an old bill from the Dimension Dwarves.[pick Table of DDbill options][or][stopping]".
	
To say newspaper:
	place a link to the command "link newspaper" reading "newspaper".
	
To say update:
	place a link to the command "link update" reading "update".
	
To say chart:
	place a link to the command "link chart" reading "chart".
	
After Linkaging when topicDuJour is "newspaper":
	set output focus to the element called "column-right";
	say "You leaf through tomorrow’s newspaper looking for any short term perturbations or causal inconsistencies, but ignore the news itself, which is too fluid to be reliable.[no line break][one of] You take particular joy in reading through the sham horoscopes and weather forecasts, which keep professional seers like you in business.[no line break][or][stopping][paragraph break]".
	
After Linkaging when topicDuJour is "update":
	set output focus to the element called "column-right";
	say "You start with the headlines: The long-anticipated Age of Boort-the-Deceiver is only a few days away, so there will be a mad rush to align those temples in the next couple days (despite Dentar Ten Plate having forecasted the event almost two hundred years ago). Above the ecliptic, Togam-the-Fishwife is transiting the Hoary Field of Incertitude, the meaning of which, of course, is anyone’s guess. On the broad sheet, the Houses of Yaptog-the-Willful and Erelam-the-Incontinent are nearing opposition along a line roughly orthogonal to Peetsokh-the-Unready. That may open up some interesting opportunities for some of your elven conjurer corporate clients. Nothing interesting going on in the Minor Houses, and there are no Shadow Aspects that bear mentioning. In more mundane matters, you make note of a continuing coronal mass ejection, which sometimes prompts clients to drop by when they take the appearance of an aurora as a supernatural sign."
	
After Linkaging when topicDuJour is "chart":
	set output focus to the element called "column-right";
	say "You flip past the HIPAA-compliant coversheet and glance at the demographic info:[paragraph break]Name: Paisley Nobspike[line break]Race: He has checked the boxes for orc and gnome.[line break]Birth: The 17th of Ubij in the Systematized Year 128A[paragraph break]Dmitri has helpfully penciled in some of the relevant influences at birth, noting that the client was born in seventh radiant of Umek, within the cusp of Norimar, with both Reevan-the-Warrior and Borram-the-Seeker rising in an opposing configuration. There is no mention of crossed Shadow Aspects, but that will come out in the interview, so no worries there.[paragraph break][one of]You dutifully scan past his address and insurance information but are surprised that the rest of the pages are blank.[pick table of bob options][or]The rest of his chart is blank. Unfortunately, the client did not provide the necessary information to Dmitri. You’ll have to waste time during the intake session completing this drudgery. If you weren’t in human form, tendrils of black smoke would now be rising from your nostrils.[stopping]".

Table of Guild Dinner
OptionText	Link
"Throw out the invitation, it’s been on your desk too long."	"garbageInvitation"
"[quotation mark]Dmitri? Did we respond to the Awards Dinner Invitation?[quotation mark]"	"didWeReply"
"[quotation mark]Dmitri, let the awards folks know that I’ll do the talk.[quotation mark]"	"willTalk"
"[quotation mark]Dmitri, make up some excuse to get me out of the Awards Dinner talk.[quotation mark]"	"wontTalk"

After Linkaging when topicDuJour is "garbageInvitation":
	set output focus to the element called "column-right";
	say "You toss the balled-up invitation backwards over your shoulder towards a rift in space-time that you manifest near the bookshelves. The wad of paper goes wide and lands on the floor. You pick it up again with annoyance and chuck it into the depthless absence of being and award yourself two points rather than three. You can’t be too critical of yourself, after all: the eyes on your current face are just too close together to afford reasonable depth perception.";
	wipe row "garbageInvitation" in Table of Start.
	
After Linkaging when topicDuJour is "didWeReply":
	set output focus to the element called "column-right";
	say "[quotation mark]Let me see, [dragonName].[quotation mark] You hear a fluttering of wings over the intercom, as Dmitri shuffles back through his outgoing mails. [quotation mark]No, [dragonName], I don[apostrophe]t see anything.[quotation mark]"
	
After Linkaging when topicDuJour is "willTalk":
	set output focus to the element called "column-right";
	say "[quotation mark]Is that the Draconian Prophecy Alliance Gala, [dragonName]?[quotation mark] Dmitri asks you over the office intercom.[paragraph break][quotation mark]No, it[apostrophe]s the Soothsaying Guild Annual Awards Dinner – at the Hill Giant Lodge, if I recall.[quotation mark][paragraph break][quotation mark]Ah, fine. Okay, I will send a reply on the first rabbit that hops by. What shall I say will be your topic?[quotation mark][paragraph break][quotation mark]Let[apostrophe]s brush off the [apostrophe]Teach An Old Dragon New Tricks[apostrophe] talk from last year[apostrophe]s convention. No one on this Plane of Existence has heard it.[quotation mark][paragraph break][quotation mark]Very good, your [dragonName].[quotation mark]".

After Linkaging when topicDuJour is "wontTalk":
	set output focus to the element called "column-right";
	say "You inform Dmitri over the office intercom of your decision not to speak at this year[apostrophe]s Awards Dinner.[paragraph break][quotation mark]I am sure your absence will be greatly felt by them, [dragonName].[quotation mark][paragraph break][quotation mark]That would be fine by me. If they miss me enough, maybe next year they[apostrophe]ll comp their speakers. These awards dinners are a self-congratulatory scam.[quotation mark]"


Table of DDbill
OptionText	Link
"Throw out the bill, surely it’s been paid by now."	"garbageBill"
"[quotation mark]Dmitri? I found an old double-D invoice [unicode 8212] should I throw it out?[quotation mark]"	"checkBill"

After Linkaging when topicDuJour is "garbageBill":
	set output focus to the element called "column-right";
	say "You open the tiniest portal deep within a gravity well and watch the invoice be torn atom-from-atom as its spaghettifies and spirals out of existence awash in a burst of hard X-rays. In an instant, it is gone and the rupture seals behind it. Done and done.".
	
After Linkaging when topicDuJour is "checkBill":
	set output focus to the element called "column-right";
	say "Your inquiry about the Dimension Dwarf invoice elicits a worried clucking from the other end of the intercom.[paragraph break][quotation mark][dragonName], may I respectfully beseech that we retain that invoice?[quotation mark][paragraph break][quotation mark]You don[apostrophe]t think we[apostrophe]re paid up?[quotation mark][paragraph break][quotation mark]We make automatic payments from the Unicorn account, but there was a billing issue last month [unicode 8212] the waiting room portals got bent around into sort of a Klein bottle topology and they tried to charge us an infinite sum. I don[apostrophe]t know if they[apostrophe]ve credited that back to the account yet.[quotation mark][paragraph break][quotation mark]Fine,[quotation mark] you reply and hand the receipt over to Dmitri. He hops in and out, and closes the squeaky door behind him.".

Table of Bob
OptionText	Link
"[quotation mark]Dmitri, how am I supposed to tell a fortune without an intake sheet?[quotation mark]"	"whereIntake"
"[quotation mark]Dmitri, tell Mr. Nobspike to reschedule after he fills out the intake sheet.[quotation mark]"	"bump"
"[quotation mark]Dmitri, cancel Nobspike and set him up next week with HDL Cormouth.[quotation mark]"	"turf"


After Linkaging when topicDuJour is "whereIntake":
	set output focus to the element called "column-right";
	say "[quotation mark]I do most humbly apologize, [dragonName]. Mr. Nobspike called several times today – he is a most anxious individual.[quotation mark][paragraph break][quotation mark]And you didn[apostrophe]t get his history on any of those calls?[quotation mark][paragraph break][quotation mark]Again, [dragonName], I beg your indulgence. Every time he called, I had to reassure him about coming here, specifically, that you would not eat him.[quotation mark][paragraph break][quotation mark]Eat him![quotation mark] Your teeth begin to elongate and wing stubs stir in your back, but you quell the transformation. [quotation mark]Of all the prejudiced… You know, maybe I should.[quotation mark][paragraph break]Polite, nervous laughter over the intercom.".

After Linkaging when topicDuJour is "bump":
	set output focus to the element called "column-right";
	say "[quotation mark]Why don[apostrophe]t we call it a night. You can bump his appointment to the next alignment, I think the 25th should do.[quotation mark][commonDisposition]".
	
After Linkaging when topicDuJour is "turf":
	set output focus to the element called "column-right";
	say "[quotation mark]I can[apostrophe]t be wasting my time on trivial cases like this – see if you can reach him and send him over to Cormouth. He[apostrophe]s always looking for clients.[quotation mark][commonDisposition]".

To say commonDisposition:
	say "[paragraph break][quotation mark]I weep sorrowfully that I cannot do as you command, [dragonName].[quotation mark][paragraph break][quotation mark]But it[apostrophe]s almost midnight and he[apostrophe]s not even here. Also, knock it off with the weeping. That[apostrophe]s not what I want clients to see when the step into the waiting room. Now what[apostrophe]s the issue?[quotation mark][paragraph break][quotation mark]Mr. Nobspike is a Class-A with direct referral from the Spire.[quotation mark][paragraph break][quotation mark]Fine. Send him in whenever he deigns grace our doorstep and we[apostrophe]ll muddle through.[quotation mark][paragraph break][quotation mark]It will be my greatest joy to so serve you, [dragonName].[quotation mark]".


Section 3 - Pick An Option

To say pick (optionTable - a table name) options:
	if the number of filled rows in optionTable is greater than 0:
		open HTML tag "ul" called "pickOption";
		repeat through optionTable:
			open HTML tag "li";
			place a link to the command "link [Link entry]" reading "[OptionText entry]";
			close HTML tag;[/li]
		close HTML tag.[/ul]
		
To wipe row (linkname - text) in (tableName - a table name):
	if linkname is a Link listed in tableName:
		choose the row with the Link of linkname in tableName;
		blank out the whole row.
		
Chapter 6 - Every Turn

BingoTime is always 3.
FirstVictorTime is always 6.
NextVictorTime is a number that varies. NextVictorTime is -1.
FinalVictorTime is a number that varies. FinalVictorTime is -1.
VenkathReprimandTime is a number that varies. VenkathReprimandTime is -1.
AAPDOReprimandTime is a number that varies. AAPDOReprimandTime is -1.

Every turn:
	set output focus to the element called "debugWindow";
	if the turn hold flag is false:
		increase the turnTimer by one;
	otherwise:
		now the turn hold flag is false;
	if the TurnTimer is bingoTime:
		receive Bingo into inboxFolder;
	if the TurnTimer is firstVictorTime:
		receive firstVictor into inboxFolder;
	if reviewed Flag is true:
		if finalVictorTime is -1:
			now finalVictorTime is turnTimer plus 2;
	otherwise:
		if firstVictor is read and NextVictorTime is -1:
			now nextVictorTime is turnTimer plus 3;
	if the TurnTimer is nextVictorTime and reviewed flag is false:
		receive nextVictor into inboxFolder;
		now finalVictorTime is turnTimer plus 3;
	if the TurnTimer is finalVictorTime:
		receive finalVictor into inboxFolder;
	if the TurnTimer is VenkathReprimandTime:
		receive VenkathReprimand into InboxFolder;
	if the TurnTimer is AAPDOReprimandTime:
		receive AAPDOReprimand into InboxFolder.
		

Chapter 7 - Mail Objects

Section 1 - Epistles

[Epistle Template

XXX is an epistle. XXX is read.
The date of XXX is "YYY".
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

Intemp2 is an epistle. Intemp2 is read.
The correspondent of intemp2 is "YYY".
The carboncopy of Intemp2 is  "YYY".
The subject of Intemp2 is  "inbox2".
The payload of Intemp2 is  "YYY".

Intemp3 is an epistle. Intemp3 is read.
The correspondent of intemp3 is "YYY".
The carboncopy of Intemp3 is  "YYY".
The subject of Intemp3 is  "inbox3".
The payload of Intemp3 is  "YYY".

secondToMildred is an epistle. secondToMildred is read.
The correspondent of secondToMildred is "Mildred Sneedpox".
The carboncopy of secondToMildred is "mail room".
The subject of secondToMildred is "Re: Re: Re: Bingo Bonanza".
The payload of secondToMildred is "Dear Mildred,[paragraph break]I’m not sure we’re on the same page. This is a competition for interactive fiction – most of the stories are electronic. We’ve never had anyone actually mail in a physical game, and while we try to be inclusive, I’m not sure how your game would fit the genre. I would be pleased to discuss this with you in more detail by phone.[paragraph break]Regards,[paragraph break]George MacBraeburn,[line  break]IFTFF Administrator[paragraph break][previous mail]Dear George,[paragraph break]I printed out that page as you instructed and have filled in my information, but I still need your postal address to send you my package. The game fits in a shoebox and probably weights about four pounds, give or take. Some of the items in the game [unicode 8212] the cheeses for instance [unicode 8212] are perishable, so the box should not be left out in the elements too long, so it would be best if someone were home to watch for it.[paragraph break]Thanks,[paragraph break]Mildred[paragraph break][previous mail]Dear Mildred,[paragraph break]Please create a login on the comp’s web page by clicking the [quotation mark]sign-in/register[quotation mark] button in the upper right-hand corner. Then, sign-in using those credentials. Then, under the [quotation mark]participate[quotation mark] tab, click on [quotation mark]register or manage your entries[quotation mark] and follow those instructions. Please do not attach your game as to an email, as we have a lot of entries and we want to be sure to get the right version of your game into the competition.[paragraph break]Regards,[paragraph break]George MacBraeburn,[line  break]IFTFF Administrator[paragraph break][previous mail][paragraph break]Dear George,[paragraph break]Thank you and the Interactive Fiction Technological Freedom Foundation for hosting this year’s interactive fiction competition. I would like to submit my game, [quotation mark]Bingo Bonanza[quotation mark], but I found your website confusing and am not sure where to mail the box. Could you please let me know?[paragraph break]Thank you,[paragraph break]Mildred Sneedpox".

senttemp2 is an epistle. senttemp2 is read.
The correspondent of senttemp2 is "YYY".
The carboncopy of senttemp2 is  "YYY".
The subject of senttemp2 is  "sent2".
The payload of senttemp2 is  "YYY".

firstToMildred is an epistle. firstToMildred is read.
The correspondent of firstToMildred is "Mildred Sneedpox".
The carboncopy of firstToMildred is  "IFFComp Coordinator".
The subject of firstToMildred is "Re: Bingo Bonanza".
The payload of firstToMildred is "Dear Mildred,[paragraph break]Please create a login on the comp’s web page by clicking the [quotation mark]sign-in/register[quotation mark] button in the upper right-hand corner. Then, sign-in using those credentials. Then, under the [quotation mark]participate[quotation mark] tab, click on [quotation mark]register or manage your entries[quotation mark] and follow those instructions. Please do not attach your game as to an email, as we have a lot of entries and we want to be sure to get the right version of your game into the competition.[paragraph break]Regards,[paragraph break]George MacBraeburn,[line  break]IFTFF Administrator[paragraph break][previous mail][paragraph break]Dear George,[paragraph break]Thank you and the Interactive Fiction Technological Freedom Foundation for hosting this year’s interactive fiction competition. I would like to submit my game, [quotation mark]Bingo Bonanza[quotation mark], but I found your website confusing and am not sure where to mail the box. Could you please let me know?[paragraph break]Thank you,[paragraph break]Mildred Sneedpox".

Section 2 - Timed Epistles


Bingo is an epistle. Bingo is not read.
The subject of Bingo is  "Re: Re: Re: Re: Re: Bingo Bonanza".
The correspondent of Bingo is "Mildred Sneedpox".
The payload of Bingo is "Dear George,[paragraph break]I have put it in the mail and it should arrive shortly. I ran out of packing peanuts, so I used some actual ones, so if it smells a bit like peanut butter, now you know why. I am so excited to be part of your competition![paragraph break]Mildred[paragraph break][previous mail][paragraph break]Dear Mildred,[paragraph break]I’m not sure we’re on the same page. This is a competition for interactive fiction – most of the stories are electronic. We’ve never had anyone actually mail in a physical game, and while we try to be inclusive, I’m not sure how your game would fit the genre. I would be pleased to discuss this with you in more detail by phone.[paragraph break]Regards,[paragraph break]George MacBraeburn,[line  break]IFTFF Administrator[paragraph break][previous mail]Dear George,[paragraph break]I printed out that page as you instructed and have filled in my information, but I still need your postal address to send you my package. The game fits in a shoebox and probably weights about four pounds, give or take. Some of the items in the game [unicode 8212] the cheeses for instance [unicode 8212] are perishable, so the box should not be left out in the elements too long, so it would be best if someone were home to watch for it.[paragraph break]Thanks,[paragraph break]Mildred[paragraph break][previous mail]Dear Mildred,[paragraph break]Please create a login on the comp’s web page by clicking the [quotation mark]sign-in/register[quotation mark] button in the upper right-hand corner. Then, sign-in using those credentials. Then, under the [quotation mark]participate[quotation mark] tab, click on [quotation mark]register or manage your entries[quotation mark] and follow those instructions. Please do not attach your game as to an email, as we have a lot of entries and we want to be sure to get the right version of your game into the competition.[paragraph break]Regards,[paragraph break]George MacBraeburn,[line  break]IFTFF Administrator[paragraph break][previous mail][paragraph break]Dear George,[paragraph break]Thank you and the Interactive Fiction Technological Freedom Foundation for hosting this year’s interactive fiction competition. I would like to submit my game, [quotation mark]Bingo Bonanza[quotation mark], but I found your website confusing and am not sure where to mail the box. Could you please let me know?[paragraph break]Thank you,[paragraph break]Mildred Sneedpox".


FirstVictor is an epistle. FirstVictor is not read.
The correspondent of FirstVictor is "Victor Cragne, Attorney".
The carboncopy of FirstVictor is "AAPDO litigation".
The subject of FirstVictor is "Dragon".
The payload of FirstVictor is "[FirstVictorPayload]".

To say FirstVictorPayload:
	say "[CragneLawFirmHeader]I am writing to you in your capacity as Chief Administrator of the Interactive Fiction Technological Freedom Foundation, or as it is more commonly known, the IFTFF on behalf of my client, AAPDO, the American Association of Professional Draconian Oracles.[paragraph break]My client seeks redress for the libel perpetuated in the outrageous and vile misrepresentation of their professional activities as depicted in an article hosted on your website as part of last year’s competition, entitled [italic type][quotation mark]The Dragon Will Tell You Your Fortune Now[quotation mark][roman type]. Go ahead and ";
	place a link to the command "link TDWTYYFN" reading "revisit it";
	say ", if the intervening year has somehow washed the putrid taste of its baseless calumny from your maw.[paragraph break]In that particular story, circumstances were taken out of context, exaggerated by a disgruntled and unreasonable client, and important aspects of the referenced dragon’s professional behavior were omitted. The dragon in question, no less than a Supreme Prophet of the Ninth Draconian Plate, made every reasonable attempt to address unusual and extenuating paranormal circumstances on the evening in question, but his efforts were entirely glossed over in the rubbish that you saw fit to publish and continue to maintain on your site.[paragraph break]I demand that you immediately remove from the internet and destroy all copies of the above-cited twaddle in your possession.  Additionally, I demand compensation in the amount of $1,000,000 for your blatant and willful maligning of my client and consequent reputational damage, pain, and suffering.[paragraph break]Furthermore, this communication is intended for settlement purposes and is without prejudice to and shall not affect, in any manner, the rights, claims, remedies, actions or causes of action which I have, had or may have, at law or in equity, including my right to be reimbursed for all legal fees associated with this matter.  This letter is inadmissible in any future proceeding pursuant to Federal Rule of Evidence 408.[paragraph break]Please be further advised that I reserve my right to commence and prosecute to completion, without further notice, any and all actions or proceedings I feel is necessary and/or appropriate.[paragraph break]You have not heard the last from me, MacBraeburn!".
	
nextVictor is an epistle. nextVictor is not read.
The correspondent of nextVictor is "Victor Cragne, Attorney".
The carboncopy of nextVictor is "AAPDO litigation".
The subject of nextVictor is "RE: Dragon".
The payload of nextVictor is "[nextVictorPayload]".

To say nextVictorPayload:
	say "[CragneLawFirmHeader]What in the name of ";
	place a link to the command "link satanNipples" reading "Satan’s seven silver-spiked nipple rings";
	say " is taking you so long to review this matter of utmost importance?[paragraph break]Yes, of course I know that you didn’t bother to click on the ";
	place a link to the command "link TDWTYYFN" reading "link to that abysmal story from last year";
	say " [unicode 8212] I am literally surrounded by the thirteen Trustees of the American Association of Professional Draconian Oracles [unicode 8212]  all of whom are psychic dragons. Thirteen very irritable, flame-breathing dragons of venerable age, immeasurable wisdom, and as is the way with dragons, dangerously short tempers.[paragraph break]I again recommend you spend some time rolling in the frothy bilge of that contested account, until your very pores are saturated with the rancid stench of the unforgiveable folderol cranked out by that ill-bred hack.[paragraph break]We’re not through with you yet, MacBraeburn![paragraph break][unicode 8212] Victor Cragne".
	
finalVictor is an epistle. finalVictor is not read.
The correspondent of finalVictor is "Victor Cragne, Attorney".
The carboncopy of finalVictor is "AAPDO litigation".
The subject of finalVictor is "RE: RE: Dragon".
The payload of finalVictor is "[finalVictorPayload]".

To say finalVictorPayload:
	say "[CragneLawFirmHeader]";
	if the reviewed flag is true:
		say "My Draconian friends inform me that you have indeed followed my instructions to review the shameful document that you and your ilk let into your contest last year and persist in flaunting on your ill-reputed website.[paragraph break]Well, I suppose that little bit of suffering may have done you some good and brought you closer to our way of thinking [unicode 8212] no one could look upon pile of suppurating invective without coming away… changed.[paragraph break]And this brings me to alter, at least for now, in the nature of our relationship: my associates at the AAPDO have informed me that my customary approach, while motivated entirely by their best interests, may come across as unnecessarily harsh. [run paragraph on]";
	otherwise:
		say "I can’t really say that I blame you. Much. Except in a legally binding sense.[paragraph break]Your reluctance to again cast your eyes for even the most infinitesimal instant of time on that pile of suppurating invective is amongst the sensible things you have ever done.[paragraph break]My associates at the AAPDO have informed me that my customary approach, while motivated entirely by their best interests, may come across as unnecessarily harsh.[run paragraph on]";
	say "I reminded them that I personally wrote eight of the twelve Indominatable Torments in the Unmerciful Book of Zamru, but they suggested we try settling out of court first.[paragraph break]Therefore, I propose the following: Through the magic invested in my office in legal matters pertaining to the Good Repute of Draconian Oracles, I decree that you [unicode 8212] and this so-called Competition of yours [unicode 8212] shall become the very instrument of their Redemption. To wit, I have attached to this electronic letter a ";
	place a link to the command "link worm" reading "theosophic mentality worm";
	say ", which has already penetrated and has become lodged in the core of your essence. Soon the ";
	place a link to the command "link start" reading "world will begin to appear ";	
	say "to all of you as it did to my client, that evening last year when all this took place.[paragraph break]Ignore this gift at your peril! I have started polishing up Indominatable Torture Number Seven as a contingency, and I assure, it would be my most sincere pleasure to inflict it upon you.[paragraph break]Sincerely,[paragraph break]Victor Cragne".
	
To say CragneLawFirmHeader:
	say "The Law Offices of Victor Cragne[line break]201 N. Wormwood Drive[line break]Backwater, Vermont[paragraph break]Dear Mr. MacBraeburn,[paragraph break]".
	
VenkathAware is an epistle. VenkathAware is not read.
The correspondent of VenkathAware is "HDL Venkath, 9th P".
The carboncopy of VenkathAware is "Dmitri Rasputinov".
The subject of VenkathAware is "Damnable Interloper".
The payload of VenkathAware is "[VenkathAwarePayload]".

To say VenkathAwarePayload:
	say "Dear Mr. MacBraeburn,[paragraph break]With the infalliable hindsight afforded me through the efforts of my legal counsel provided by the AAPDO, I am now aware of your unscrupulous activities and complicity in this tawdry affair, both in publicizing an inaccurate account of the evening in question and now in rudely scrying upon and, even worse, tampering with, those events. This is the worst sort of unprofessional behavior, and I would be well within my rights to fly right over there now and breathe you to ash![paragraph break]Lord Venkath of the Ninth Plate,[line break]Guildmaster of Holsberg,[line break]Luminary.";
	now VenkathReprimandTime is turnTimer plus 2;
	now AAPDOReprimandTime is turnTimer plus 4.
	
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
The subject of Rover is "Shamless plug".
The payload of Rover is "[Rover]".

To say rover:
	say "Dear gmac,[paragraph break]Since the fourth wall is already compromised beyond economic repair, I thought I’d mention that I included a blatant Easter egg making reference to an earlier game, Rover’s Day Out, that I wrote a few years back with Ben Collins-Sussman.[paragraph break]Hope that’s okay.[paragraph break][unicode 8212]Jack".

Section 3 - Mail Folders

InboxFolder is a mailfolder. The manifest of InboxFolder is {}.
The maxAge of inboxFolder is 8000.
The printed name of inboxfolder is "Inbox".

JunkFolder is a mailfolder. The manifest of JunkFolder is { SEO , Chow , Fatima}.
The maxAge of junkFolder is 120.
The printed name of junkFolder is "Junk".

SentFolder is a mailfolder. The manifest of SentFolder is { secondToMildred , senttemp2 , firstToMildred }.
The maxAge of sentFolder is 180.
The printed name of sentFolder is "Sent".

Section 4 - Incoming Mail

arrive1 is an epistle. arrive1 is read.
The correspondent of arrive1 is  "YYY".
The carboncopy of arrive1 is  "YYY".
The subject of arrive1 is  "arrive1".
The payload of arrive1 is  "YYY".

arrive2 is an epistle. arrive2 is read.
The correspondent of arrive2 is  "YYY".
The carboncopy of arrive2 is  "YYY".
The subject of arrive2 is  "arrive2".
The payload of arrive2 is  "YYY".

To receive (email - an epistle) into (folder - a mailfolder):
	if email is not listed in the manifest of folder:
		execute Javascript command "timestamp(0);";
		now the date of email is the text returned by the JavaScript command;
		add email to the manifest of folder;
		play the sound effect file "plucky.mp3";
		display a notification with title "New Mail in [bracket][folder][close bracket]" reading "[subject of email]";
		say "added [email] to [folder].";
		if the topicDuJour is "inbox":
			clear the element called "column-right";
			show index of inboxFolder;
			set output focus to the element called "debugWindow".

	
Section 5 - Previous Mail

To say previous mail:
	place a block level element called "hrminisub".


