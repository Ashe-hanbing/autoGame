[General]
SyntaxVersion=2
BeginHotkey=85
BeginHotkeyMod=6
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=ba42bebd-ccf2-4f5b-8577-a14a7388e69e
Description=Ç¿ÍË
Enable=1
AutoRun=0
[Repeat]
Type=0
Number=1
[SetupUI]
Type=2
QUI=
[Relative]
SetupOCXFile=
[Comment]

[Script]
Function exitX()
	
	KeyPressS 27,1
	Delay 1000
	
	//·µ»Ø´óÌü
	MoveToS 1204,928
	LeftClickS 1
	Delay 2000	
End Function

Call exitX()
