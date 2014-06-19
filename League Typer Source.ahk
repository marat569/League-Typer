#NoEnv
;Start making vars global so they work inside of functions
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
IniRead, ReadIniF2, settings.ini, Default, F2Text
IniRead, ReadIniF3, settings.ini, Default, F3Text
IniRead, ReadIniEnableGui, settings.ini, GUI, EnableGUI
;end INI stuff

if(ReadIniEnableGui = 1) { ;if gui is enabled
;Start GUI
Gui, submit
;just random text
Gui, Add, Text, x27 y15 w360 h20 , League of Legends: Auto Typer by Marat Dolzhenko
Gui, Add, Text, x27 y35 w370 h20 , Currently Supports two phrases. F2 = Phrase 1 F3 = Phrase 2 F4 = Close script
Gui, Add, Text, x27 y55 w450 h20 , You can edit the default messages in settings.ini -- for more info please checkout readme.txt!
;
Gui, Add, Text, x27 y95 w30 h20 , F2
Gui, Add, Text, x27 y135 w30 h20 , F3
Gui, Add, Edit, x87 y95 w399 h25 vEditF2 , %ReadIniF2%
Gui, Add, Edit, x87 y135 w400 h26 vEditF3 , %ReadIniF3%
;start button
Gui, Add, Button, x167 y175 w100 h30 , Start
;support me text :)
Gui, Add, Text, x127 y215 w300 h20 , Support me by checking out: http://youtube.com/aliasxtv/
; Generated using SmartGUI Creator for SciTE
Gui, Show, w497 h242, League of Legends: Auto Typer - by Marat Dolzhenko
Suspend, On ; turns off hotkeys -- so you cant type until script is started
return
ButtonStart:
Gui, submit
TextF2 = %EditF2%
TextF3 = %EditF3%
SendF2 = %EditF2%
SendF3 = %EditF3%
;MsgBox, %TextF2% | %TextF3% | %EditF2% | %EditF3% |
Suspend, Off ;Activates hotkeys
Gui Hide
return

GuiClose:
ExitApp
return
;end gui
} else { ;if GUI is disabled, then just apply default values from INI and start the script silently
SendF2 = %ReadIniF2%
SendF3 = %ReadIniF3%
}

F2::prefRole() ; 
F3::pleaseBan() ; 
F4::exitScript() ;





prefRole(){ ;hello and preferred roles
	;Send, Hello, Mid,Top,Jungle preferred (in that order)
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