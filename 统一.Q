[General]
SyntaxVersion=2
BeginHotkey=77
BeginHotkeyMod=6
PauseHotkey=0
PauseHotkeyMod=0
StopHotkey=123
StopHotkeyMod=0
RunOnce=1
EnableWindow=
MacroID=73698ae1-8827-48ba-a57d-2a8ea93453a3
Description=统一
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
Function S(sec)
	KeyDownS "S", 1
	Delay sec*1000
	KeyUpS "S",1
End Function

Function W(sec)
	KeyDownS "W", 1
	Delay sec*1000
	KeyUpS "W",1
End Function

Function A(sec)
	KeyDownS "A", 1
	Delay sec*1000
	KeyUpS "A",1
End Function

Function D(sec)
	KeyDownS "D", 1
	Delay sec*1000
	KeyUpS "D",1
End Function

Function E()
	For i = 1 To 5
		KeyPressS "E",1
	Next
End Function

Function R()
	KeyDownS "R", 1
	Delay 6400
	KeyUpS "R",1
End Function

Function turnL()
	MoveRS -1500,0
End Function

Function turnR()
	MoveRS 1500,0
End Function

Function turn(angle)
	MoveRS angle,0	
End Function

Function 枪
	KeyPressS "1", 5
	Delay 1500
End Function

Function 手枪()
	KeyPressS "2", 5
	Delay 1500
End Function

Function 刀()
	KeyPressS "3", 5
	Delay 1500
End Function

Function 大跳()
	Delay 200
	For i = 1 To 3
		MouseWheel 300
	Next
	Delay 2000
End Function

Function 龙骑兵()
	For i = 1 To 5
		KeyPressS "c", 1	
	Next  	
End Function

Function 空间(x,y,sec)
	MoveRS x, y
	LeftDownS 1
	Delay 1000 * sec
	LeftUpS 1
	MoveRS -1*x,-1*y
End Function

Function boss(sec)

    LeftDownS 1
	For i = 1 To sec
		Call 龙骑兵()
		Delay 1000
		Call E()
	Next
	LeftUpS 1
End Function

Function 灵兽(x,y,sec)
	MoveRS x, y
	RightDownS 1
	Delay 1000 * sec
	RightUpS 1
	MoveRS -1*x,-1*y
End Function

Function exitX()
	
	KeyPressS 27,1
	Delay 1000
	
	//返回大厅
	MoveToS 1204,928
	LeftClickS 1
	Delay 2000	
End Function

Function showTime()
	time = Plugin.Sys.GetDateTime()
	TracePrint "您的操作系统日期和时间：" & time
End Function

Function 工业1()
	LeftClickS 5
	
	//	1/3
	Call D(0.4)
	Call S(0.6)
	Call A(1.5)

	
	Call 手枪()
	
	Call 灵兽(100,0,42)

	Call W(2.75)
	Call D(2)
	Call turnR()
	Call D(1.4)

	// 2/3 破红门
	LeftClickS 3
	Delay 400
	
	Call W(1)
	Call D(1.55)
	Call W(1.3)
	Call D(0.5)
	Call W(1.4)
	Call turnL()
	
	MoveRS 0,-290
	Call turn(-650)
	RightDownS 1
	Delay 30000
	
	Call turn(650)
	MoveRS 0,290
	Delay 34000
	RightUpS 1


	// 2/3结束,准备打boss
	Call W(2)
	Call D(1)
	KeyPressS "F",1
	Call W(3.5)
	Call S(0.4)
	Call D(3)
	Call turnR()
	Call D(1)
	Call A(0.35)
	
	
	Call 枪()
	
	Call fire2(0.4, 0)
	
	Delay 200

	MoveRS - 920 , - 400 
	Call 空间(0,0,4)
	
	Call boss(18)
	
	Delay 30 * 1000
	Call exitX()
	
End Function

Function 工业7()
	LeftClickS 1
	
	Call S(0.8)
	Call D(1.4)

		
	
	Call W(1.5)
	Call D(1.1)	//最右下角
	
	Call W(2.5)
	Call A(0.8)
	Call S(0.4)
	Call A(1.15)
	Call W(0.4)
	Call turnL()
	Call turnL()
	

	Delay 300
	For i = 1 To 3
		MouseWheel 100
		Delay 200
	Next
	
	Delay 3000
	Call turnR()
	Call turnR()
	
	Delay 500
	
	MoveRS 0, 136//压枪
	Delay 500


	//跳跃完毕
	Call 手枪()
	Call 灵兽(0,0,28)
	Call 枪()
	Call 空间(-20,-130,6)
	Call 手枪()
	
	
	Call 灵兽(0, 0, 125)
	Delay 1000
	Call R()
	Delay 300
	Call 枪()
	MoveRS 0,-100
	MoveRS 903, 650
	Call W(0.07)
	
	Call boss(60)
	
	Delay 30 * 1000
	Call exitX()
End Function

Function 工业3()

	LeftClickS 5

	For i = 1 To 5
		Call S(0.25)
		Call A(0.1)	
	Next
	
	Call D(0.3)
	Call W(6)
	Call turnL()
	
	Call W(1.5)

	

	// 蹲墙角杀
	KeyDownS "shift",1	
	For i = 1 To 10
		Call 空间(- 150 , 0, 2)
		Delay 1000
	Next
	KeyUpS "shift", 1

	Call A(0.4)
	

	
	//前往红门
	Call 刀()
	Call W(8.7)
	Call A(2.5)
	Call W(2.5)
	Call D(1)
	Call 枪()
	Call turnR()
	Call turnR()
		
	Call 空间(50, 0, 18)
	Call 手枪()
	Call 灵兽(150, 0, 10)
	
	// 开红门,大跳前进
	Call W(2)
	Call turnR()
	
	Call W(2.5)
	Call D(2)
	Call A(0.2)
	Call 刀()
	LeftClickS 1
	Delay 300
	Call W(7.5)
	
	Call 枪()
	KeyDownS "shift",1
	Call turnL()
	For i = 1 To 4
		Call turnL()
		Call 空间(0,0,3.5)
	
		Call turnR()
		Call 空间(-150,0,3.5)
	Next
	
	Call 手枪()
	
	KeyUpS "shift", 2
	
	//前往最后一道红门
	Call A(0.3)	
	Call W(6)
	
	Call A(5)
	
	Call W(1)
	Call D(1.2)
	Call A(0.4)
	Call W(4)
	
	
	
	Call turnR()
	Call turnR()

	
	Call 枪()
	
	KeyDownS "shift",1
	Call 空间(0 , 0, 45)
	KeyUpS "shift",1
	
	Call R()

	//转身开门
	Call turnR()
	Call turnR()
	Call 手枪()

	LeftClickS 1
	Delay 1300
	
	
	Call turnL()
	Call turnL()
	
	Call 灵兽(0, - 500 ,1)
	
	Call 枪()
	
	MoveRS -200,0
	Call boss(20)
	
	Delay 30 * 1000
	Call exitX()
	
End Function

Function 空间W(sec)
	LeftDownS 1
	Call W(sec)
	LeftUpS 2
End Function

Function 工业2()
	LeftClickS 5
	
	Call S(0.3)
	Call D(3)
	Call A(0.5)
	
	
	
    Call 空间W(3)
    Call W(6)
    
	Call turnL()
	Call turnL()
	Call A(0.5)
	Call 枪()
	For i = 1 To 4
		Call 空间(0, 0, 5)
		Delay 1000
	Next
	Call 空间(1000, 0, 4)
	Delay 3000
	Call 空间(0, 0, 3)
	Delay 3000
	Call 空间(0, 0, 3)
	
	Call turnR()
	Call turnR()
	
	
	//第一个红门
	
	Call A(1)
	For i = 1 To 10
		Call 空间(0, 0, 1.5)
		Delay 500
	Next
	Delay 3000
	
	For i = 1 To 3
		Call 空间(0, 0, 1.5)
		Delay 500
	Next
	
	
	Call W(4.5)
	Call A(2.3)
	Call W(5.2)
	Call A(1)
	Call turnL()
	Call turnL()
	
	MoveRS -150,0
	For i = 1 To 15
		Call 空间(0, 0, 1.5)
		Delay 500
	Next
	MoveRS 150, 0
	
	//第二个红门
	
	Call turnR()
	Call turnR()
	Call W(1)
	Delay 1000
	LeftClickS 3
	Delay 300
	Call W(2.5)
	Call turnR()
		
	MoveRS 0, - 275 
	Call boss(50)
	Call R()
	Call boss(50)
	Call exitX()
End Function


Function 沙漠2()
	For i = 1 To 5
		LeftClickS 1
		Delay 50
	Next

	
	
	Call W(15)
	KeyPressS "B", 1
	Delay 1500
	KeyPressS "2", 1
	Delay 1000
	
	Call W(10)
	
	
	MoveRS -35,  -30 
	
	
	KeyDownS "A", 1
	KeyDownS "W", 1
	Delay 35 * 1000
	For i = 1 To 60
		KeyPressS "G", 1
		LeftClickS 1
		Delay 3000
	Next
	KeyUpS "A", 1
	KeyUpS "W", 1
	
	Call exitX()
End Function

Function boot()
	path = "C:\autoGame\link.txt" 
	fileHandle=Plugin.File.OpenFile(path) 
	fileline=Plugin.File.ReadLine(fileHandle) 
	Call Plugin.File.CloseFile(fileHandle) 
	
	
	If 1=fileline Then
		Call 工业1()
	ElseIf 2=fileline Then
		Call 工业2()
	ElseIf 3=fileline Then
		Call 工业3()
	ElseIf 7=fileline Then
		Call 工业7()
	ElseIf 42=fileline Then
		Call 沙漠2()
	End If
End Function


Call boot()
//
//Call showTime()
//Call 工业1()
//Call showTime()
