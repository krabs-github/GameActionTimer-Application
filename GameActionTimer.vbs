Dim Arg, counter, objFso, strSourcePath, strDestPath
Set Arg = WScript.Arguments

Dim oShell
counter = arg(1)
Set oShell = CreateObject( "WScript.Shell" )
vAppData = oShell.ExpandEnvironmentStrings("%APPDATA%")

While counter > 0
  Dim fso
  Set fso = WScript.CreateObject("Scripting.Filesystemobject")
	Set f = fso.OpenTextFile(vAppData & "\Elgato\StreamDeck\Plugins\com.krabs.gameactiontimer.sdPlugin\resources\timers\" & arg(0) & ".timer", 2, True)
	If counter > 60 then
			vSeconds = FormatNumber(counter, 0)
			vMinutes = counter \ 60
			vMinutes = vMinutes mod 60
			vSeconds = vSeconds mod 60
			vSeconds = RIGHT("00" & vSeconds, 2)
  			f.WriteLine vMinutes & ":" & vSeconds
		else
			vSeconds = counter
  			f.WriteLine vSeconds
	End If
  	f.Close
 	  WScript.Sleep 1000
  	counter = counter-1
Wend

Set f = fso.OpenTextFile(vAppData & "\Elgato\StreamDeck\Plugins\com.krabs.gameactiontimer.sdPlugin\resources\timers\" & arg(0) & ".timer", 2)
f.WriteLine "Ready"
f.Close

WScript.Quit
