#SingleInstance, Force
Gui, Browser:Add, Text, , Website:
Gui, Browser:Add, Edit, xm y+10 w150 vWebsite
Gui, Browser:Add, Button, x+m w30 gSet, Set
Gui, Browser:Add, Text, xm, Total Views:
Gui, Browser:Add, Edit, y+10 w150 vViews
Gui, Browser:Add, Button, x+m w30 gSet, Set
Gui, Browser:Add, Text, xm, Delay in Milliseconds (1000ms = 1s):
Gui, Browser:Add, Edit, y+10 w150 vDelay
Gui, Browser:Add, Button, x+m w30 gSet, Set
Gui, Browser:Add, Button, xm w90 gStart, Start
Gui, Browser:Add, Button, x+m w90 gStop, Stop
Gui Browser:Add, ActiveX, xm w190 h120 vBrowser, Shell.Explorer
Gui, Browser:Add, StatusBar,, Views: 0
Menu, Extra, Add, &About, About
Menu, Extra, Add, &Visit Website, Website
Menu, Extra, Add, &Reload Script, Reload
Menu, Extra, Add, &Exit, Exit
Menu, MenuBar, Add, &Extra Commands, :Extra
Gui, Browser:Menu, MenuBar
Gui, Browser:Show, , Website View Bot
Browser.silent := true
Set:
	Gui, Browser:Submit, NoHide
	return
Start:
	Status := 1
	Total := 0
	Loop
	{
		if Status = 1
		{
			Browser.Navigate(Website)
			Sleep, Delay
			Total := Total + 1
			SB_SetText("Views:" Total)
		}
		if Status = 2
			break
	}	Until Total >= Views
	MsgBox, 64, Done, Done`, sent %Total% views.
	return
Stop:
	Status := 2
	return
About:
	MsgBox, 64, Website View Bot, Creator: Stan1023`nVersion: 1.1`nDescription: Send views to any website without any work
	return
Reload:
	Reload
Website:
	Run, http://stan1023.wix.com/info, , Max
	return
Exit:
	ExitApp
