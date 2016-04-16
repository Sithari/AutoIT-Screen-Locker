#include <Misc.au3>

HotKeySet("!1", "program")
HotKeySet("!2", "sleepo")
HotKeySet("!3", "stop")
HotKeySet("^{up}", "volumeup")
HotKeySet("^{down}", "volumedown")
Func volumeup()
	send("{VOLUME_UP 2}")
EndFunc

Func volumedown()
	send("{VOLUME_down 2}")
EndFunc

AutoItSetOption("TrayIconHide", 1)
#comments-start
	$z=0
	$y = 0




	while $z <5
	$y = $y+1
	sleep(100)
	if $y=4 Then

	Send("{CAPSLOCK}")
	Send("{CAPSLOCK OFF}")
	$y = 0
	EndIf
	WEnd
#ce





Sleep(7200000) ;2 hour sleep
SoundPlay(@WindowsDir & "\media\Speech Sleep.wav")
Sleep(300000) ;5 minutes

program()

Func program()
	SoundPlay(@WindowsDir & "\media\Speech On.wav")

	Sleep(3000)

	$dll = DllOpen("user32.dll")

	$pos = MouseGetPos()

	;MsgBox(0, "Mouse x,y:", $pos[0] & "," & $pos[1])

	$x = 1
	$y = 0

	While $x > 0

		$pos2 = MouseGetPos()

		$y = $y + 1

		Sleep(100)
		If $y = 6 Then
			Opt("SendCapslockMode", 0)
			Send("{CAPSLOCK on}")
			Send("{LSHIFT}")
			Send("{RSHIFT}")
			Send("{CAPSLOCK off}")
			$y = 0
		EndIf

		;all buttons
		If $pos[0] <> $pos2[0] Or $pos[1] <> $pos2[1] Or _IsPressed("11", $dll) Or _IsPressed("2E", $dll) Or _IsPressed("25", $dll) Or _IsPressed("26", $dll) Or _IsPressed("27", $dll) Or _IsPressed("28", $dll) Or _IsPressed("5B", $dll) Or _IsPressed("0D", $dll) Then

			Run("rundll32.exe user32.dll,LockWorkStation")

			Sleep(30000)

			;sleep(7200000)

		EndIf


		#cs
			;Mouse y
			if $pos[1] <> $pos2[1]  Then

			;CTRL
			If _IsPressed("11", $dll) Then

			;Left Arrow
			If _IsPressed("25", $dll) Then

			;UP Arrow
			If _IsPressed("26", $dll) Then

			;Right Arrow
			If _IsPressed("27", $dll) Then

			;Down Arrow
			If _IsPressed("28", $dll) Then

			;Windows Key (Left)
			If _IsPressed("5B", $dll) Then

			;Enter Key
			If _IsPressed("0D", $dll) Then
		#ce


	WEnd
EndFunc   ;==>program


Func sleepo()
	SoundPlay(@WindowsDir & "\media\Speech Sleep.wav")


	Sleep(3600000) ;60 min sleep
	SoundPlay(@WindowsDir & "\media\Speech Sleep.wav")
	Sleep(300000) ;5 minutes
	SoundPlay(@WindowsDir & "\media\Speech Sleep.wav")
	Sleep(10000)

	program()

EndFunc   ;==>sleepo

Func stop()
	SoundPlay(@WindowsDir & "\media\Speech Off.wav", 1)
	Exit 0
EndFunc   ;==>stop


;COLOR
;$var = PixelGetColor( $pos[0] , $pos[1] )
;MsgBox(0,"The hex color is", $var)
