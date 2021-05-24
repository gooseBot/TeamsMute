#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^+2::Mute()
^+1::Video()

Mute() {
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
				;This should be the correct win, activate it
				WinActivate, ahk_id %this_ID% 
				;send ctrl,shift,m shortcut
				Send, ^+M 
				;There are two teams windows, the main win and the meeting win, break the loop so that the mute commmand doesnt get sent twice
				break 
			}
		}
	}
}

Video() {
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
				;This should be the correct win, activate it
				WinActivate, ahk_id %this_ID% 
				;send ctrl,shift,m shortcut
				Send, ^+O 
				;There are two teams windows, the main win and the meeting win, break the loop so that the mute commmand doesnt get sent twice
				break 
			}
		}
	}
}