#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
DetectHiddenText, On

^+2::ToggleVideoOrMute(0)
^+1::ToggleVideoOrMute(1)

ToggleVideoOrMute(keyCombo) {
	;get IDs for all teams windows
	WinGet, id, list, ahk_exe Teams.exe 
	;Loop through IDs of all teams windows
	Loop, %id% 
	{
		this_ID := id%A_Index%
		WinGetTitle, Title, ahk_id %this_ID% 
		;make sure title is not the notification
		If Title <> Microsoft Teams Notification 
		{
			;screen sharing win uses null title, make sure the win does not have a null title
			If Title <> 
			{
				WinActivate, ahk_id %this_ID%
				if (keyCombo=0) {
					Send, ^+M  
				}
				if (keyCombo=1) {					
					Send, ^+O  
				}
				break
			}
		}
	}
}




