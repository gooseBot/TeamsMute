; example1.nsi
;
; This script is perhaps one of the simplest NSIs you can make. All of the
; optional settings are left to their default settings. The installer simply 
; prompts the user asking them where to install, and drops a copy of example1.nsi
; there. 
;
; example2.nsi expands on this by adding a uninstaller and start menu shortcuts.

!include "LogicLib.nsh"
 
;--------------------------------

; The name of the installer
Name "Teams Mute Helper"

; The file to write
OutFile "TeamsMuteSetup.exe"

; Request application privileges for Windows Vista
RequestExecutionLevel user

; Build Unicode installer
Unicode True

; The default installation directory
InstallDir $DESKTOP\TeamsMuteHelper

;--------------------------------

; Pages

Page directory dirPre
Page instfiles

;--------------------------------

; The stuff to install
Section "" ;No components page, name is not important

  ; Kill existing teamsMute.exe or will get overwrite errors.
  ExecWait "TaskKill /IM TeamsMute.exe /F"
	
  ; Set output path to the installation directory.
  SetOutPath $INSTDIR
  
  ; Put file there
  File C:\Users\Eric\OneDrive\projects\TeamsMute\TeamsMute.exe
  
  ; Create shortcut in startup folder 
  CreateShortCut "$SMSTARTUP\TeamsMute.lnk" "$INSTDIR\TeamsMute.exe" ""
  
  ;startup autohotkey compiled script now so user doesnt have to start script manually. 
  Exec "$INSTDIR\TeamsMute.exe"
  
SectionEnd ; end the section

Function dirPre
	Abort
FunctionEnd
