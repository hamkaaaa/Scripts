;Variables
timeline1 = 0x202020 ;Timeline Colour
timeline2 = 0x313131 ;Timeline Colour
timeline3 = 0x1B1B1B ;Timeline Colour
timeline4 = 0x414141 ;Timeline Colour
timeline5 = 0x212121 ;Timeline Colour
timeline6 = 0x262626 ;Timeline Colour

class1 = Edit1 ;Text Box Class
class2 = Edit3 ;Text Box Class
class3 = Edit2 ;Text Box Class
class4 = DroverLord - Window Class21 ;Text Box Class
class5 = Edit4 ;Text Box Class
class6 = Edit8 ;Text Box Class

; Mengatur mode koordinat relatif terhadap layar penuh agar klik tidak meleset
CoordMode, Mouse, Screen
CoordMode, Pixel, Screen

F1::
IfWinNotExist, ahk_class Premiere Pro
	Run, Adobe Premiere Pro.exe
WinActivate ahk_class Premiere Pro
return
;Focus on Premiere window.
;DONE

F2::
IfWinNotExist ahk_class Photoshop
	Run Photoshop.exe
WinActivate ahk_class Photoshop
return
;Focus on Photoshop window.
;DONE

F3::
IfWinNotExist ahk_class Adobe Audition CC.exe
	Run Adobe Audition CC.exe
WinActivate ahk_class Adobe Audition CC.exe
return
;Focus on Audition window.
;DONE

F4::
IfWinNotExist ahk_class Clover_WidgetWin_0
	Run Clover.exe
WinActivate ahk_class Clover_WidgetWin_0
return
;Focus on Clover (Explorer) window.
;DONE

F5::
WinActivate ahk_class Chrome_WidgetWin_1
return
;Focus on Firefox window.
;DONE

#MaxHotkeysPerInterval 1000
#Include RapidHotKey.ahk
#IfWinActive ahk_exe Adobe Premiere Pro.exe
;ANYTHING BELOW THIS POINT WILL ONLY WORK INSIDE OF PREMIERE PRO

;Common modifier keys used in AHK:
; Alt = !
; Shift = +
; Ctrl = ^
; Windows Key = #


;TIMELINE HOTKEYS
q::Send {NumpadMult}{NumpadDiv}
;Ripple delete clip at playhead.
;DONE

!q::Send {NumpadMult}e
;Delete clip at playhead.
;DONE

^+1::Send, ^+g-8{Enter}
;Default audio gain adjustment for intro.
;DONE

v::Send b100.1{Enter}
;Change clip speed to 100.1%.
;DONE

c::Send b200{Enter}
;Change clip speed to 200%.
;DONE

z::
BlockInput, SendAndMouse ;---------------------------Sets the inputs to block (Mouse and Keyboard)
BlockInput On ;--------------------------------------Blocks user input defined by the previous statement
SetKeyDelay, 0 ;-------------------------------------Sets delay between keypresses as variable 0
MouseGetPos, xpos, ypos ;----------------------------Obtains current mouse position and stores it as variable xpos and variable ypos (x and y coordinates)
GoSub, +3 ;------------------------------------------Calls upon the Title Selector hotkey
MouseMove, 1113, 152, 0 ;--------Moves cursor to position x,y
MouseClick, Left, , , 1 ;----------------------------Left clicks the mouse once at selected point
MouseMove, 110, 209, 0 ;---------Moves cursor to position x,y
MouseClick, Left, , , 1 ;----------------------------Left clicks the mouse once at selected point
Send, ^+{/} ;----------------------------------------Sends keyboard shortcut bound in Premiere to duplicating a clip
MouseMove, xpos, ypos, 0 ;------Moves cursor back to original position xpos, ypos
BlockInput, Off ;------------------------------------Re-enables input from user
return
;Title Creator
;DONE


;PANEL NAVIGATION/SHORTCUTS
+1::
BlockInput, SendAndMouse ;---------------------------Selects the inputs to block.
BlockInput, On ;-------------------------------------Blocks input from the user.
SetKeyDelay, 0 ;-------------------------------------Makes key presses have 0 delay.
MouseGetPos, xpos, ypos ;----------------------------Stores current co-ordinates of mouse position as variables x and y.
MouseMove, 16, 732, 0 ;------------------------------Moves cursor to effects panel.
MouseClick, Left, , , 1 ;----------------------------Selects the effects panel.
Send, {BackSpace} ;----------------------------------Deletes text in textbox
MouseMove, xpos, ypos, 0 ;---------------------------Sends mouse back to original co-ordinates.
Suspend, On ;----------------------------------------Suspends the script to prevent problems with hotkey activation
return
;Highlights the effects panel and clears text in the search bar.
;DONE

+2::
BlockInput, SendAndMouse ;---------------------------Selects the inputs to block.
BlockInput, On ;-------------------------------------Blocks input from the user.
SetKeyDelay, 0 ;-------------------------------------Makes key presses have 0 delay.
MouseGetPos, xpos, ypos ;----------------------------Stores current co-ordinates of mouse position as variables x and y.
MouseMove, 69, 69, 0 ;-------------------------------Moves cursor to Commonly Used Bin.
MouseClick, Left, , , 1 ;----------------------------Selects the Commonly Used Bin.
MouseMove, xpos, ypos, 0 ;---------------------------Sends mouse back to original co-ordinates.
return
;Selects the Commonly Used bin.
;DONE

+3::
BlockInput, SendAndMouse ;---------------------------Selects the inputs to block.
BlockInput, On ;-------------------------------------Blocks input from the user.
SetKeyDelay, 0 ;-------------------------------------Makes key presses have 0 delay.
MouseGetPos, xpos, ypos ;----------------------------Stores current co-ordinates of mouse position as variables x and y.
MouseMove, 209, 69, 0 ;------------------------------Moves cursor to Text Bin.
MouseClick, Left, , , 1 ;----------------------------Selects the Commonly Used Bin.
MouseMove, xpos, ypos, 0 ;---------------------------Sends mouse back to original co-ordinates.
return
;Selects the Text bin.
;DONE

+4::
BlockInput, SendAndMouse ;---------------------------Selects the inputs to block.
BlockInput, On ;-------------------------------------Blocks input from the user.
SetKeyDelay, 0 ;-------------------------------------Makes key presses have 0 delay.
MouseGetPos, xpos, ypos ;----------------------------Stores current co-ordinates of mouse position as variables x and y.
MouseMove, 337, 69, 0 ;------------------------------Moves cursor to Text Bin.
MouseClick, Left, , , 1 ;----------------------------Selects the Commonly Used Bin.
MouseMove, xpos, ypos, 0 ;---------------------------Sends mouse back to original co-ordinates.
return
;Selects the Secondary Timeline.
;DONE

;APPLYING EFFECTS
u::
BlockInput, SendAndMouse ;---------------------------Selects the inputs to block.
BlockInput, On ;-------------------------------------Blocks input fro the user.
SetKeyDelay, 0 ;-------------------------------------Makes key presses have 0 delay.
MouseGetPos, xpos, ypos ;----------------------------Stores current co-ordinates of mouse position as variables x and y.
MouseMove, 16, 732, 0 ;------------------------------Moves cursor to effects panel.
MouseClick, Left, , , 1 ;----------------------------Selects the effects panel.
Send, {BackSpace} ;----------------------------------Deletes text in textbox
Send, crop ;-----------------------------------------Searches for the crop effect.
MouseMove, 94, 880, 0 ;------------------------------Moves cursor ontop of the crop effect.
MouseClick, Left, , , 2 ;----------------------------Double left clicks to apply to the clip selected.
MouseMove, xpos, ypos, 0 ;---------------------------Moves mouse back to original position x and y.
BlockInput, off ;------------------------------------Re-enables user input.
return
;Applies the crop effect.
;DONE

i::
BlockInput, SendAndMouse ;---------------------------Selects the inputs to block.
BlockInput, On ;-------------------------------------Blocks input from the user.
SetKeyDelay, 0 ;-------------------------------------Makes key presses have 0 delay.
MouseGetPos, xpos, ypos ;----------------------------Stores current co-ordinates of mouse position as variables x and y.
MouseMove, 16, 732, 0 ;------------------------------Moves cursor to effects panel.
MouseClick, Left, , , 1 ;----------------------------Selects the effects panel.
Send, {BackSpace} ;----------------------------------Deletes text in textbox
SendInput, {BS}three ;-------------------------------Clears effects search bar and inputs effect.
MouseMove, 106, 878, 0 ;-----------------------------Moves mouse cursor to select the effect.
MouseClick, Left, , , 2 ;----------------------------Double clicks effect to apply it to the clip.
MouseMove, xpos, ypos, 0 ;---------------------------Returns the mouse to original position.
BlockInput, off ;------------------------------------Re-enables user input.
return
;Apply three way colour corrector to selected clip.
;DONE

o::
BlockInput, SendAndMouse ;---------------------------Selects the inputs to block.
BlockInput, On ;-------------------------------------Blocks input from the user.
SetKeyDelay, 0 ;-------------------------------------Makes key presses have 0 delay.
MouseGetPos, xpos, ypos ;----------------------------Stores current co-ordinates of mouse position as variables x and y.
MouseMove, 16, 732, 0 ;------------------------------Moves cursor to effects panel.
MouseClick, Left, , , 1 ;----------------------------Selects the effects panel.
Send, {BackSpace} ;----------------------------------Deletes text in textbox
SendInput, {BS}Color Key ;---------------------------Clears effects search bar and inputs effect.
MouseMove, 106, 878, 0 ;-----------------------------Moves mouse cursor to select the effect.
MouseClick, Left, , , 2 ;----------------------------Double clicks effect to apply it to the clip.
MouseMove, xpos, ypos, 0 ;---------------------------Returns the mouse to original position.
BlockInput, off ;------------------------------------Re-enables user input.
return
;Apply colour key effect (for getting rid of greenscreens) to selected clip.
;DONE

p::
BlockInput, SendAndMouse ;---------------------------Selects the inputs to block.
BlockInput, On ;-------------------------------------Blocks input from the user.
SetKeyDelay, 0 ;-------------------------------------Makes key presses have 0 delay.
MouseGetPos, xpos, ypos ;----------------------------Stores current co-ordinates of mouse position as variables x and y.
MouseMove, 16, 732, 0 ;------------------------------Moves cursor to effects panel.
MouseClick, Left, , , 1 ;----------------------------Selects the effects panel.
Send, {BackSpace} ;----------------------------------Deletes text in textbox
SendInput, {BS}gaussian ;----------------------------Clears effects search bar and inputs effect.
MouseMove, 106, 958, 0 ;-----------------------------Moves mouse cursor to select the effect.
MouseClick, Left, , , 2 ;----------------------------Double clicks effect to apply it to the clip.
MouseMove, xpos, ypos, 0 ;---------------------------Returns the mouse to original position.
BlockInput, off ;------------------------------------Re-enables user input.
return
;Apply gaussian blur effect to selected clip.
;DONE


;MISC HOTKEYS
F7::
BlockInput, SendAndMouse
BlockInput, On
SetKeyDelay, 0
MouseGetPos, xpos, ypos
MouseMove, -1872, 636, 0
Click, Left
MouseMove, xpos, ypos, 0
BlockInput, Off
return
;Enables scale keyframes.
;DONE

F8::
BlockInput, SendAndMouse
BlockInput, On
SetKeyDelay, 0
MouseGetPos, xpos, ypos
MouseMove, -1594, 636, 0
Click, Left
MouseMove, xpos, ypos, 0
BlockInput, Off
return
;Insert Scale Keyframe.
;DONE

^1::
BlockInput, SendAndMouse
BlockInput, On
SetKeyDelay, 0
MousegetPos, xpos, ypos
MouseMove, 375, 755, 0
Click, Left
MouseMove, xpos, ypos, 0
BlockInput, Off
return
;Toggles snapping
;DONE


;TYPING MOD
LButton::
Suspend, Permit
MouseGetPos, xpos, ypos, , Class 
KeyWait, LButton, T0.07
if (Class = class1 || Class = class2 || Class = class3 || Class = class4 || Class = class5 || Class = class6)
{
	Suspend, On
	sendinput, {LButton}
	return
}
; FIXED: Changed || to &&
else if (ErrorLevel = 1) and (Class != class1 && Class != class2 && Class != class3 && Class != class4 && Class != class5 && Class != class6)
{
	Suspend, Off
	Send, {LButton down}
	KeyWait, LButton
	Send, {LButton}
	return
}
else
{
	Suspend, Off
	Send, {LButton}
}
return

;Scale Mod
$~`::RapidHotkey("scale""Xposition""Yposition""whatever", 1, 0.1, 1)

scale:
MouseGetPos, xpos, ypos
MouseMove, -1718, 638, 0
MouseClick, Left, , , 1, , D
loop {
	if GetKeyState("~`", "P") = 1
		goto endscale
}

Xposition:
MouseGetPos, xpos, ypos
MouseMove, -1716, 616, 0
MouseClick, Left, , , 1, , D
loop {
	if GetKeyState("~`", "P") = 1
		goto endscale
}

Yposition:
MouseGetPos, xpos, ypos
MouseMove, -1665, 616, 0
MouseClick, Left, , , 1, , D
loop {
	if GetKeyState("~`", "P") = 1
		goto endscale
}

endscale:
MouseClick, Left, , , 1, , U
MouseMove, xpos, ypos, 0
return

;Timeline Scrubbing Mod (COURTESY OF TARANVH)
RButton::
MouseGetPos, xpos, ypos 
PixelGetColor colour, %xpos%, %ypos%, RGB 

if (colour = timeline1 || colour = timeline2 || colour = timeline3 || colour = timeline4 || colour = timeline5 || colour = timeline6) 
{
	Send, ^+{a} 
	click middle 
	
	if GetKeyState("RButton", "P") = 1 
	{
		loop 
		{
			Send, +/ 
			if GetKeyState("RButton", "P") = 0 
			{
				break 
			}
		}
	}
	Send {escape} 
}
else 
{
	sendinput, {Rbutton} 
}
return
