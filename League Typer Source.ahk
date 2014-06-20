#NoEnv ;just something autohotkey scripts start with

;Start making variables global so they work inside of functions
global MyIniFile =
global ReadIniF2 =
global ReadIniF3 =
global ReadIniEnableGui =
global EditF2 =
global EditF3 =
global TextF2 =
global TextF3 =
global SendF2 =
global SendF3=
;end global vars

;Start INI stuff
MyIniFile := "settings.ini"
IniRead, ReadIniF2, %MyIniFile%, Default, F2Text
IniRead, ReadIniF3, %MyIniFile%, Default, F3Text
IniRead, ReadIniEnableGui, %MyIniFile%, GUI, EnableGUI
;end INI stuff

if(ReadIniEnableGui = 1) { ;if gui is enabled
;Start GUI
Gui, submit
;Just text in the GUI, does not intract with the program whatsoever
Gui, Add, Text, x27 y15 w360 h20 , League of Legends: Auto Typer by Marat Dolzhenko
Gui, Add, Text, x27 y35 w370 h20 , Currently Supports two phrases. F2 = Phrase 1 F3 = Phrase 2 F4 = Close script
Gui, Add, Text, x27 y55 w450 h20 , You can edit the default messages in settings.ini -- for more info please checkout readme.txt!
;This is just text that is next to the input box
Gui, Add, Text, x27 y95 w30 h20 , F2
Gui, Add, Text, x27 y135 w30 h20 , F3
;These are the input/edit boxes that will modify variables
Gui, Add, Edit, x87 y95 w399 h25 vEditF2 , %ReadIniF2%
Gui, Add, Edit, x87 y135 w400 h26 vEditF3 , %ReadIniF3%
;The vEditF2/F3 parts are the variables that will have data written to when you press start
;The ReadIniF2/F3 variables are default messages/data loaded from the INI

;start button - If the GUI is active, the program/hotkeys will not "work" until the start hutton is hit
Gui, Add, Button, x167 y175 w100 h30 , Start
;support me text :)
Gui, Add, Text, x127 y215 w300 h20 , Support me by checking out: http://youtube.com/aliasxtv/
; Generated using SmartGUI Creator for SciTE - used it to make a baby GUI and expanded on it, deserves credit :)
Gui, Show, w497 h242, League of Legends: Auto Typer - by Marat Dolzhenko
Suspend, On ; turns off hotkeys -- so you cant autotype until script is started
return
ButtonStart:
Gui, submit ;Makes the GUI apply text from the input field into the variables below
TextF2 = %EditF2%
TextF3 = %EditF3%
SendF2 = %EditF2%
SendF3 = %EditF3%
Suspend, Off ;Activates hotkeys
Gui Hide ;Basically disables the GUI and you're ready to type away!
return

GuiClose: ;When you press the X button in the GUI it exits the program completely. A lot of people screw up their code here
ExitApp
return
;end gui

} else { ;if GUI is disabled, then just apply default values from INI and start the script silently
SendF2 = %ReadIniF2%
SendF3 = %ReadIniF3%
}
;end of the "if" statement for checking if GUI is active or not via INI file (user's choice)

;Here is where we apply hotkeys (F keys) to functions. Simple huh
;If you have a GUI and variables and globals in your script, it's good to have this after all that code, instead of in the beggining of your program

F2::prefRole() ; 
F3::pleaseBan() ; 
F4::exitScript() ;


;It all comes to 3 simple functions attached to hotkeys :)

prefRole(){ ;hello and preferred roles
	Send, %SendF2%
	Send {Enter}
	
}

pleaseBan(){ ;ask nicely to ban 
	Send %SendF3%
	Send {Enter}
	
}

exitScript() {
ExitApp
}
