﻿st:= a_tickcount
#NoEnv		;;__winc3_Pi3;;_-WinS_pi_(M)_-_Window-Info-Tool__::
;#MaxMem	640	;;__fork3d_n_bork3d_by_M.Wolff__2020__-__2022_-__::
#notrayicon
#KeyHistory	0
#SingleInstance,Off
#include <Open_Containing>
;#include <GDI+_All>
#include C:\Script\AHK\- _ _ LiB\Aero_Lib.ahk
#Include C:\Script\AHK\- _ _ LiB\GDI+_All.ahk
detectHiddenText,On
setTitleMatchMode,2
detectHiddenWindows,On
setTitleMatchMode,Slow
coordMode,Pixel,Screen
coordMode,mouse,Screen
coordMode,ToolTip,Screen ;uiband_set(spyy)
Setworkingdir,% (aHkeXe:= splitpath(A_AhkPath)).dir
AppName:= "Win-P5y-Ch0515", Alien:= "C:\Icon\256\8ee.ico"
if(!(r_pid:= isSingleton())) {
	msgbox % "singleton!"
	exitapp,
} setWorkingDir,% A_ScriptDir
(ResDir:= A_ScriptDir . "\Resources")
listlines,Off
setControlDelay,-1
setBatchLines,	-1
setWinDelay,	-1
global G_SPY_W:= 541, G_SPY_H:= 725, g_Topmost:= True, ResDir:= A_ScriptDir . "\Resources"
, Tab_Y_init:= Tab_Y:= 73 ;primary-tabcontrol-Yord;
, hSmIcon:= LoadPicture("C:\Icon\24\winspy_24.ico","w24 Icon" . Index,ErrorLevel)
, hLgIcon:= LoadPicture("C:\Icon\48_24\WINSPY48_24.ico","w48 Icon" . Index,ErrorLevel)
loop,parse,% "INI_Read>Menuz>menu_init>Varz>reg_read>SPY>animatestartup>sethookmenu>OnMsgZ",% ">"
	 gosub,% a_loopField
gosub,setExplorerTheme ;tt("Started in " a_tickcount-st " ms")	; exStyleSet(hSpyWnd,"+0x02000000")
return,

Animatestartup:
gosub,checkchecks
controlget,htabbody,hwnd,,#327701,ahk_id %hspywnd%
win_move(htabbody,"",tab_y+26,"",""), StyleSet(hSpyWnd,"+0x80000000")
AnimateShow(hSpyWnd) ;%hTab%;winset,style,+0x8000,ahk_id %hTab% ;loop 2 {
	exStyleSet(htab,"+0x02000000")
 winset,redraw,,ahk_id %hspywnd%
; winset,redraw,,ahk_id %tabbody%
 winset,redraw,,ahk_id %htab%
, WinAnimate(img["Banner2"].hpic,"activate center",100)
, WinAnimate(img["Banner1"].hpic,"activate center",250), WinAnimate(img["Banner1"].hpic,"hide center",90)
, WinAnimate(img["Banner2"].hpic,"hide center",50), WinAnimate(img["Banner2"].hpic,"activate center",70)
, WinAnimate(img["Banner1"].hpic,"hide center",250), ;}settimer,showSyringe,-2;
, WinAnimate(img["Banner3"].hpic,"activate center",250) ;}settimer,showSyringe,-2;
  guicontrol,hide,% img["Banner3"].hpic
  WinAnimate(img["Banner1"].hpic,"activate center",300)
; WinAnimate(hTab3,"activate center",250);loop 10 ;{
; WinAnimate((t1t%a_index% ),"activate center",80) ;}
, WinAnimate(img["CloseButt2"].hpic,"hide center",100)
; winset,RedRaw,,ahk_id %htab%
; winset,RedRaw,,ahk_id %tabbody%
; Toolbar1update(1)

return,

OnMsgz:
	OnExit("exitfunc")
;	OnMessage(0x202,"OnWM_LBUTTDBL")
;	OnMessage(0x88,"RedRaww")
	OnMessage(43,"RedRaww")
	; OnMessage(0xa2,"WM_ncLBu")
	OnMessage(0x201,"WM_LBD")
	OnMessage(0x204,"OnWM_RBUTTONDOWN")
	OnMessage(0x205,"OnWM_RBUTTUP")
	OnMessage(0x404,"WM_TRAYMEN")
	OnMessage(0x112,"OnWM_SYSCMD")
	OnMessage(0x100,"OnWM_KEYDOWN")
	OnMessage(0x02A2,"pointerleave")
	OnMessage(0x02A3,"pointerleave")
	OnMessage(0x024a,"pointerleave")
	OnMessage(0x200,"OnWM_MOUSEMOVE")
	OnMessage(0x202,"OnWM_LBUTTONUP")
	OnMessage(0xa0,"OnWM_NCMOUSEMOVE")
	OnMessage(0x215,"WM_CAPTURECHANGED")
	OnMessage(0x04a,"Receive_WM_COPYDATA")
; ,	OnMessage(0x2E0,"WM_DPICHANGED") ;WM_DPICHANGED
; ,	OnMessage(0x01A,"WM_DPICHANGED") ;WM_WININICHANGE 0x1A
; ,	OnMessage(0x320,"WM_DPICHANGED") ;WM_DWMCOLORIZATIONCOLORCHANGED
; ,	OnMessage(0x31E,"WM_DPICHANGED") ;WM_DWMCOMPOSITIONCHANGED
; ,	OnMessage(0x31A,"WM_DPICHANGED") ;WM_THEMECHANGED
; ,	OnMessage(0x07E,"WM_DPICHANGED") ;WM_DISPLAYCHANGE
; ,	OnMessage(0x07D,"WM_DPICHANGED") ;WM_STYLECHANGED
; ,	OnMessage(0x054,"WM_DPICHANGED") ;WM_USERCHANGED
;	OnMessage(0x0006,"wm_activate")
	OnMessage(0x015,"WM_DPICHANGED") ;WM_SYSCOLORCHANGE seems to be  cause of relog gfx issue banner2
	OnMessage(0x0232,"wm_moveend")
	OnMessage(0x22F,"wm_moveend")
	OnMessage(0x0231,"EnterSizeMove")
	OnMessage(0x0070,"EnterSizeMove")
	OnMessage(0x0005,"EnterSizeMove")
	OnMessage(0x0003,"wm_move")
	; OnMessage(0x216,"WM_MOVING")
	OnMessage(0x0006,"wm_activate")
return,
WM_PAINT(wParam="", lParam="", msg="", hwnd="") {
	global ; global pImage, nW, nH
	static hthemedata
	Critical 500
	if(A_Gui!=1)
		return, ; gay:="CompositedWindow::Window":()
	text2:=true, gay:= "ControlPanelStyle",	HHDC:=CreateCompatibleDC()
	VarSetCapacity(PaintStruct,a_ptrsize=8? 72:64), VarSetCapacity(Paintparams,24)
	, NumPut(24,Paintparams,0,"uint"), VarSetCapacity(dttopts,(a_ptrsize=8? 72:64,0)) ;dwSize
	, NumPut(a_ptrsize=8? 72:64,dttopts,0,"uint") ;dwSize 
	, NumPut(8192,dttopts,4,"uint"), NumPut(24,dttopts,52,"int") ;DTT_TEXTCOLOR-0X14 DTT_COMPOSITED-0XD DTT_GLOWSIZE-0XB iGlowSize-12 ;NumPut(12, dttopts,55,"uint");crazy glitch;NumPut(10241,dttopts,8,"uint");UxTheme_BeginBufferedPaint(HDC,&client_rect2,2,&Paintparams,&hHDC) 
	, hthemedata:= DllCall("uxtheme\OpenThemeData","uint",hgui,"uint",&gay)
	, HDC:= DllCall("BeginPaint","uint",hgui,"uint",&PaintStruct)
	, DllCall("uxtheme\BeginBufferedPaint","Ptr",HDC,"Ptr",&client_rect2,"uInt",2,"Ptr",pPaintParams,"uInt*",&hHDC)
	, bgb:= "i love niggers" ;DllCall("DrawText","UPtr",HDC,"UPtr",&bgb,"Int",-1,"UPtr",&client_rect,"UInt",0)
	 text1? e:= DllCall("DrawText","UPtr",HDC,"UPtr",&bgb,"Int",-1,"UPtr",&client_rect,"UInt",0)
	:text2? e:= DllCall("uxtheme\DrawThemeTextEx","uint",hthemedata,"uint",HDC,"int",0,"int",0,"uint"
	, &bgb,"int",-1,"int",0,"int",&client_rect2,"uint",&dttopts)
	,DllCall("EndPaint","uint",hgui,"uint",&PaintStruct), Gdi_DeleteDC(HDC),Gdi_DeleteDC(HHDC)
}

; WM_ncLBu() {
	; tt("WM_ncLBu ")
; }

wm_activate(wParam="",lParam="",wmsg="",hwndd="") {
	global ;if (hwndd=hSettingsDlg) ; msgbox
	if(hwndd!=hspywnd)
		return,
	gui,APCBackMain:+lastfound ;if(!g_Topmost)gui,APCBackMain:-alwaysontop
	winactivate,ahk_id %hspywnd%
	loop,parse,% "htreewnd,hspywnd,hxywh,hSettingsDlg",`,
	{
		gk:= %a_loopField%
		winset,top,,ahk_id %gk%
	}
}

EnterSizeMove(wParam="") {
	global
	; SubWin_VisibleCount:= 0
	; if(IsWindowVisible(hTreeWnd)) {
		; winset,top,,ahk_id %hTreeWnd%
		; SubWin_VisibleCount++
	; } if(IsWindowVisible(hFindDlg)||g_findgui_isopen) {
		; winset,top,,ahk_id %hFindDlg%
		; SubWin_VisibleCount++
	; } if(IsWindowVisible(hScrollInfo)) {
		; winset,top,,ahk_id %hScrollInfo%
		; SubWin_VisibleCount++
	; } if(IsWindowVisible(hSettingsDlg)) {
		; winset,top,,ahk_id %hSettingsDlg%
		; SubWin_VisibleCount++
	; } if(IsWindowVisible(hxywh)) {
		; winset,top,,ahk_id %hxywh%
		; SubWin_VisibleCount++
	; } ;if(SubWin_VisibleCount>1)
	;loop,parse,% "hxywh,hSettingsDlg,hScrollInfo,hFindDlg,hTreeWnd",`,
	;	winset,top,,% "ahk_id " %a_loopField%
	return,SecondaryMoving()
}
;WM_MOVING() {
;global
		;if(getkeystate("lbutton","L")){
			;if(getkeystate("lbutton","P"))
				;tt("lbutton P`nmoving1: " moving "`nmoving2: " moving2 )
				;} ;else,tt("lbutton L`nmoving1: " moving "`nmoving2: " moving2 )

;if(getkeystate("rbutton"))
;			tt("rbutton ")
;
;else,tt("WM_MOVING 0x216 534")
;}

wm_move(){
	global
	if(!moving&&!moving2)
		if((!(getkeystate("rbutton","P")))&&(!(getkeystate("lbutton","P")))) { 
		moving:=moving2:=false
		send,{blind}{lbutton up}
			PostMessage,0xA2,2,,,ahk_id %hspywnd% ;
			return,
	}
	if moving2 {
		if(!getkeystate("rbutton","p")) {
			send,{blind}{lbutton up}
			moving2:=false
			PostMessage,0xA2,2,,,ahk_id %hspywnd% ; WM_NCLBUTTONDOWN
		}
	} else,if(getkeystate("rbutton","p"))
		moving2:=true
		;else ,
	
	return, ;((!SubWin_VisibleCount||SubWin_VisibleCount="arse") ?	EnterSizeMove():(SubWin_VisibleCount>1)?tt("deferwindowpos"))
	return,EnterSizeMove()

}

wm_moveend() {
	global ;palmovtrig, Palactive ;if(!Palactive)winset,transparent,240,ahk_id %hpal%
	SubWin_VisibleCount:="arse" ;tt("moveend")
	return, ;moved(), palmovtrig:= False
}

WM_CAPTURECHANGED() {
	settimer,CurCheck,-100
}

WM_DPICHANGED() {
	global
	settimer,RedRaw,-3000
}

DWMCompTogl: ;wip
if(g_dwmcomposition:=!g_dwmcomposition) { ; #2: Disable DWM rendering of the window's frame.
	DllCall("dwmapi\DwmSetWindowAttribute", "ptr", WinExist("Window Title")
	, "uint", DWMWA_NCRENDERING_POLICY := 2, "int*", DWMNCRP_DISABLED := 1, "uint", 4)
	guicontrol,,% hdwmchk ,1
} else { ; To undo it (this might also cause any set region to be ignored):
	DllCall("dwmapi\DwmSetWindowAttribute", "ptr", WinExist("Window Title")
	, "uint", DWMWA_NCRENDERING_POLICY := 2, "int*", DWMNCRP_ENABLED := 2, "uint", 4)
	guicontrol,,% hdwmchk,0 ; To undo it (this might also cause any set region to be ignored):
} DllCall("dwmapi\DwmSetWindowAttribute","ptr",WinExist("Window Title"),"uint",DWMWA_NCRENDERING_POLICY:= 2,"int*",DWMNCRP_ENABLED:= 2,"uint",4)
return,

RegionSet: ;wip
return,
#if winactive("ahk_id " hspywnd)
#r:: 
RedRaw:
winset,RedRaw,,ahk_id %hSpyWnd%
;winset,RedRaw,,% "ahk_id " img["Banner2"].hpic
;winset,RedRaw,,% "ahk_id " img["Banner1"].hpic
WinAnimate(p2pwnd,"hide center",40)
WinAnimate(p1pwnd,"hide center",40)
WinAnimate(p2pwnd,"activate center",40)
WinAnimate(p1pwnd,"activate center",40)
winshow,% "ahk_id " p2pwnd
winshow,% "ahk_id " p1pwnd
;winset,RedRaw,,% "ahk_id " p2pwnd
;winset,RedRaw,,% "ahk_id " p1pwnd

settimer,curcheck,-100
tt("RedRaw Triggered")
return,
#if
Spy: ;Main Window;
TabHeightSlider:=29
	gtop:= g_Topmost? " +alwaysontop " : ""
	gui,Spy:New,-dpiscale +hWndhSpyWnd +toolwindow -resize +0x94CC0000 -0x400000 +e0x02010108   ;e0x00010101 ;gui,color,772299 0x568F0000
	winget,fp,processpath,ahk_id %hSpyWnd%
	(instr(fp,"Program Files")? fp:=strreplace(fp,"Program Files","PrgFiles"))
	spyy:= hSpyWnd, SbarhWnd:= statusbarinit(), SB_SetText(format("0x{:X}",hSpyWnd),2), SB_SetText(fp,1)
	SendMessage,0x80,0,hSmIcon,,ahk_id %hWnd% ; WM_SETICON,ICON_SMALL
	SendMessage,0x80,1,hLgIcon,,ahk_id %hWnd% ; WM_SETICON,ICON_LARGE
	gui,Add,Picture,hWndhFinda1 w64 h64 x4 y2 gFindaHandler +0x3,% "C:\Icon\- Icons\- CuRS0R\_ ani\INJEX_tease.ani" ;uiband_set(hSpyWnd)
	gui,Add,Picture,% "+hwndp1pwnd x" img["Banner1"].xoff " y" img["Banner1"].yoff,%  img["Banner1"].path
	gui,Add,Picture,% "+hwndp2pwnd x" img["Banner2"].xoff " y" img["Banner2"].yoff,%  img["Banner2"].path
	gui,Add,Picture,% "+hwndp3pwnd x" img["Banner3"].xoff " y" img["Banner3"].yoff,%  img["Banner3"].path
	img["Banner1"].hpic:= p1pwnd, img["Banner2"].hpic:= p2pwnd, img["Banner3"].hpic:= p3pwnd
	gui,Add,Picture,% "hWndhCloseButt1 gCloseButtHandla w40 h40 x" G_SPY_W-55 " y2",% img["CloseButt1"]
	gui,Add,Picture,% "hWndhCloseButt2 gCloseButtHandla w40 h40 x" G_SPY_W-55 " y4 hidden",% img["CloseButt2"]
	gui,Add,Picture,% "hWndhCloseButt3 gCloseButtHandla w40 h40 x" G_SPY_W-55 " y4 hidden",% img["CloseButt3"]
	guicontrol,Hide,% img["Banner1"].hpic
	guicontrol,Hide,% img["Banner2"].hpic
	guicontrol,Hide,% img["Banner3"].hpic
	img["CloseButt1"].hpic:= hCloseButt1, img["CloseButt2"].hpic:= hCloseButt2
	gui,Font,s9,continuum light ;msgbox,% g_Topmost
	gui,Add,CheckBox,% "hwndtOPMCheck gSetTopMost check3 vg_Topmost x370 y7" ,% "&UI-Band"
	gui,Add,CheckBox,% "hwnddHWCheck gSetDHW check3 				 x370 y37",% "&Find-hidden"
	gui,Font,s8,continuum medium
	StyleSet(hSpyWnd,"+0x80000000")
	exStyleSet(hSpyWnd,"+0x02000000")
	gui,Add,Tab3,% "+hWndhTab vTab gTabHandler x7 y" Tab_Y " w" G_SPY_W-24 " h574 AltSubmit -Wrap +e0x2000000 +0x2000000"
	,% "  General  |  Detail  |  WM's  | Extra | Windows |  Styles  "
	GUIControl,,%hTab%
	TAB_SetItemSize(hTab,,TabHeightSlider)
	Tab_Y:= Tab_Y_init+ TabHeightSlider-22
	gui,Font,s9,continuum light
gui,Tab,1 ;General;
	gui,Add,Picture,% "	+hwndhfukbk2 +backgroundtrans x14  y" Tab_Y+29   " w76  h76",% resdir "\Framebk_76_2.ico"
	gui,Add,Picture,% "	+hwndfukbk +backgroundtrans x14 y" Tab_Y+29   " w76  h76",% resdir "\ibk64_74.ico"
	;winset,transcolor ,000000,ahk_id %fukbk%
	gui,Add,Picture,% "vProgIcon +backgroundtrans +hwndhprogicon	x20  y" Tab_Y+34  " w64  h64"
	,% "C:\Icon\256\Autism5.ico" ;% "C:\Script\AHK\- Script\WinSpy\Resources\INJEX.ani"
	
	gui,Font,s7
	gui,Add,Text,%	"vProgVer hwndhfkuu2 	+backgroundtrans +0x200	x16  y" Tab_Y+100 " w120 h20"
	gui,Font,s9
	gui,Add,Edit,%	"vProcTxT gSetHandle +0x9   -E0x200 x94  y" Tab_Y+36 " w292 h24"
	gui,Add,Edit,%	"vEdtHandle2 gSetHandle +0x1		x112 y" Tab_Y+75  " w123 h24"
	gui,Add,Edit,%	"vEdtHandle gSetHandle +0x1			x243 y" Tab_Y+75  " w123 h24"
	gui,Add,Button,% "+hWndhBtnCmds gShowCmdsMenu 		x390 y" Tab_Y+34  " w125 h35",% "   Cmds:"
	gui,Add,Button,% "+hwndht1b4 gShowXYWHDlg 			x390 y" Tab_Y+76  " w125 h35",% " Reposition "
	gui,Add,Text,%								"+0x200 x20  y" Tab_Y+118 " w28  h30",% "XY:"
	gui,Add,Edit,% "vEdtPosition -E0x200 ReadOnly +0x1	x50  y" Tab_Y+122 " w199 h24"
	gui,Add,Text,%								"+0x200	x275 y" Tab_Y+118 " w40  h30",% "W/H:"
	gui,Add,Edit,%	"vEdtSize  -E0x200 ReadOnly  +0x1 	x322 y" Tab_Y+122 " w204 h24"
	gui,Add,Text,%	"+hwndt1t7 vTxtText			 +0x200	x20  y" Tab_Y+182 " w93  h30",% "Text:"
;	gui,Add,Text,	+hwndt1t7 x20 y183 w93 h24 +0x200,%					"Proc:"
	gui,Add,Edit,%	"+hwndt1t6 vEdtText x86 y" Tab_Y+186 " w296 h24 -E0x200"
	gui,Font,s9,	continuum light
	gui,Add,Text,	+hwndt1t9 vclassText x20 y292 w93 h30 +0x200,%			"Win-Class:"
	gui,Add,Edit,	+hwndt1t10 vEdtClass gSetClass x118 y295 w405 h24 -E0x200,
	gui,Add,Text,	 visctltxt x120 y322 w403 h30 x20  w93 h30 +0x200,%		"Ctrl-Class:"
	gui,Add,Edit,	vEdtClassNN gSetCtrlN x118 y326 w405 h24 -E0x200,
	gui,Add,Text,%	"x20 y" Tab_Y+154 " w110 h21 +0x200",%					"S/exStyle:"
	gui,Add,Button,+hwndhregionbutt vBtnRegionSet gShowRegionSet	x390 y230 w125 h28	,%	"  Region  "
	gui,Add,Edit,%	"vEdtStyle gSetStyle   x118 y" Tab_Y+154 " w123 h24 -E0x200" ;+0x1,
	gui,Add,Edit,%	"vEdtExStyle gSetXStyl x249 y" Tab_Y+154 " w123 h24 -E0x200"
;	gui,Add,Edit,	vEdStyleInfo x390 y227 w160 h24 -E0x200
;	gui,Add,Text,	x105 y363 w428 0x10,%									"Pfdfd:"
	gui,Add,ListView,hWndhProcInfo x12 y351 w512 h154 +0x4000 +LV0x14000,% "Property|Value"
;	gui,Add,Button,+hwndht1b3 gShowXYWHDlg x400 y419 w125 h35,%		" Magnify  "
;	gui,Add,Text,	x99 y438 w300 0x10
;	gui,Add,Text,	x20 y450 w93 h24 +0x200,%			"Args:"
;	gui,Add,Edit,	vcmdline x90 y450 w449 h24 -E0x200 ReadOnly
	gui,Add,Button,% "+hwndht1b1 vBtnSetText gSetText	x390 y" Tab_Y+182 " w125 h30",%	"   Set Text  "
	gui,Add,Text,	x20 y507 w93 h24 +0x200,%			"Architecture:"
	gui,Add,Edit,	x120  y509 w150 h24 vArch  -E0x200 	ReadOnly
	gui,Add,Text,	x300 y507 w93 h24 +0x200,%			"Codepage:"
	gui,Add,Edit,	x415 y509 w150 h24 vCPage  -E0x200 	ReadOnly
	gui,Add,Text,	x20 y537 w93 h24 +0x200,%			"DPI Context:"
	gui,Add,Edit,	x120 y539 w146 h24 vDpiC   -E0x200	ReadOnly
	gui,Add,CheckBox,% "hwndhDWMChk gDWMCompTogl vg_dwmcomposition x313 y537" ,% "&DWM-Composition"
	gui,Add,Text,	x300 y565 w108 h24 +0x200,%			"AHK Children?:"
	gui,Add,Edit,	x420 y566 w146 h24 vahkchildrentruefalse -E0x200	ReadOnly
	gui,Add,Text,	x20 y567 w93 h24 +0x200,%			"TransColor:"
	gui,Add,Edit,	x120 y569 w146 h24 vTranscol   -E0x200	ReadOnly
	gui,Add,Text,	x20 y598 w93 h24 +0x200,%		"Opacity:"
	gui,Add,Edit,	x120 y600 w146 h24 vTransval   -E0x200	ReadOnly
	loop,parse,% "settxt,cmds,mag16,change",`,
	{
		hwnd=% (ht1b%a_index%)
		icon:= (ResDir "\" a_loopField ".ico"), index:= 1, pos:= "RIGHT"
		switch,a_loopField { ; case,"change" : Pos:= "RIGHT"
			case,"cmds" : hwnd:= hBtnCmds
			case,"mag16": Pos:="left"
		} SetButtonIcon(hwnd,icon,index,pos)
	} gui,Font,s8,continuum light
	LV_ModifyCol(1,99), LV_ModifyCol(2,388)
	gui,Add,Button,+hwndhbuttendprocess gEndProcess x265 y595 w124 h35,% "End Process"
	gui,Add,Button,+hwndhopenfolder gOpenFolder x390 y595 w124 h35,% "Open Folder"
	winset,exstyle,+0x2000000,ahk_id %hProgIcon%
gui,Tab,2 ;Details;
	gui,Add,ListView,hWndhClassInfo x13 y98 w509 h345 +LV0x14000,% "Property|Value"
	LV_ModifyCol(1,181), LV_ModifyCol(2,302)
	gui,Font,s9,continuum medium
	gui,Add,Text,x18 y440 w540 h32,% "Window Properties:"
	gui,Font,s9,continuum light
	gui,Add,ListView,hWndhPropInfo x13 y468 w518 h190 +LV0x14000,% "Property|Data"
	LV_ModifyCol(1,181), LV_ModifyCol(2,333)
gui,Tab,3 ;Messages
	gui,Add,Text,x23 y118 w63 h28 +0x200,% "wMsg:"
	gui,Add,ComboBox,hWndhCbxMsg vCbxMessages x105 y120 w300 h500
	SendMessage,0x1701,20,0,,ahk_id %hCbxMsg% ;CB_SETMINVISIBLE;
	gui,Add,Link,gGoogleSearch x420 y123 w80 h28,% "<a>Google</a>"
	gui,Add,pic,+backgroundtrans x482 y121 ,% "C:\Icon\24\Google.ico"
	gui,Add,Text,x23 y190 w63 h23 +0x200,% "wParam:"
	gui,Add,Edit,vwParam x105 y190 w260 h28
	gui,Add,DropDownList,vwParamType x375 y190 w140,% "Number||String"
	gui,Add,Text,x23 y240 w63 h23 +0x200,% "lParam:"
	gui,Add,Edit,vlParam x105 y240 w260 h28
	gui,Add,DropDownList,vlParamType x375 y240 w140,% "Number||String"
	gui,Add,Button,+hwndhbuttsendmsg gSendMsg x97 y320 w140 h28,% "SendMessage"
	gui,Add,Button,+hwndhbuttpostmsg gPostMsg x300 y320 w140 h28,% "PostMessage"
	gui,Add,GroupBox,x84 y390 w400 h51 Center,% "Result"
	gui,Add,Edit,vResult x80 y350 w400 h21 Center -E0x200 ReadOnly
	gui,Add,Picture,x58 y290 w20 h20 +Icon2,% "user32.dll"
	gui,Add,Text,x80 y290 w290 h23,% "Some messages may crash the target application."
gui,Tab,4 ;Extra;
	gui,Add,ListView,hWndhExtraInfo x11 w518 y98 h444 +0x4000 +LV0x14000,% "Property|Value"
	LV_ModifyCol(1,200)
	gui,Add,Button,hWndhBtnMenu gShowMenuViewer x21 y555 w140 h32,% "Menu..."
	gui,Add,Button,gShowScrollBarInfo x21 y595  w140 h32,% "Scroll Bars..."
gui,Tab,5 ;Windows;
	gui,Add,Custom,ClassSysTabControl32 hWndhWindowsTab gWindowsTabHandler x14 y100 w509 h420
	Tab_AddItem(hWindowsTab,"Child Windows")
	Tab_AddItem(hWindowsTab,"Sibling Windows")
	gui,Add,ListView,hWndhChildList gChildListHandler x18 y129 w502 h420 -E0x200 +LV0x14000
	,% "Handle|Class Name|Window Text"
	LV_ModifyCol(1,133), LV_ModifyCol(2,79), LV_ModifyCol(3,270)
	gui,Add,ListView,hWndhSiblingList gSiblingListHandler x18 y129 w510 h420 -E0x200 +LV0x14000 Hidden
	,% "Handle|Class Name|Window Text"
	LV_ModifyCol(1,133), LV_ModifyCol(2,79), LV_ModifyCol(3,270)
	gui,Add,Button,	+hwndhRemParentButton1 gparent_remove x250 y560 w190 h38,% "Remove from parent"
	gui,Add,Button,	+hwndhRemParentButton2 gparent_restore x250 y589 w190 h38 disabled,% "restore 2 parent"
	gui,Font,s9,continuum medium
	gui,Add,Text,x21 y565 w58 h23 +0x200,% "Parent:"
	gui,Add,Link,vParentLink gLinkToHandle x97 y565 w120 h20,<a>0x00000000</a>
	gui,Add,Text,x21 y600 w58 h23 +0x200,% "Owner:"
	gui,Add,Link,vOwnerLink gLinkToHandle x97 y600 w120 h20,<a>0x00000000</a>
gui,Tab,6 ;Styles;
	gui,Font,s9,continuum light
gui,Add,Custom,ClassSysTabControl32 hWndhStylesTab gStylesTabHandler +0x10 +e0x400000 x13 y104 w504 h420
	TAB_SetItemSize(hStylesTab,,TabHeightSlider)

;gui,Add,Custom,ClassToolbarWindow32	+hwndhtb2 w240 h29 x20 y20 0x9
Toolbar2Init()
SendMessage,0x454,0,0x90,,ahk_id %htb2%
win_move(htb2,461,32,100,24,"")
gui,Add,Custom,ClassToolbarWindow32 +hwndhtb1 w105 h105 x20 y20
Toolbar1Init(htb1) ;TB_STYLE_TOOLTIPS:= 0x100|(TBSTYLE_LIST:=0x1000) ;text @ side of TB
	SendMessage,0x454,0,0x94,,ahk_id %htb1%
	win_move(htb1,442,32,"","","")
	Tab_AddItem(hStylesTab,"   Styles")
	Tab_AddItem(hStylesTab,"   Ex Styles ") ;ListBox style +0x108:noáegral height and simple multi-select
	StyleTabCurrent:=1
	gui,Add,ListBox
, hWndhLbxStyles vLbxStyles gLbxStylesHandler x82 y138 w430 h384 +0x108 -E0x200 t4 T114 +e0x8004000 ;-0x200000
	gui,Add,ListBox
, hWndhLbxExStyles vLbxExStyles gLbxStylesHandler x82 y138 w430 h384 +0x108 -E0x200 t4 T114 +e0x8004000
	gui,Add,ListBox
, hWndhLbxExtraStyles vLbxExtraStyles gLbxStylesHandler x82 y138 w430 h384 +0x108 t0 -E0x200 +e0x8004000 T114 Hidden
	gui,Add,Edit,	vEdtStyleSum 		x392 y529 w125 h30,0x00000000
	gui,Add,Edit,	vEdtExStyleSum 		x392 y529 w125 h30 Hidden,0x00000000
	gui,Add,Edit,	vEdtExtraStyleSum 	x392 y529 w125 h35 Hidden,0x00000000
	gui,Font,s8,continuum light
	gui,Add,Button,	gApplyStyle hwndhapplystyle		x400 y566 w123 h33,% 	"@pply"
	gui,Add,Button,	gResetStyle  hwndhresetstyle			x400 y599 w123 h33,Reset
	gui,Font,s8,continuum medium
	gui,Add,GroupBox,vGrpDesc 			x18  y524 w368 h108,%	"Left/Right-click an item to see its description."
	gui,Font,s8,continuum light
	gui,Add,Text, vTxtDesc gShowDescription	x28 y542 w360 h84 +0x80
gui,Tab ;main-butt-sect;
	gui,Add,Button,	hWndhBtn1 gSettingsShow	x42  y648 w32 h36
	gui,Add,Button,	hWndhBtn2 gShowFindDlg	x+18  y648 w84 h36,%	" &Find..."
	gui,Add,Button,	hWndhBtn3 gShowTree		x+18  y648 w84 h36,%	" &Tree..."
	gui,Add,Button,	hWndhBtn4 gCpy2Clip		x+18  y648 w87 h36,%	" &Copy"
	gui,Add,Button,	hWndhBtn5 gScreenshot	x390  y648 w125 h36,%	" &Screenshot"
	loop,parse,% "cog,search,tree,Copy_24,screenshot",`,
	{
		icon:= (ResDir "\" a_loopField ".ico"), index:= "", pos:= "LEFT"
		switch,a_loopField { ;case,"find" : ;case,"tree" : ;case,"Copy_24" :;case,"cog" :
			case,"cog","screenshot"  : Pos:= "RIGHT",
		} SetButtonIcon(hBtn%a_index%,icon,index,pos)
	}
gui,+lastfound -Resize +MaxSize%G_SPY_W%x%G_SPY_H% +MinSize%G_SPY_W%x%G_SPY_H%
;winset,style,&0x40000 ; Show main window ;
gui,Spy:Show,na x%pxx% y%pyy% w%G_SPY_W% h%G_SPY_H% Hide,% AppName ; Show main window

win_move(spyy,pxx,pyy,G_SPY_W,G_SPY_h,"")
;gosub,setExplorerTheme ;BalloonTip("drag here...`n   `;-)","",25,24,true,4) ;sleep,2000
gui,Spy:
	exStyleSet(htab,"+0x02000000")

return, ;End Gui-init phase; ;End Gui-init phase; ;End Gui-init phase; ;End Gui-init phase;
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

TabHeightSlider:
gui,settings: Submit,NoHide
TAB_SetItemSize(hTab,,TabHeightSlider)
GUIControl,,%hTab%
GUIControl,,TabHeightDisplay,% TAB_GetItemHeight(hTab)
return,
#k::
tt("sdasdsd")
nerve:
text2:=true, gay:= "ControlPanelStyle",	HHDC:=CreateCompatibleDC()
	VarSetCapacity(PaintStruct,a_ptrsize=8? 72:64), VarSetCapacity(Paintparams,24)
	, NumPut(24,Paintparams,0,"uint"), VarSetCapacity(dttopts,(a_ptrsize=8? 72:64,0)) ;dwSize
	, NumPut(a_ptrsize=8? 72:64,dttopts,0,"uint") ;dwSize 
	, NumPut(8192,dttopts,4,"uint"), NumPut(24,dttopts,52,"int") ;DTT_TEXTCOLOR-0X14 DTT_COMPOSITED-0XD DTT_GLOWSIZE-0XB iGlowSize-12 ;NumPut(12, dttopts,55,"uint");crazy glitch;NumPut(10241,dttopts,8,"uint");UxTheme_BeginBufferedPaint(HDC,&client_rect2,2,&Paintparams,&hHDC) 
	, hthemedata:= DllCall("uxtheme\OpenThemeData","uint",hspywnd,"uint",&gay)
	, HDC:= DllCall("BeginPaint","uint",hspywnd,"uint",&PaintStruct)
	, DllCall("uxtheme\BeginBufferedPaint","Ptr",HDC,"Ptr",&client_rect2,"uInt",2,"Ptr",pPaintParams,"uInt*",&hHDC)
	, bgb:= "i love niggers" ;DllCall("DrawText","UPtr",HDC,"UPtr",&bgb,"Int",-1,"UPtr",&client_rect,"UInt",0)
	 text1? e:= DllCall("DrawText","UPtr",HDC,"UPtr",&bgb,"Int",-1,"UPtr",&client_rect,"UInt",0)
	:text2? e:= DllCall("uxtheme\DrawThemeTextEx","uint",hthemedata,"uint",HDC,"int",0,"int",0,"uint"
	, &bgb,"int",-1,"int",0,"int",&client_rect2,"uint",&dttopts)
	,DllCall("EndPaint","uint",hspywnd,"uint",&PaintStruct), Gdi_DeleteDC(HDC),Gdi_DeleteDC(HHDC)
	return,
Parent_(action="") {
	global G_hWnd,hParent
	static OLDPar:= []
	switch,action {
		case,"remove": ((OLDpar[g_hwnd]="")? OLDpar[g_hWnd]:= hParent)
		case,"restore": NewParent:= oldpar[g_hWnd], oldpar[g_hWnd].delete
		case,"restoreall": for,i in oldpar
				DllCall("SetParent","ptr",oldpar[i],"ptr","ahk_id " i)
			return,
	} DllCall("SetParent","ptr",g_hWnd,"ptr",NewParent)
	return,true
}

Parent_REMOVE:
((SCUM:= Parent_("REMOVE"))? OldParents[G_hWnd]:= hParent)
gui,submit,nohide
return,

Parent_Restore:
((SCUM:= Parent_("Restore"))? OldParents.PUSH(SCUM))
return,

Menu_Init:
LoadCursors()
hSysMenu:= DllCall("GetSystemMenu","Ptr",hSpyWnd,"Int",False,"Ptr")
DllCall("InsertMenu","Ptr",hSysMenu,"UInt",5,"UInt",0x400,"UPtr",0xC0DE,"Str","About...")
DllCall("InsertMenu","Ptr",hSysMenu,"UInt",5,"UInt",0xC00,"UPtr",0,"Str","") ; Separator
Menu,CommandsMenu,Add,Visible,menHandl4
Menu,CommandsMenu,Add,Enabled,menHandl4
Menu,CommandsMenu,Add,Always on Top,menHandl4
Menu,CommandsMenu,Add
Menu,CommandsMenu,Add,RedRaw Window,menHandl4
Menu,CommandsMenu,Add
Menu,CommandsMenu,Add,Close Window,	menHandl4
	hCommandsMenu:= MenuGetHandle("CommandsMenu")
return,

; ID_VIEW_VARIABLES(wParam, lParam) { ; 0x201:;WM_LBUTTONDOWN;0x202:;WM_LBUTTONUP
	; global ;Thread,Priority,0||;Thread,Priority,7 ;0x020B:;WM_XBUTTONDOWN
; }

SetStyle:
SetXStyl:
SetClass:
SetCtrlN:
return,

WinAnimate(Hwnd,Type="",Time=100) {
	static AW_ACTIVATE=0x20000,  AW_BLEND=0x80000, AW_CENTER=0x10, AW_HIDE=0x10000
	,	AW_HNEG=0x2,AW_HPOS=0x1, AW_SLIDE=0x40000, AW_VNEG=0x8, AW_VPOS=0x4
	loop,parse,Type,%A_Tab%%A_Space%,%A_Tab%%A_Space%
		ifEqual,A_LoopField,,Continue,
		else,(!hFlags? (hFlags:= 0, hFlags|=AW_%A_LoopField%):hFlags|=AW_%A_LoopField%)
	ifEqual,hFlags,% "",return,"Err: Some of the types are invalid"
	return,dllcall("AnimateWindow","uint",Hwnd,"uint",Time,"uint",hFlags)
}

CloseButtHandla: ;gui,;-dpiscale gui,Add,Picture,w40 h40 x515 y0,% img["CloseButt2"]
WinAnimate(hCloseButt3,"activate center",80) ;WinAnimate(hCloseButt1,"hide center",150); WinAnimate(hCloseButt2,"hide center",150)
WinAnimate(hCloseButt3,"hide center",900)
guicontrol,% hclosebutt,% img["CloseButt1"]
winset,style,-0x0840000,ahk_id %hSpyWnd%
winset,RedRaw,,ahk_id %hSpyWnd%
WinAnimate(hSpyWnd,"hide blend",330) ;exitapp,;
goto,SpyEscape
return,

TabHandler:
try,gui,Spy:Submit,NoHide
TabHandler(Tab)
try,gui,Spy:Submit,NoHide
try,WinAnimate(img["Banner1"].hpic,"hide center",99)
try,WinAnimate(img["Banner2"].hpic,"hide center",80)
try,WinAnimate(img["Banner2"].hpic,"activate center",70)
try,WinAnimate(img["Banner1"].hpic,"activate center",80)
return, ;gui,Spy:Submit,NoHide

TabHandler(Tab) {
	global ;hCbxMsg, htab ;winset,exstyle,-0x2000000,ahk_id %htab%
	winset,exstyle,+E0x2000000,ahk_id %htab%
	switch,Tab {
		case,"1" : SendMessage,0x0028,%hBtnCmds% ;winset,RedRaw,;ControlClick,x5 y5,ahk_id %hBtnCmds%
			GoSub,LoadProcessProperties ; ,ahk_id %htab%	,,,,Pos ;ControlFocus,,ahk_id %hBtnCmds%
		case,"3" : GoSub,LoadMessages ;GuiControl,Focus,ahk_id %hBtnCmds%
			winset,RedRaw,,ahk_id %hCbxMsg% ; winset,RedRaw,,ahk_id %hCbxMsg%
		case,"4" : LV_ModifyCol(1,79)
		case,"5" : gosub,Parent_Button_Eval
		case,"6" : trigger:= True ;sleep,100;
			TB1RePos()
			TB2RePos()
			settimer,StylesTabHandler,-1	;winset,RedRaw,,ahk_id %hStylesTab%;
			sleep 50
			TB1RePos()
			TB2RePos()
			gui,Spy:Submit,NoHide
	}
}

StylesTabHandler:
TB1RePos()
gui,Spy:Submit,NoHide
if(A_guiEvent=="N"||trigger) {
	if((Code:= NumGet(A_EventInfo +0,A_PtrSize *2,"Int"))==-551||trigger) { ;TCN_SELCHANGE;
		ssleep(90)
		(trigger? trigger:= false : (lasttrig? (a_tickcount-lasttrig<2000? (lasttrig:= a_tickcount, return())) : lasttrig:= a_tickcount))
		SendMessage,0x130B,0,0,,ahk_id %hStylesTab% ;TCM_GETCURSEL;
		sleep,2
		switch,StyleTabCurrent:= Errorlevel+1 {
			case,"1" : act:= hLbxStyles
				guicontrol,Hide,ListBox3
				guicontrol,Hide,ListBox2
				guicontrol,Hide,EdtExtraStyleSum
				guicontrol,Hide,EdtExStyleSum ;guicontrol,Show,ListBox1;
				guicontrol,Show,EdtStyleSum ;winset,RedRaw,,ahk_id %hLbxStyles%;
				guicontrol,Show,hLbxStyles ;winset,RedRaw,,ahk_id %hLbxStyles%;
				winset,RedRaw,,ahk_id %hLbxStyles%
 				guicontrol,show,ListBox1
			case,"2" : act:= hLbxExStyles
			;	msgbox %  act
				guicontrol,Hide,ListBox1
				guicontrol,Hide,ListBox3
				guicontrol,Hide,EdtExtraStyleSum
				guicontrol,Hide,EdtStyleSum ;guicontrol,Show,ListBox2;
				guicontrol,Show,EdtExStyleSum ;winset,RedRaw,,ahk_id %hLbxStyles%;
				guicontrol,Show,hLbxExStyles ;winset,RedRaw,,ahk_id %hLbxStyles%;
				winshow,ahk_id %hLbxExStyles%
				guicontrol,show,ListBox2
				winset,RedRaw,,ahk_id %hLbxExStyles%
			case,"3" : act:= hLbxExtraStyles
				guicontrol,Hide,ListBox1
				guicontrol,Hide,ListBox2
				guicontrol,Hide,EdtStyleSum
				guicontrol,Hide,EdtExStyleSum ;guicontrol,Show,ListBox3;
				guicontrol,Show,EdtExtraStyleSum
				guicontrol,Show,hLbxExtraStyles
				guicontrol,show,ListBox3
				winset,RedRaw,,ahk_id %hLbxExtraStyles%
		} ;SendMessage,0x421,,,,ahk_id %htb1% ;TB_AUTOSIZE;
		;SendMessage,0x421,,,,ahk_id %htb2%
		;win_move(htb1,"","","","",""), win_move(htb2,"","","","","")
		TB1RePos()
		sleep,2
		;TB2RePos()
		SendMessage,0x454,0,0x90,,ahk_id %htb2% ;only dblbuff	;WinAnimate(htb1,"hide slide hpos",80)
		SendMessage,0x454,0,0x94,,ahk_id %htb1% ;only dblbuff
		if((dir:=(styletabold>StyleTabCurrent? "hpos" : "hneg"))="hneg"||"hpos") {
			if((styletabold=12)||(styletabold=StyleTabCurrent)){
					winshow,ahk_id %htb1%
				;	winshow,ahk_id %htb2%
			 		winshow,ahk_id %act%
			 		StyleTabisInit:= True
					styletabold:= StyleTabCurrent
					return,
			} else {
			;	winhide,ahk_id %htb1%
			;	winhide,ahk_id %htb2%
			; 	winhide,ahk_id %act%
				sleep,2
			} Toolbar1update(StyleTabCurrent)
			Toolbar2update(StyleTabCurrent)
			try,{
			TB1RePos()
			TB2RePos()
			;	WinAnimate(htb2,"activate slide " dir,50)
				 WinAnimate(htb1,"activate slide " dir,110)
				, WinAnimate(act,"activate slide " dir,200)
			} Toolbar1update(StyleTabCurrent)
				Toolbar2update(StyleTabCurrent)
		} else,if(styletabold=StyleTabCurrent) {
			winhide,ahk_id %htb1%
			winhide,ahk_id %act%
			Toolbar1update(StyleTabCurrent)
			Toolbar2update(StyleTabCurrent)
			if(!StyleTabisInit) {
				try,winshow,ahk_id %htb1%
			;			try,winshow,ahk_id %htb2%
				try,winshow,ahk_id %act%
				StyleTabisInit:= True
			}
		} else,try,{
				try,winshow,ahk_id %htb1%
				;try,winshow,ahk_id %htb2%
				try,winshow,ahk_id %act%
		} styletabold:= StyleTabCurrent
}	}
return,

~=::xxx++
~-::xxx--
~^!t:: ; guicontrol,move,% htb1,% "x" xxx
win_move(htb2,442,32,20,20,"")
Toolbar_SetButtSize(htb2,76,76)
winset,RedRaw,,ahk_id %htb2%
win_move(hwnd,442,1,22,25,"")
SendMessage,0x43C,0,0,,ahk_id %hwnd% ;note: If more than one button has the same idCommand,
SendMessage,0x454,0,0x90,,ahk_id %hwnd%
winset,RedRaw,,ahk_id %htb2%
t:= wingetpos(htb2)
tt(t.x " " t.y)
return,

Toolbar1Init(hwnd="") { ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~; }
	global hStylesTab,hSpyWnd,htb1
	if(hwnd="") {
		ControlGet,hwnd,hwnd,,ToolbarWindow321,ahk_id %hSpyWnd%
		hwnd:= htb1	;Win_Move(htb1,500,500.500,500,"") ;	TB_SETMAXTEXTROWS	; Text omitted from bar;
	} win_move(htb1,442,32,"","","")
	DllCall("SetParent","ptr",htb1,"ptr",hStylesTab)
	SendMessage,0x454,0,0x94,,ahk_id %htb1%
	SendMessage,0x43C,0,0,,ahk_id %htb1% ;note: If more than one button has the same idCommand,
	Toolbar1update()	;	Only the last button with that idCommand will proceed with call.
	win_move(htb1,442,32,"","","")
	return,htb1
}

Toolbar2Init() { ;~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~; }
	global ;hStylesTab,hSpyWnd,htb2
	ControlGet,hwnd,hwnd,,ToolbarWindow322,ahk_id %hSpyWnd%
	(hwnd="")? hwnd:=htb2 ;Win_Move(htb1,500,500.500,500,"") ;	TB_SETMAXTEXTROWS	; Text omitted from bar;
	win_move(hwnd,442,1,200,25,"")
	DllCall("SetParent","ptr",htb2,"ptr",hStylesTab)
	SendMessage,0x454,0,0x90,,ahk_id %hwnd%
	SendMessage,0x43C,0,0,,ahk_id %hwnd% ;note: If more than one button has the same idCommand,
	Toolbar2update(4)	;	Only the last button with that idCommand will proceed with call.
	win_move(hwnd,542,1,220,25,"")
	return,hwnd
}

Toolbar1update(il=1) {
	global SYSGUI_TBbUTTSZ1, TBBUTTON, htb1, vCount, vMsg
	hIL:= IL_init(il),	vMsg:= A_IsUnicode? 0x444:0x414 ;TB_ADDBUTTONSW=0x444, TB_ADDBUTTONSA=0x414
	SendMessage,0x430,0,% hIL,,ahk_id %htb1% ;TB_SETIMAGELIST=0x430
	SendMessage,% vMsg,% vCount,% &TBBUTTON,,% "ahk_id " htb1 ;TB_ADDBUTTONSW/TB_ADDBUTTONSA
	Toolbar_SetButtSize(htb1,64,64)
	winset,exstyle,+0x110,ahk_id %htb1%
	winset,style,+0x9,ahk_id %htb1%
	SendMessage,0x454,0,0x94,,ahk_id %htb1%	;win_move(htb1,"","","","")
	TB1RePos() ;SendMessage,0x454,0,0x94,,ahk_id %htb1% ;toolbar extra style double buff+hideclipped+vertical
	;win_move(htb1,442,32,"","","")
}

Toolbar2update(il=4) {
	global ;SYSGUI_TBbUTTSZ2,TBBUTTON ;global htb2, vCount,	vMsg
	hIL4:= IL_init(4),	vMsg:= A_IsUnicode? 0x444:0x414 ;TB_ADDBUTTONSW=0x444,TB_ADDBUTTONSA=0x414l;
	SendMessage,0x430,0,hIL4,,ahk_id %htb2% ;TB_SETIMAGELIST=0x430
	SendMessage,% vMsg,% vCount,% &TBBUTTON,,% "ahk_id " htb2  ;TB_ADDBUTTONSW/TB_ADDBUTTONSA;
	Toolbar_SetButtSize(htb2,16,16)
	winset,exstyle,+0x110,ahk_id %htb2%
	winset,style,+0x9,ahk_id %htb2%
	win_move(htb2,"","","","")
	TB2RePos() ;SendMessage,0x454,0,0x90,,ahk_id %hwnd% ;toolbar extra style double buff+hideclipped+vertical
}

TB1RePos() {
	global
	;win_move(htb1,"","","","","")
	win_move(htb1,434,32,"","","")
	SendMessage,0x454,0,0x94,,ahk_id %htb1%
	win_move(htb1,434,32,"","","")

}

TB2RePos() {
	global
	win_move(htb2,200,-8,200,24,"")
	SendMessage,0x454,0,0x90,,ahk_id %htb2%
	win_move(htb2,200,-8,200,24,"")
}

Toolbar_SetButtSize(hCtrl,wW,Hh="") {
	static TB_SETBUTTONSIZE=0x41F
	;IfEqual,hH,,SetEnv,hH,% Ww
	SendMessage,TB_SETBUTTONSIZE,0,% Hh<<16|wW,,ahk_id %hCtrl%
	SendMessage,0x421,,,,ahk_id %hCtrl%	;autosize
}

WinMove(hWnd="",X="",Y="",W="",H="",Flags="") {	;(hWnd="A"? hWnd:= Winexist("A"))
	static SWP_NORedRaw=8,SWP_ASYNCWINDOWPOS=0x4000,SWP_BOTTOM=1,SWP_TOPMOST=-1,SWP_NOTOPMOST=-2
	static SWP_NOMOVE=2,SWP_NOSIZE=1,SWP_NOZORDER=4,SWP_NOACTIVATE=0x10,SWP_R=8,SWP_A=0x4000
	hFlags:= SWP_NOZORDER|SWP_NOACTIVATE|SWP_A
	loop,parse,Flags,`,
		try,hFlags|=SWP_%A_LoopField%
	if(x y != "") {
		p:= DllCall("GetParent","uint",hwnd),Win_Get(p,"Lxy",px,py),Win_GetRect(hwnd,"xywh",cx,cy,cw,ch)
		(!x? (x:= cx -px):()), (!y?( y:= cy -py):())
	} else,hFlags|=SWP_NOMOVE
	if(h w != "") {
		(!cx? Win_GetRect(hwnd,"wh",cw,ch))
		(!w? w:= cw:())
		(!h?h:= ch:())
	} else,hFlags|=SWP_NOSIZE
	return,DllCall("SetWindowPos","uint",hWnd,"uint",0,"int",x,"int",y,"int",w,"int",h,"uint",hFlags)
}

spyClose:
spyEscape:
gosub,ini_write
ExitApp,

ini_write:
p:= GetWindowPlacement(hSpyWnd)
If(P.X>A_Screenwidth-20)
	P.X:=A_Screenwidth*0.5-300
If(P.Y>A_Screenheight-20)
	P.Y:=A_Screenheight*0.5-450
if(!FileExist(IniFile))
  FileAppend,% "[Settings]`n`n[Screenshot]",% IniFile,UTF-16
IniWrite,% p.x,% IniFile,Settings,x
IniWrite,% p.y,% IniFile,Settings,y
IniWrite,% g_DetectHiddn,% IniFile,Settings,DetectHiddn
IniWrite,% g_Topmost,% IniFile,Settings,AlwaysOnTop
IniWrite,% g_BorderColor,% IniFile,Screenshot,BorderColor
IniWrite,% g_BorderWidth,% IniFile,Screenshot,BorderWidth
IniWrite,% g_ShowBorder,% IniFile,Screenshot,ShowBorder
IniWrite,% g_Minimize,% IniFile,Settings,CompactMode
return,

ShowWindowInfo(ClassNN:= "") {
	guicontrol -g, EdtHandle
	if(IsChild(g_hWnd))
		LoadControlInfo(ClassNN)
	else,LoadWindowInfo()
	guicontrol +gSetHandle, EdtHandle
	GoSub,LoadStyles
	GoSub,LoadClassInfo
	GoSub,LoadProperties
	GoSub,LoadExtraInfo
	GoSub,LoadWindowsTab
	guicontrolGet Tab,, Tab, %hTab%
	TabHandler(Tab)
	switch,StyleTabCurrent {
			case,"1" : act:= hLbxStyles
				guicontrol,Hide,ListBox3
				guicontrol,Hide,ListBox2
				guicontrol,Hide,EdtExtraStyleSum
				guicontrol,Hide,EdtExStyleSum
			;	guicontrol,Show,ListBox1
				guicontrol,Show,EdtStyleSum
				winset,RedRaw,,ahk_id %StyleTabCurrent%
				winset,RedRaw,,ahk_id %hLbxStyles%
			case,"2" : act:= hLbxExStyles
				guicontrol,Hide,ListBox1
				guicontrol,Hide,ListBox3
				guicontrol,Hide,EdtExtraStyleSum
				guicontrol,Hide,EdtStyleSum
			;	guicontrol,Show,ListBox2
				guicontrol,Show,EdtExStyleSum
				winset,RedRaw,,ahk_id %StyleTabCurrent%
				winset,RedRaw,,ahk_id %hLbxExStyles%
			case,"3" : act:= hLbxExtraStyles
				guicontrol,Hide,ListBox1
				guicontrol,Hide,ListBox2
				guicontrol,Hide,EdtStyleSum
				guicontrol,Hide,EdtExStyleSum
			;	guicontrol,Show,ListBox3
				guicontrol,Show,EdtExtraStyleSum
				winset,RedRaw,,ahk_id %StyleTabCurrent%
				winset,RedRaw,,ahk_id %hLbxExtraStyles%
		} Toolbar1update(StyleTabCurrent)
	GoSub,UpdateTitleBar
}

LoadWindowInfo() {
	global parent,hancest_par
	gui,Spy: Default ; Handle
	mousegetpos,,,hw,cn,3
	parent:= IsChild(g_hwnd)? false : true ;,tt("xild"); ClassNN:=""
	winget,PID,PID,ahk_id %g_hWnd%
	winget,procname,processname,ahk_id %g_hwnd%
		guicontrol,,ProcTxT,% procname
		guicontrol,,EdtHandle2,% format("0x{:X}",cn)
		guicontrol,,CPage,% CodeP:= ((CodeP:= DllCall("IsWindowUnicode","Ptr",g_hWnd)="1")
	? CodeP:="Unicode": CodeP:= "ANSI")
	guicontrol,,Arch,% Arch:= GetImageType(PiD)
	winget,transval,transparent,ahk_id %g_hwnd%
	winget,transcol,transcolor,ahk_id %g_hwnd%
	if(transval)
		guicontrol,,transval,% round(transval/255*100) " %"
	else,guicontrol,,transval,Opaque
	if(transcol)
		guicontrol,,transcol,% transcol
	else,guicontrol,,transcol,None
		guicontrol,,% hdwmchk ,1
	guicontrol,,ahkchildrentruefalse,FALSE
	switch,dpimode:= dllcall("GetAwarenessFromDpiAwarenessContext","int",dllcall("GetWindowDpiAwarenessContext","int",g_hWnd,"ptr"),"int") {
		case,"-1": DpiC:= "INVALID"
		case,"0" : DpiC:= "UNAWARE"
		case,"1" : DpiC:= "System"
		case,"2" : DpiC:= "Per-Monitor"
	} guicontrol,,DpiC,% DpiC
	guicontrol,,EdtHandle,% format("0x{:X}",g_hWnd)
	wingetTitle Title, ahk_id %g_hWnd% ; Title
	if(strlen(title)<20)
			guicontrol,move,EdtText,x110 w200
		else guicontrol,move,EdtText,x86 w296
	(strlen(title)>29? title:= substr(title,1,29) . "...")
	guicontrol,,EdtText,% Title
	guicontrol,,TxtText,% parent? "WinTitle:":"Ctrl TxT:"
	guicontrol,,BtnSetText,% parent? "Set Title:":"Set text:"
	guicontrol,,isctltxt,% parent? "Top-Parent": "Ctrl-class"	; Class
	wingetClass,Class,ahk_id %g_hWnd%
	guicontrol,,EdtClassNN,% (!parent)? Class:"True"
	guicontrol,,EdtClass,% Class ;guicontrol,,EdtClassNN, N/A	 ;else
	guicontrol,,classText,% parent? "Win-class:":"Ctrl Title:"
	if parent
		guicontrol,show,hparenttext
winget,g_Style,Style,ahk_id %g_hWnd% ; Style
	((g_Style &0x00FF0000)==0xCF0000? StyleInfo:= " (Overlapped Window)"
	: (StyleInfo:=g_Style &0x80880000? " (Popup Window)":""))
	guicontrol,,EdtStyle,% format("0x{:08X}",g_Style)
	guicontrol,,EdStyleInfo,% StyleInfo
	winget,g_ExStyle,ExStyle, ahk_id %g_hWnd% ; Extended style
	guicontrol,,EdtExStyle,% format("0x{:08X}",g_ExStyle)
	Setformat,Integer,D	; Position/size
	wingetPos,X,Y,W,H,ahk_id %g_hWnd%
	wi:= GetWindowInfo(g_hWnd)
	guicontrol,,EdtPosition,% X . ", " . Y . " (" . wi.ClientX . ", " . wi.ClientY . ")"
	guicontrol,,EdtSize,% W . " x " . H . " (" . wi.ClientW . " x " . wi.ClientH . ")"
}

LoadControlInfo(ClassNN="") {
	global hancest_par
	(ClassNN==""?  (ClassNN:= GetClassNNEx(g_hWnd), hancest_par:= GetAncestor(g_hWnd,1)))
	gui,Spy:Default
	Setformat,Integer,Hex
		guicontrol,,EdtHandle,% format("0x{:X}", g_hWnd)
	wingetClass,Class,ahk_id %g_hWnd%
		guicontrol,,EdtClass,% ClassNN
	ControlGetText,Text,,ahk_id %g_hWnd%
		wingetTitle Title, ahk_id %g_hWnd% ; Title
		(strlen(title)>31? title:= substr(title,1,31) . "...")
		guicontrol,,EdtText,% Title? Title : Title:= quote(" ")
		if(strlen(title)<20)
			guicontrol,move,EdtText,x110 w200
		else guicontrol,move,EdtText,x86 w296
		guicontrol,,TxtText,% "Ctrl-TxT:"
		guicontrol,,BtnSetText,Set Text
	try, { wingetClass,ClassAncest_Par,ahk_id %hancest_par%
		if(ClassAncest_Par)
			guicontrol,,EdtClassNN,% ClassAncest_Par
	} ControlGet,g_Style,Style,,,ahk_id %g_hWnd%
		guicontrol,,EdtStyle,% g_Style
	ControlGet,g_ExStyle,ExStyle,,,ahk_id %g_hWnd%
		guicontrol,,EdtExStyle,% g_ExStyle
	Setformat,Integer,D
	GetWindowPos(g_hWnd,X,Y,W,H), wi:= GetWindowInfo(g_hWnd), Pos:= (X . ", " . Y) ; Relative to parent
	if((hParent:= GetParent(g_hWnd))!=(hAncestor:= GetAncestor(g_hWnd))) {
		VarSetCapacity(RECT,16,0)
		if(DllCall("GetWindowRect","Ptr",g_hWnd,"Ptr",&RECT)) ;Relative to aNCESTor;
			if(DllCall("MapWindowPoints","Ptr",0,"Ptr",GetAncestor(g_hWnd),"Ptr",&RECT,"UInt",1))
				Pos.=" (" . (AX:= NumGet(RECT,0,"Int"))  ", " . (AY:= NumGet(RECT,4,"Int")) . ")"
	} guicontrol,,EdtPosition,% Pos
	if(W!=wi.ClientW||H!=wi.ClientH)
		guicontrol,,EdtSize,% W . " x " . H . " (" . wi.ClientW . " x " . wi.ClientH . ")"
	else,guicontrol,,EdtSize,%W% x %H%
	g_ExtraStyle:= GetExtraStyle(g_hWnd)
}

GetStatusBarText(hWnd) {
	hParentWnd:= GetParent(hWnd), SB_Text:= ""
	SendMessage,0x406,0,0,,ahk_id %hWnd% ;SB_GETPARTS
	Count:= ErrorLevel
	if(Count!="FAIL")
		Loop,% Count {
			StatusBarGetText,PartText,% A_Index,ahk_id %hParentWnd%
			SB_Text.=PartText . "|"
		}
	return,SubStr(SB_Text,1,-1)
}

LoadStyles: ;Styles;
gui,Spy: Default
guicontrol,,EdtStyleSum,% g_Style
guicontrol,,EdtExStyleSum,% g_ExStyle
guicontrol,,EdtExtraStyleSum,% g_ExtraStyle
wingetClass Class,ahk_id %g_hWnd%
if(Class=="")
	return,
LoadStyles(Class,"ListBox1") ; Load control styles
((Class=="ToolbarWindow32"||Class=="ReBarWindow32")? LoadStyles("CommonControls","ListBox1",True))
LoadStyles("Window","ListBox1",True), LoadStyles("WindowEx","ListBox2") ; Load window styles
SendMessage,0x1308,2,0,,ahk_id %HsTYLEStAB% ; TCM_DELETEITEM ; Delete the third tab
if(ErrorLevel==True) {
	guicontrol,Hide,ListBox3
	guicontrol,Show,ListBox1
	SendMessage,0x1330,0,0,,ahk_id %hStylesTab% ; TCM_SETCURFOCUS
	Sleep,0
	SendMessage,0x130C,0,0,,ahk_id %hStylesTab% ; TCM_SETCURSEL
} WStyle:= g_Style, Type:= 0
switch,class {
	case,"ComboBox" : ((g_Style &0x10)? Class:= "ComboBoxEx")	;CBS_OWNERDRAWFIXED
	case,"Button" :	Type:= WStyle &0xF, WStyle &= ~Type 		;BS_TYPEMASK
	case,"SysListView32" : Type:= WStyle & 0x3, WStyle &= ~Type	;LVS_TYPEMASK
	case,"Static" :	Type:= WStyle &0x1F, WStyle &= ~Type 		;SS_TYPEMASK
	case,"SysListView32","SysTreeView32","SysTabControl32","ToolbarWindow32","ComboBoxEx":
		Tab_AddItem(hStylesTab, RegExReplace(Class, "Sys|32|Control|Window") . " Extended Styles")
		LoadStyles(Class . "Ex", "ListBox3")
} ControlGet,Items,List,,,ahk_id %hLbxStyles%
Loop,Parse,Items,`n
{
	LStyle:= StrSplit(A_LoopField, "`t")[2]
	if (WStyle &LStyle||Type==LStyle) {
		WStyle &=~LStyle
		guicontrol,Choose,% hLbxStyles,% A_Index
}	}
if(WStyle) {
	Leftover:= format("0x{:08X}", WStyle)
	guicontrol,,% hLbxStyles,% Leftover . "`t" . Leftover . "||"
} SendMessage,0x115,6,0,,ahk_id %hLbxStyles% ;WM_VSCROLL;Scroll2top;
winset,RedRaw,,ahk_id %hLbxStyles%
WExStyle:= g_ExStyle
ControlGet,Items,List,,,ahk_id %hLbxExStyles% ;Extended styles;
Loop,Parse,Items,`n
{
	LExStyle:= StrSplit(A_LoopField, "`t")[2]
	if (WExStyle &LExStyle || LExStyle==0) {
		WExStyle &=~LExStyle
		guicontrol,Choose,% hLbxExStyles,% A_Index
}	}
if(WExStyle) {
	Leftover:= format("0x{:08X}",WExStyle)
	guicontrol,,% hLbxExStyles,% Leftover . "`t" . Leftover . "||"
} SendMessage,0x115,6,0,,ahk_id %hLbxExStyles% ; WM_VSCROLL, scroll to top
winset,RedRaw,,ahk_id %hLbxExStyles%
ExtraStyle:= g_ExtraStyle ; Extra control styles (LV, TV, Toolbar, Tab)
ControlGet,Items,List,,,ahk_id %hLbxExtraStyles%
Loop,Parse,Items,`n
{
	LExtraStyle:= StrSplit(A_LoopField,"`t")[2]
	if(ExtraStyle &LExtraStyle ||LExtraStyle==0) {
		ExtraStyle &=~LExtraStyle
		guicontrol,Choose,% hLbxExtraStyles,% A_Index
}	}
StyleTabLists_WantScrollbar: ;count the items;
ControlGet,Items,List,,,ahk_id %hLbXStyles%
Loop,Parse,Items,`n
	cnt:= A_Index
StyleTabListLbX_SB:= cnt<18? True : False
ControlGet,Items,List,,,ahk_id %hLbEXStyles%
Loop,Parse,Items,`n
	cnt:= A_Index
(cnt<18? StyleTabListLbEX_SB:= True)
ControlGet,Items,List,,,ahk_id %hLbXExtraStyles%
Loop,Parse,Items,`n
	cnt:= A_Index
(cnt<18? LV_over_extra:= True)
return,

LoadStyles(IniSection,ListBox,Append:= False) {
	global values
	Static IniFile:= A_ScriptDir . "\Constants\Styles.ini"
	IniRead,Section, %IniFile%, %IniSection%
	Values:= "", Child:= (IniSection == "Window" && IsChild(g_hWnd))? True:False
	Loop,Parse,Section, `n
	{
		Fields:= StrSplit(A_LoopField, "|"), Const:= Fields[1]
		if(Child && (Const=="WS_MAXIMIZEBOX" || Const=="WS_MINIMIZEBOX" || Const=="WS_OVERLAPPED"))
			Continue,
		if(!Child && (Const=="WS_TABSTOP" || Const=="WS_GROUP"))
			Continue,
		Values .= Const . "`t" . Fields[2] . "|"
		oStyles[Const]:= {"Value": Fields[2], "Desc": Fields[3]}
	} gui,Spy: Default
	guicontrol,,% ListBox,% (Append)? Values:"|" . Values
	gui,Spy:Submit,NoHide
}

LbxStylesHandler:
gui,Spy: Default
guicontrolGet,hLbx,hWnd,% A_guicontrol
guicontrol,-AltSubmit,% hLbx
guicontrolGet,Items,,% hLbx
Sum:= 0
Loop,Parse,Items,|
{
	StringSplit,Field,A_LoopField,`t
	Sum+=Field2
} guicontrol,,% StrReplace(A_guicontrol,"Lbx","Edt") . "um",% format("0x{:08X}",Sum)
guicontrol,+AltSubmit,% hLbx ;Style description
SendMessage,0x188,0,0,,ahk_id %hLbx% 					;LB_GETCURSEL;
if(ErrorLevel!="FAIL") {
	Index:= ErrorLevel
	SendMessage,0x18A,%Index%,0,,ahk_id %hLbx%			;LB_GETTEXTLEN;
	Len:= ErrorLevel
	VarSetCapacity(LB_Text,Len<< !!A_IsUnicode,0)
	SendMessage,0x189,%Index%,% &LB_Text,,ahk_id %hLbx% ;LB_GETTEXT;
	Const:= StrSplit(StrGet(&LB_Text,Len),"`t")[1]
	Desc:= StrReplace(oStyles[Const].Desc,"\n", "`n")
	guicontrol,,GrpDesc,%Const%
	guicontrol,,TxtDesc,%Desc% ;msgbox % Desc " " Const;
} return,

ApplyStyle:
SendMessage,0x130B,0,0,,ahk_id %hStylesTab% ;TCM_GETCURSEL;
gui,submit,nohide
switch,nTab:= ErrorLevel +1 {
	case,"1" : guicontrolGet,Style,,EdtStyleSum
		winset,Style,% Style,ahk_id %g_hWnd%
		winset,RedRaw,,ahk_id %g_hWnd%
	case,"2" : guicontrolGet,ExStyle,,EdtExStyleSum
		winset,ExStyle,% ExStyle,ahk_id %g_hWnd%
		winset,RedRaw,,ahk_id %g_hWnd%
	case,"3" : guicontrolGet,ExtraStyle,,EdtExtraStyleSum
		wingetClass,Class,ahk_id %g_hWnd%
		switch,Class {
			case,"SysListView32"	: _msg:="0x1036"
			case,"SysTreeView32"	: _msg:="0x112C"
			case,"SysTabControl32"	: _msg:="0x1334"
			case,"ToolbarWindow32"	: _msg:="0x0454"
			case,"ComboBox"			: _msg:="0x040E"
		} sendmessage,% _msg,0,% ExtraStyle,,ahk_id %g_hWnd%	;CBEM_SETEXTENDEDSTYLE
		((errorlevel="Fail")? msgb0x(ErrorLevel,5))
} DllCall("SetWindowPos","Ptr",g_hWnd,"UInt",0,"Int",0,"Int",0,"Int",0,"Int",0,"UInt",0x17)
winset,RedRaw,,ahk_id %g_hWnd% ; 0x17 SWP_NOSIZE|SWP_NOMOVE|SWP_NOZORDER|SWP_NOACTIVATE
return,

ResetStyle:
nTab:= DllCall("SendMessage","Ptr",hStylesTab,"UInt",0x130B,"UInt",0,"UInt",0)+1
switch,nTab {
	case,"1" : guicontrol,Spy:,EdtStyleSum,% g_Style
	case,"2" : guicontrol,Spy:,EdtExStyleSum,% g_ExStyle
	case,"3" : guicontrol,Spy:,EdtExtraStyleSum,% g_ExtraStyle
} GoSub,LoadStyles
return,

GetExtraStyle(hWnd) {
	wingetClass,Class,ahk_id %hWnd%
	switch,class {
		case,"SysListView32"	: Message:= 0x1037	;LVM_GETEXTENDEDLISTVIEWSTYLE
		case,"SysTreeView32"	: Message:= 0x112D	;TVM_GETEXTENDEDSTYLE
		case,"SysTabControl32"	: Message:= 0x1335	;TCM_GETEXTENDEDSTYLE
		case,"ToolbarWindow32"	: Message:= 0x455	;TB_GETEXTENDEDSTYLE
		case,"ComboBox"			: Message:= 0x409	;CBEM_GETEXTENDEDSTYLE
	} SendMessage,% Message,0,0,,ahk_id %hWnd%
	return,format("0x{:08X}",ErrorLevel)
}

SetHandle:
mousegetpos,,,hw,cn,3
gui,Spy: Submit, NoHide
if (!Dragging&&WinExist("ahk_id " . EdtHandle)) {
	g_hWnd:=EdtHandle
	ShowWindowInfo()
} return,

; ((!Dragging&&WinExist("ahk_id " EdtHandle)); ? g_hWnd:= EdtHandle,ShowWindowInfo())
; SB_SetText(format("0x{:X}",g_hWnd),2); winget,fp,processpath,ahk_id %g_hWnd%
; SB_SetText(fp,1); return,

MenuHandler:
switch,A_ThisMenuItem {
	case,"Always on Top": winset,AlwaysOnTop,Toggle,ahk_id %g_hWnd% ;menu,CommandsMenu,% A_ThisMenuItem,check
	case,"Enabled" 		: DllCall("EnableWindow","Ptr",g_hWnd,"UInt",!IsWindowEnabled(g_hWnd))
	case,"Visible" 		: ShowWindow(g_hWnd,!IsWindowVisible(g_hWnd))
	case,"Close Window"	: WinClose,ahk_id %g_hWnd%
	case,"RedRaw Window": winset,RedRaw,,ahk_id %g_hWnd%
} return,

UpdateCommandsMenu() {
	global g_hWnd
	Visible:= IsWindowVisible(g_hWnd), Enabled:= IsWindowEnabled(g_hWnd)
	winget,ExStyle,ExStyle,ahk_id %g_hWnd%
	Menu,CommandsMenu,% (Visible)? "Check":"Uncheck",% "Visible"
	Menu,CommandsMenu,% (Enabled)? "Check":"Uncheck",% "Enabled"
	Menu,CommandsMenu,% (ExStyle &0x8)? "Check":"Uncheck",% "Always on Top" ;WS_EX_TOPMOST
	Menu,CommandsMenu,% (IsChild(g_hWnd))? "Disable":"Enable",% "Always on Top"
}

ShowCmdsMenu:
UpdateCommandsMenu(), Flags:= 0x8 ;TPM_TOPALIGN|TPM_RIGHTALIGN;
wingetPos,wx,wy,ww,wh,ahk_id %hSpyWnd%
ControlGetPos,cx,cy,cw,ch,,ahk_id %hBtnCmds%
x:= wx+cx+cw, y:= wy+cy+ch
DllCall("TrackPopupMenu","Ptr",hCommandsMenu,"UInt",0x8,"Int"
, x,"Int",y,"Int",0,"Ptr",hSpyWnd,"Ptr",0)
return,

SetText:
gui,Spy:Submit,NoHide
if(!IsChild(g_hWnd))
	ControlSetText,,% EdtText,ahk_id %g_hWnd%
else,winsetTitle,ahk_id %g_hWnd%,,% EdtText
return,

ShowBorder(hWnd,Duration:=-1,Color:= "0x3FBBE3",r:= 3) {
	global
	static init:=0, g_Borders:= [], Index
	Thread,Priority,1
	if(init=0)
		Loop,4 {
			Index:= A_Index +90
			gui,%Index%:New,-dpiscale +hWndhBorder%index% +0x80 -0x840000 -Caption +ToolWindow +AlwaysOnTop
			gui,%Index%:Color,% Color
			g_Borders.Push(hBorder%index%)
		} init:=1
	if(dragging)
		loop,1 { ;Local x,y,w,h,Index
			wingetPos,x,y,w,h,ahk_id %hWnd%
			(!w? return())
			if(dragging)
				loop,1 {
					try,gui,91:Show,% "na  x" (x-r) " y" (y-r) " w" (w+r+r) " h" r ; Top
					try,gui,92:Show,% "na  x" (x-r) " y" (y+h) " w" (w+r+r) " h" r ; Bottom
					try,gui,93:Show,% "na  x" (x-r) " y" y " w" r " h" h ; Left
					try,gui,94:Show,% "na  x" (x+w) " y" y " w" r " h" h ; Right
					fn:= func("flash_asshole") ;sleep,10 ;flash_asshole() ;Sleep,500
					settimer,% fn,-10 ;	Loop,4 { ;Index:= A_Index +90; try,gui,%Index%:hide
				}
			else,destroyBorders()
		}
}

IsBorder(hWnd) {
	Loop,% g_Borders.Length()
		if(g_Borders[ A_Index ]==hWnd)
			return,True
	return,False
}

destroyBorders() {
	global Dragging,hOldCursor,hSpyWnd
	Dragging:= False, ssleep(90)
	ssleep(90), DllCall("ReleaseCapture")
	DllCall("SetCursor","Ptr",hOldCursor)
	Loop,4
		try,gui,% A_Index +90 ":hide"
	MouseGetPos,,,, ClassNN
	ShowWindowInfo()
	if(g_Minimized)
		WinMove,ahk_id %hSpyWnd%,,,,,493
}

LoadClassInfo: ;Details;
gui,ListView,% hClassInfo
LV_Delete()
Setformat,Integer,H
wingetClass,ClassName,ahk_id %g_hWnd%
ClassStyle:= GetClassLong(g_hWnd,-26)
LV_Add("","Class name",ClassName)
LV_Add("","Control ID",GetWindowLong(g_hWnd,-12))
LV_Add("","Font",GetFont())
LV_Add("","Window procedure",GetClassLong(g_hWnd,-24))
LV_Add("","Instance Handle",GetClassLong(g_hWnd,-16))
LV_Add("","Class style",ClassStyle . GetClassStyles(ClassStyle))
LV_Add("","Icon Handle",GetClassLong(g_hWnd,-14))
LV_Add("","Small icon Handle",GetClassLong(g_hWnd,-34))
LV_Add("","Cursor Handle",GetCursor(GetClassLong(g_hWnd,-12)))
LV_Add("","Background Brush",GetSysColorName(GetClassLong(g_hWnd,-10)-1))
LV_Add("","Menu name",GetClassLong(g_hWnd,-8))
LV_Add("","Window extra bytes",GetClassLong(g_hWnd,-18))
LV_Add("","Class extra bytes",GetClassLong(g_hWnd,-20))
LV_Add("","Class atom",GetClassLong(g_hWnd,-32))
LV_Add("","User data",GetWindowLong(g_hWnd,-21))
Setformat,Integer,D
LV_Add("","Unicode",DllCall("IsWindowUnicode","Ptr",g_hWnd)? "Yes":"No")
LV_Add("","Tab order index",GetTabOrderIndex(g_hWnd))
LV_Add("","Help context ID",DllCall("GetWindowContextHelpId","Ptr",g_hWnd))
LV_Add("","Touch-capable",DllCall("IsTouchWindow","Ptr",g_hWnd,"Ptr",0))
return,

GetTabOrderIndex(hWnd) {
	hParent:= GetAncestor(hWnd), Index:= 1
	winget,ControlList,ControlListHwnd,ahk_id %hParent%
	Loop,Parse,ControlList,`n
	{
		if(!IsWindowVisible(A_LoopField))
			Continue,
		winget,Style,Style,ahk_id %A_LoopField%
		if !(Style &0x10000) ;WS_TABSTOP
			Continue,
		if(A_LoopField==hWnd)
			return,Index
		Index++
	} return,0
}

Tab_AddItem(hTab,Text) {
	VarSetCapacity(TCITEM,16 +A_PtrSize *3,0)
	NumPut(0x1,TCITEM,0,"UInt") ;TCIF_TEXT
	NumPut(&Text,TCITEM,8 +A_PtrSize,"Ptr")
	SendMessage,0x1304,0,0,,ahk_id %hTab% ;TCM_GETITEMCOUNT
	SendMessage,0x133E,% ErrorLevel,&TCITEM,,ahk_id %hTab% ;TCM_INSERTITEMW
}

ShowDescription:
guicontrolGet,Desc,,TxtDesc
guicontrolGet,Const,,GrpDesc
gui,Desc:New,LabelDesc -SysMenu OwnerSpy
gui,Color,black
gui,Margin,10,0
gui,Add,CheckBox,x0 y0 w0 h0
gui,Add,Picture,x12 y12 w32 h32 Icon5,% "user32.dll"
gui,Font,s12 c0x003399,Segoe UI
gui,Add,Text,x58 y15 w473 h23 +0x200,% Const
gui,Font ;gui,Font,s10,Segoe UI
gui,Add,Edit,vEdtDesc x55 y55 w444 Multi -VScroll -E0x200,% Desc
gui,Font
guicontrolGet,Pos,Pos,EdtDesc
pyy:= PosY +PosH +20
gui,Add,Text,hWndhFooter x-1 y%pyy% w533 h48 -Background
gui,Font,s9,Segoe UI
gui,Add,Button,gDescClose x432 yp+12 w88 h25 Default,% "&Close"
gui,Show,na w531,Style Description
return,

DescEscape:
DescClose:
gui,Desc:Destroy
return,

LoadMessages: ;WM_Messages;
wingetClass,Class,ahk_id %g_hWnd%
Constants:= GetMessages(Class)
gui,Spy:Default
guicontrolGet,CurrentItem,,CbxMessages,Text
guicontrol,,CbxMessages,|%Constants%
guicontrol,Text,CbxMessages,% CurrentItem ; Common Control Messages
if(Class=="ToolbarWindow32"||Class=="ReBarWindow32")
	guicontrol,,CbxMessages,% GetMessages("CommonControls")
(g_WinMsgs==""?	g_WinMsgs:= GetMessages("Window"))
guicontrol,,CbxMessages,% g_WinMsgs
return,

GetMessages(Class) {
	Static IniFile:= A_ScriptDir . "\Constants\Messages.ini"
	if(Class=="")
		return,
	IniRead,Section,% IniFile,% Class
	Constants:= ""
	Loop,Parse,Section,`n
		Constants .=StrSplit(A_LoopField,"=")[1] . "|"
	Sort,Constants,D|
	return,Constants
}

SendMsg:
PostMsg:
gui,Spy:Submit,NoHide
Function:= (A_ThisLabel=="SendMsg")? "SendMessage":"PostMessage"
if CbxMessages is Not Number
	((SubStr(CbxMessages,1,3)=="WM_")? ClassName:= "Window"
	: ClassName:= GetClassName(g_hWnd))
IniRead,Message,%A_ScriptDir%\Constants\Messages.ini,% ClassName,% CbxMessages
if(Message=="ERROR") {
	gui,Spy:+OwnDialogs
	MsgBox,0x10,% AppName,% CbxMessages ": invalid message."
	return,
} else,Message:= CbxMessages
DataTypes:= {"Number": "UPtr", "String": "WStr"}
wType:= DataTypes[wParamType], lType:= DataTypes[lParamType]
Result:= DllCall(Function,"Ptr",g_hWnd,"UInt",Message,wType,wParam,lType,lParam)
guicontrol,,Result,% Result
return,

LoadProperties: ;Details tab;
gui,Spy:ListView,% hPropInfo
LV_Delete()
Callback:= RegisterCallback("PropEnumProcEx","F")
DllCall("EnumPropsEx","Ptr",g_hWnd,"Ptr",Callback,"UInt",lParam:= 0)
return,

PropEnumProcEx(hWnd,lpszString,hData,dwData) {
	global hPropInfo
	Property:= StrGet(lpszString,"UTF-16")
	(Property==""? Property:= lpszString . " (Atom)")
	gui,Spy:ListView,% hPropInfo
	LV_Add("",Property,format("0x{:08X}",hData))
	return, True
}

LoadExtraInfo:
gui,Spy:ListView,% hExtraInfo
LV_Delete()
While(LV_GetText(foo,0,1))
	LV_DeleteCol(1)
wingetClass,Class,ahk_id %g_hWnd%
if(Class=="Edit"||InStr(Class,"RICHEDIT")) {
	LV_InsertCol(1,"225","Property")
	,LV_InsertCol(2,"275","Value")
	ControlGetText,Text,,ahk_id %g_hWnd%
	Length:= StrLen(Text) . " characters"
	ControlGet,Lines,LineCount,,,ahk_id %g_hWnd%
	ControlGet,CurLine,CurrentLine,,,ahk_id %g_hWnd%
	ControlGet,CurCol,CurrentCol,,,ahk_id %g_hWnd%
	LV_Add("","Length",Length)
	,LV_Add("","Current line",CurLine)
	,LV_Add("","Current column",CurCol)
	,LV_Add("","Line count",Lines)
	,LV_Add("","Text Limit",SendMsg(0xD5) . " bytes") ;EM_GETLIMITTEXT
	,LV_Add("","Modified",{0: "False", 1: "True"}[SendMsg(0xB8)]) ;EM_GETMODIFY
} else,if (InStr(Class, "Scintilla")) {
	LV_InsertCol(1,"225","Property")
	,LV_InsertCol(2,"272","Value")
	,LexerName:= Scintilla_GetLexerLanguage(g_hWnd),	CodePage:= SendMsg(2137) ;SCI_GETCODEPAGE
	,Pos:= SendMsg(2008), Line:= SendMsg(2166,Pos), Char:= SendMsg(2007,Pos)
	,Size:= formatBytes(SendMsg(2006),Sep,"B",0) . " bytes"
	,SelSize:= formatBytes(SendMsg(2161,0,0)-1,Sep,"B",0) . " bytes"
	LV_Add("","Lexer",SendMsg(4002) . (LexerName != ""? " (" . LexerName . ")" : "")) ;SCI_GETLEXER
	,LV_Add("","Current position",Pos +1) ;SCI_GETCURRENTPOS
	,LV_Add("","Char at position",Char . " (""" . Chr(Char) . """)") ;SCI_GETCHARAT
	,LV_Add("","Style at position",SendMsg(2010,Pos)) ;SCI_GETSTYLEAT
	,LV_Add("","Current line",Line +1) ;SCI_LINEFROMPOSITION
	,LV_Add("","Position from line",SendMsg(2167,Line) +1) ;SCI_POSITIONFROMLINE
	,LV_Add("","Line end position",SendMsg(2136,Line) +1) ;SCI_GETLINEENDPOSITION
	,LV_Add("","Line length",SendMsg(2350,Line)) ; SCI_LINELENGTH
	,LV_Add("","Current column",SendMsg(2129,Pos) +1) ;SCI_GETCOLUMN
	,LV_Add("","Line count",SendMsg(2154)) ;SCI_GETLINECOUNT
	,LV_Add("","Document size",Size) ;SCI_GETLENGTH
	,LV_Add("","File encoding",(CodePage==65001? "UTF-8 (65001)" : CodePage)) ;SCI_GETCODEPAGE
	,LV_Add("","Modified",SendMsg(2159)? "True":"False") ;SCI_GETMODIFY
	,LV_Add("","Read only",SendMsg(2140)? "True":"False") ;SCI_GETREADONLY
	,LV_Add("","Wrap mode",SendMsg(2269)) ;SCI_GETWRAPMODE
	,LV_Add("","Tab width",SendMsg(2121)) ;SCI_GETTABWIDTH
	,LV_Add("","Indent with spaces",!SendMsg(2125)? "True":"False") ;SCI_GETUSETABS
	,LV_Add("","Show indentation guides",SendMsg(2133)? "True":"False") ;SCI_GETINDENTATIONguiDES
	,LV_Add("", "EOL mode",{0: "CRLF",1: "CR",2: "LF"}[SendMsg(2030)]) ;SCI_GETEOLMODE
	,LV_Add("", "Paste convert EOL",SendMsg(2468)? "True":"False") ;SCI_GETPASTECONVERTENDINGS
	,LV_Add("", "Overtype mode",SendMsg(2187)? "1 (overtype)" : "0 (insert)") ; SCI_GETOVERTYPE
	,LV_Add("", "Anchor position",SendMsg(2009) +1) ;SCI_GETANCHOR
	,LV_Add("", "Selection start",SendMsg(2143) +1) ;SCI_GETSELECTIONSTART
	,LV_Add("", "Selection end",SendMsg(2145) +1) ;SCI_GETSELECTIONEND
	,LV_Add("", "Selected text length", SelSize) ;SCI_GETSELTEXT
	,LV_Add("", "Selection mode",SendMsg(2423)) ;SCI_GETSELECTIONMODE
	,LV_Add("", "Selection is rectangular",SendMsg(2372)? "True":"False") ;SCI_SELECTIONISRECTANGLE
	,LV_Add("", "Virtual space options",SendMsg(2597)) ;SCI_GETVIRTUALSPACEOPTIONS
	,LV_Add("", "Rectangular selection modifier",SendMsg(2599)) ;SCI_GETRECTANGULARSELECTIONMODIFIER
	 LV_Add("", "Mouse rectangular selection",SendMsg(2669)? "True":"False")	;SCI_GETMOUSESELECTIONRECTANGULARSWITCH
	,LV_Add("", "Selection start line position",SendMsg(2424,Line) +1) ;SCI_GETLINESELSTARTPOSITION
	,LV_Add("", "Selection end line position",SendMsg(2425,Line) +1) ;SCI_GETLINESELENDPOSITION
	,LV_Add("", "Multiple selection",SendMsg(2564)? "True":"False") ;SCI_GETMULTIPLESELECTION
	,LV_Add("", "Additional selection typing",SendMsg(2566)? "True":"False") ;SCI_GETADDITIONALSELECTIONTYPING
	,LV_Add("", "Multipaste",SendMsg(2615)) ;SCI_GETMULTIPASTE
	,LV_Add("", "Line height",SendMsg(2279,Line)) ;SCI_TEXTHEIGHT
	,LV_Add("", "Baseline extra ascent",SendMsg(2526)) ;SCI_GETEXTRAASCENT
	,LV_Add("", "Baseline extra descent",SendMsg(2528)) ;SCI_GETEXTRADESCENT
	,LV_Add("", "Lines on screen",SendMsg(2370)) ;SCI_LINESONSCREEN
	,LV_Add("", "First visible line",SendMsg(2152) +1) ;SCI_GETFIRSTVISIBLELINE
	,LV_Add("", "Current line wrap count",SendMsg(2235,Line)) ;SCI_WRAPCOUNT
	,LV_Add("", "Mouse hover time",SendMsg(2265)) ; SCI_GETMOUSEDWELLTIME
	,LV_Add("", "Word start position",SendMsg(2266,Pos,1) +1) ;SCI_WORDSTARTPOSITION
	,LV_Add("", "Word end position",SendMsg(2267,Pos,1) +1) ;SCI_WORDENDPOSITION
	,LV_Add("", "Autocomplete ignore case",SendMsg(2116)? "True":"False") ; SCI_AUTOCGETIGNORECASE
	,LV_Add("", "Autocomplete list presorted",SendMsg(2661)) ;SCI_AUTOCGETORDER
	,LV_Add("", "Autocomplete list max rows",SendMsg(2211)) ;SCI_AUTOCGETMAXHEIGHT
	 LV_Add("", "Position before",SendMsg(2417,Pos) +1) ;SCI_POSITIONBEforE
	,LV_Add("", "Position after",SendMsg(2418,Pos) +1) ;SCI_POSITIONAFTER
	,LV_Add("", "Current indicator",SendMsg(2501)) ;SCI_GETINDICATORCURRENT
	,LV_Add("", "Target start",SendMsg(2191) +1) ;SCI_GETTARGETSTART
	,LV_Add("", "Target end",SendMsg(2193) +1) ;SCI_GETTARGETEND
	,LV_Add("", "Search flags",SendMsg(2199)) ;SCI_GETSEARCHFLAGS
	,LV_Add("", "Error status",SendMsg(2383)) ;SCI_GETSTATUS
	,LV_Add("", "Font quality",SendMsg(2612)) ;SCI_GETFONTQUALITY
	,LV_Add("", "Technology (drawing API)",SendMsg(2631)) ;SCI_GETTECHNOLOGY
	,LV_Add("", "Buffered drawing",SendMsg(2034)? "True":"False") ;SCI_GETBUFFEREDDRAW
	,LV_Add("", "Zoom factor",SendMsg(2374)) ;SCI_GETZOOM
	,LV_Add("", "Edge mode",SendMsg(2362)) ;SCI_GETEDGEMODE
	,LV_Add("", "Edge column",SendMsg(2360) +1) ;SCI_GETEDGECOLUMN
	,LV_Add("", "Scroll width",SendMsg(2275)) ;SCI_GETSCROLLWIDTH
	,LV_Add("", "Scroll width tracking",SendMsg(2517)? "True":"False") ;SCI_GETSCROLLWIDTHTRACKING
	,LV_Add("", "End at last line",SendMsg(2278)? "True":"False") ;SCI_GETENDATLASTLINE
	,LV_Add("", "View white space",SendMsg(2020)) ;SCI_GETVIEWWS
	,LV_Add("", "White space size",SendMsg(2087)) ;SCI_GETWHITESPACESIZE
	,LV_Add("", "View EOL characters",SendMsg(2355)? "True":"False") ;SCI_GETVIEWEOL
	,LV_Add("", "Caret width",SendMsg(2189)) ;SCI_GETCARETWIDTH
	,LV_Add("", "Caret blinking rate",SendMsg(2075) . " ms") ; SCI_GETCARETPERIOD
	,LV_Add("", "Markers in current line",SendMsg(2046, Line)) ; SCI_MARKERGET
	,LV_Add("", "Automatic fold",SendMsg(2664)) ;SCI_GETAUTOMATICFOLD
	,LV_Add("", "All lines visible",SendMsg(2236)? "True":"False") ;SCI_GETALLLINESVISIBLE	;LV_Add("", "", SendMsg()) ;
	Loop 5 { ;The maximum number of margins
		i:= A_Index -1
		LV_Add("", "Margin " . A_Index . " - type, width, mask"
		, SendMsg(2241,i) . ", " . SendMsg(2243,i) . ", " . SendMsg(2245,i))
		;SCI_GETMARGINTYPEN,SCI_GETMARGINWIDTHN,SCI_GETMARGINMASKN
	}
} else,if(Class=="ToolbarWindow32") {
	LV_InsertCol(1,"41", "Index")
	,LV_InsertCol(2,"85", "Command ID")
	,LV_InsertCol(3,"212","Button Text")
	,Items:= GetToolbarItems(g_hWnd)
	for,Each,Item in Items
		LV_Add("",A_Index,Item.ID,Item.String)
} else,if(Class=="SysHeader32") {
	LV_InsertCol(1,"42", "Index")
	,LV_InsertCol(2,"48", "Width")
	,LV_InsertCol(3,"248","Text")
	,Items:= GetHeaderInfo(g_hWnd)
	for,Each,Item in Items
		LV_Add("",A_Index,Item.Width,Item.Text)
} else,if(Class=="msctls_progress32") {
	LV_InsertCol(1,"169","Property")
	,LV_InsertCol(2,"169","Value")
	,LV_Add("","Range",SendMsg(0x407,1) . " - " . SendMsg(0x407,0)) ;PBM_GETRANGE
	,LV_Add("","Position",SendMsg(0x408)) ;PBM_GETPOS
	,LV_Add("","Step increment",SendMsg(0x40D)) ;PBM_GETSTEP
	,LV_Add("","State",{1: "Normal", 2: "Error", 3: "Paused"}[SendMsg(0x411)]) ;PBM_GETSTATE
} else,if(Class ~="ListBox"||Class ~="ComboBox") {
	LV_InsertCol(1,"38", "Line")
	,LV_InsertCol(2,"300","Text")
	ControlGet,ItemList,List,,,ahk_id %g_hWnd%
	Loop,Parse,ItemList,`n
		LV_Add("",A_Index,A_LoopField)
} else,if(Class=="msctls_statusbar32") {
	LV_InsertCol(1,"38", "Part")
	,LV_InsertCol(2,"300","Text")
	SB_Text:= GetStatusBarText(g_hWnd)
	Loop,Parse,SB_Text,|
		LV_Add("", A_Index, A_LoopField)
} else,if(Class=="SysTabControl32") {
	LV_InsertCol(1,"42", "Index")
	,LV_InsertCol(2,"296","Text")
	Tabs:= ControlGetTabs(g_hWnd)
	Loop,% Tabs.Length()
		LV_Add("",A_Index,Tabs[A_Index])
} else,if(Class=="SysListView32") {
	SendMessage,0x101F,0,0,,ahk_id %g_hWnd% ; LVM_GETHEADER
	hHeader:= ErrorLevel
	SendMessage,0x1200,0,0,,ahk_id %hHeader% ; HDM_GETITEMCOUNT
	Columns:= ErrorLevel +1
	Loop,% Columns {
		ColTitle:= A_Index==1? "Index":"Column " . A_Index -1
		LV_InsertCol(A_Index,"",ColTitle)
	} ControlGet,ItemList,List,,,ahk_id %g_hWnd%
	Loop,Parse,ItemList,`n
		Items:= StrSplit(A_LoopField,A_Tab)
		, LV_Add("",A_Index,Items*)
	Loop,% Columns
		LV_ModifyCol(A_Index,"AutoHdr")
} ;GetMenu return value: if the window is a child window, the return, value is undefined.
if(!IsChild(g_hWnd) && hMenu:= GetMenu(g_hWnd))
	guicontrol,Enable,% hBtnMenu
else,guicontrol,Disable,% hBtnMenu
return,

SendMsg(Message,wParam:=0,lParam:=0) {
	SendMessage,% Message,% wParam,% lParam,,ahk_id %g_hWnd%
	return,ErrorLevel
}

GetToolbarItems(hToolbar) {
	winget,PID,PID,ahk_id %hToolbar%
	if(!hProc:= DllCall("OpenProcess","UInt",0x438,"Int",False,"UInt",PID,"Ptr"))
		return,
	if(A_Is64bitOS)
		Try,DllCall("IsWow64Process","Ptr",hProc,"Int*",Is32bit:= true)
	else,Is32bit:= True
	RPtrSize:= Is32bit? 4:8
	TBBUTTON_SIZE:= 8 +(RPtrSize*3)
	SendMessage,0x418,0,0,,ahk_id %hToolbar% ; TB_BUTTONCOUNT
	ButtonCount:= ErrorLevel
	IDs:= [] ; Command IDs
	Loop,% ButtonCount {
		Address:= DllCall("VirtualAllocEx","Ptr",hProc,"Ptr",0,"UPtr"
		,	TBBUTTON_SIZE,"UInt",0x1000,"UInt",4,"Ptr")
		SendMessage,0x417,% A_Index -1,Address,,ahk_id %hToolbar% ; TB_GETBUTTON
		if(ErrorLevel==1) {
			VarSetCapacity(TBBUTTON,TBBUTTON_SIZE,0)
			DllCall("ReadProcessMemory","Ptr",hProc,"Ptr",Address,"Ptr"
			,	&TBBUTTON,"UPtr",TBBUTTON_SIZE,"Ptr",0)
			IDs.Push(NumGet(&TBBUTTON,4,"Int"))
		} DllCall("VirtualFreeEx","Ptr",hProc,"Ptr",Address,"UPtr",0,"UInt",0x8000) ; MEM_RELEASE
	} ToolbarItems:= []
	Loop,% IDs.Length() {
		ButtonID:= IDs[A_Index], BufferSize:= 128 ;SendMessage 0x44B,% ButtonID,0,,ahk_id %hToolbar% ;TB_GETBUTTONTEXTW ;BufferSize:= ErrorLevel *2
		Address:= DllCall("VirtualAllocEx","Ptr",hProc,"Ptr",0,"UPtr",BufferSize,"UInt",0x1000,"UInt",4,"Ptr")
		SendMessage,0x44B,% ButtonID,Address,,ahk_id %hToolbar% ; TB_GETBUTTONTEXTW
		VarSetCapacity(Buffer,BufferSize,0)
		DllCall("ReadProcessMemory","Ptr",hProc,"Ptr",Address,"Ptr",&Buffer,"UPtr",BufferSize,"Ptr",0)
		ToolbarItems.Push({"ID": IDs[A_Index],"String": Buffer})
		DllCall("VirtualFreeEx","Ptr",hProc,"Ptr",Address,"UPtr",0,"UInt",0x8000) ; MEM_RELEASE
	} 	DllCall("CloseHandle","Ptr",hProc)
	return,ToolbarItems
}

LoadWindowsTab:
GoSub,LoadChildList
GoSub,LoadSiblingList
hParent:= GetParent(g_hWnd)
ParentClass:= (hParent)? " (" GetClassName(hParent) . ")" : ""
ParentLink:= "<a>" . format("0x{:08X}",hParent) . "</a>" . ParentClass
guicontrol,Spy:,ParentLink,% ParentLink
hOwner:= GetOwner(g_hWnd)
OwnerClass:= (hOwner)? " (" GetClassName(hOwner) . ")" : ""
OwnerLink:= "<a>" . format("0x{:08X}",hOwner) . "</a>" . OwnerClass
guicontrol,Spy:,OwnerLink,% OwnerLink
return,

WindowsTabHandler:
if(A_guiEvent=="N") {
	Code:= NumGet(A_EventInfo +0,A_PtrSize *2,"Int")
	if (Code==-551) { ; TCN_SELCHANGE
		SendMessage,0x130B,0,0,,ahk_id %hWindowsTab% ; TCM_GETCURSEL
		tt(nTab:= Errorlevel +1)
		switch,nTab:= Errorlevel +1 {
			case,"1" : guicontrol,Hide,% hSiblingList
				guicontrol,Show,% hChildList
			default  : guicontrol,Hide,% hChildList
				guicontrol,Show,% hSiblingList
}	}	}
return,

UpdateTitleBar:
wingetClass,Class,ahk_id %g_hWnd%
hWnd:= format("0x{:X}", g_hWnd)
winsetTitle,ahk_id %hSpyWnd%,,% AppName " [" hWnd "," Class "]"
return,

ShowWindowInfoIfExist(hWnd) { ;static cnt:= 0;cnt++
	if(IsWindow(hWnd))
		g_hWnd:= hWnd, ShowWindowInfo()
	else {
		gui,Spy: +OwnDialogs
		MsgBox,0x40010,% AppName,% "Invalid window Handle.",1.5
	}
}

GetHeaderInfo(hHeader) { ;return object containing the text and width of each item of a remote SysHeader32 control
	Static MAX_TEXT_LENGTH:= 260, MAX_TEXT_SIZE:= MAX_TEXT_LENGTH *(A_IsUnicode ? 2:1)
	winget,PID,PID,ahk_id %hHeader%
	if(!(hProc:= DllCall("OpenProcess","UInt",0x438,"Int",False,"UInt",PID,"Ptr")))
		return,	;Open the process for read/write and query info;
	if(A_Is64bitOS) ;PROCESS_VM_READ|PROCESS_VM_WRITE|PROCESS_VM_OPERATION|PROCESS_QUERY_INforMATION;
		Try,DllCall("IsWow64Process","Ptr",hProc,"Int*",Is32bit:= True)
	else,Is32bit:= True
	RPtrSize:= Is32bit? 4:8
	cbHDITEM:= (4 *6) +(RPtrSize *6)
	remote_item:= DllCall("VirtualAllocEx","Ptr",hProc,"Ptr",0	;Allocate a buffer in the remote process.;
						, "UPtr",cbHDITEM +MAX_TEXT_SIZE
						, "UInt",0x1000,"UInt",4,"Ptr") ;MEM_COMMIT,PAGE_READWRITE;
	remote_text:= remote_item +cbHDITEM
	VarSetCapacity(HDITEM,cbHDITEM,0)	;Prepare HDITEM structure.
	NumPut(0x3,HDITEM,0,"UInt") ; mask HDI_WIDTH|HDI_TEXT
	NumPut(remote_text,HDITEM,8, "Ptr") ;pszText
	NumPut(MAX_TEXT_LENGTH,HDITEM,8 +RPtrSize *2,"Int") ;cchTextMax
	DllCall("WriteProcessMemory","Ptr",hProc,"Ptr",remote_item,"Ptr",&HDITEM,"UPtr",cbHDITEM,"Ptr",0)
	HDInfo:= {}	;Write the struct into remote buffer.
	VarSetCapacity(HDText,MAX_TEXT_SIZE)
	SendMessage,0x1200,0,0,,ahk_id %hHeader% ;HDM_GETITEMCOUNT
	Loop,% (ErrorLevel !="FAIL")? ErrorLevel:0 {
		SendMessage,% (A_IsUnicode)? 0x120B:0x1203,A_Index -1,remote_item,,ahk_id %hHeader% ;HDM_GETITEMW
		if(ErrorLevel==1) { ;Success ;Retrieve item text.
			DllCall("ReadProcessMemory","Ptr",hProc,"Ptr",remote_item,"Ptr",&HDITEM,"UPtr",cbHDITEM,"Ptr",0)
			DllCall("ReadProcessMemory","Ptr",hProc,"Ptr",remote_text,"Ptr",&HDText,"UPtr",MAX_TEXT_SIZE,"Ptr",0)
		} else,HDText:= ""
		HDInfo.Push({"Width":NumGet(HDITEM,4,"UInt"),"Text":HDText})
	} ;Release the remote memory and Handle.
	DllCall("VirtualFreeEx","Ptr",hProc,"Ptr",remote_item,"UPtr",0,"UInt",0x8000) ;MEM_RELEASE
	DllCall("CloseHandle","Ptr",hProc)
	return,HDInfo
}

SetMouseCoordMode:
guicontrolGet,g_MouseCoordMode,Spy:,MouseCoordMode
return,

FindaHandler: ;==""""""""""""""start find tool"""""""""""""""""==
Dragging:= True ; tt("dadadadadadad")
hOldCursor:= DllCall("SetCursor","Ptr",img["ani_syringe"],"Ptr")
DllCall("SetCapture","Ptr",hSpyWnd)
return,

FindOK:
gui,ListView,% hFindList
LV_GetText(hWnd,LV_GetNext())
guicontrol,Spy:,EdtHandle,% hWnd
WinActivate,ahk_id %hSpyWnd%
gui,Find:Hide
return,

FListhandla:
(A_guiEvent=="DoubleClick"?	GoSub("FindOK"))
return,

FindClose:
FindEscape:
g_findgui_isopen:= False
;exitapp
WinAnimate(hFindDlg,"hide slide hneg",200) ;gui,Find:Hide
return,

FindWindow:
gui,Find:Submit,NoHide
gui,ListView,% hFindList
guicontrol -RedRaw,% hFindList
LV_Delete()
winget,WinList,List
Loop,% WinList {
	hThisWnd:= WinList%A_Index%
	if(hThisWnd==hFindDlg)
		Continue,
	wingetClass,WClass,ahk_id %hThisWnd%
	wingetTitle,WTitle,ahk_id %hThisWnd%
	winget,WProcess,ProcessName, ahk_id %hThisWnd%
	winget,WProcPID,PID,ahk_id %hThisWnd%
	if(MatchCriteria(WTitle,WClass,IsNumber(CbxFindByProcess)? WProcPID : WProcess))
		LV_Add("",hThisWnd,WClass,WTitle,WProcess)
	winget,ControlList,ControlListHwnd,ahk_id %hThisWnd%
	Loop,Parse,ControlList, `n
	{
		ControlGetText,CText,,ahk_id %A_LoopField%
		wingetClass,CClass,ahk_id %A_LoopField%
		winget,CProcess,ProcessName, ahk_id %A_LoopField%
		winget,CProcPID,PID,ahk_id %A_LoopField%
		if(MatchCriteria(CText,CClass,IsNumber(CbxFindByProcess)? CProcPID : CProcess))
			LV_Add("",A_LoopField,CClass,CText,CProcess)
	}
}

guicontrol +RedRaw, %hFindList%
return,

ShowFindDlg:
if(FindDlgExist) {
	gui,Find:Show,na
} else {
	gui,Find:New,LabelFind hWndhFindDlg +alwaysontop
	gui,Font,s9,continuum ;gui,Color,black
	gui,Add,Text,x15 y16 w81 h23 +0x200, Text or Title:
	gui,Add,Edit,hWndhEdtFindByText vEdtFindByText gFindWindow x144 y17 w286 h21
	gui,Add,CheckBox,vChkFindRegEx x441 y16 w120 h23, Regular Expression
	gui,Add,Text,x15 y54 w79 h23 +0x200, Class Name:
	gui,Add,ComboBox,vCbxFindByClass gFindWindow x144 y54 w286
	gui,Add,Text,x15 y93 w110 h23 +0x200, Process ID or Name:
	gui,Add,ComboBox,vCbxFindByProcess gFindWindow x144 y93 w286
	gui,Add,ListView,hWndhFindList gFListhandla x10 y130 w554 h185 +LV0x14000
	,	hWnd|Class|Text|Process
	LV_ModifyCol(1,0), LV_ModifyCol(2,133),
	LV_ModifyCol(3,285), LV_ModifyCol(4,112)
	gui,Add,Text,x-1 y329 w576 h49 +Border -Background
	gui,Add,Button,gFindOK x381 y342 w88 h25 Default, &OK
	gui,Add,Button,gFindClose x477 y342 w88 h25, &Cancel
	gui,Show,w574 h377, Find Window
	SetExplorerTheme(hFindList)
	FindDlgExist:= True
} global Classes:= [] ; Unique class names
winget,WinList, List
Loop,% WinList{
	hThisWnd:= WinList%A_Index%
	wingetClass,WClass,ahk_id %hThisWnd%
	AddUniqueClass(WClass)
	winget ControlList,ControlListHwnd,ahk_id %hThisWnd%
	Loop,Parse,ControlList, `n
	{
		wingetClass CClass, ahk_id %A_LoopField%
		AddUniqueClass(CClass)
	}
} ClassList:= ""
Loop,% Classes.Length()
	ClassList.=Classes[A_Index] . "|"
guicontrol,,CbxFindByClass,% ClassList
Processes:= [] ; Unique process names
for,Process in ComObjGet("winmgmts:").ExecQuery("Select * from Win32_Process") {
	if(Process.ProcessID<10)
		Continue
	Unique:= True
	Loop,% Processes.Length()
		if(Process.Name==Processes[A_Index]) {
			Unique:= False
			Break,
		}
	(Unique? Processes.Push(Process.Name))
} MaxItems:= Processes.Length(), ProcList:= ""
Loop,% MaxItems
	ProcList.=Processes[MaxItems - A_Index + 1] . "|"
guicontrol,,CbxFindByProcess,% ProcList
return, ;==""""""""""""""""""""""""""end find tool""""""""""""""""""""""""""==

GoogleSearch:
guicontrolGet,Message,,CbxMessages
((Message=="")?	return())
if(SubStr(Message,1,3)=="SCI") {
	URL:= "http://www.scintilla.org/ScintillaDoc.html#"
	try,Run,%URL%%Message% ;"https://www.google.com/search?q="
} else,try,Run,% URL:= googlelucky(Message)
return,

Cpy2Clip:
gui,Spy:Default
CRLF:= "`r`n", Output:= ""
switch,tab {
	case,1 : gui,Spy:Submit,NoHide
		Output.="[General]" . CRLF
		,Output.="Handle:`t" . EdtHandle . CRLF
		,Output.="Text:`t" . EdtText .	 CRLF
		,Output.="Class:`t" . EdtClass . CRLF
		,Output.="ClassNN:`t" . EdtClassNN . CRLF
		,Output.="Style:`t" . EdtStyle . CRLF
		,Output.="Extended:`t" . EdtExStyle . CRLF
		,Output.="Position:`t" . EdtPosition . CRLF
		,Output.="Size:`t" . EdtSize .	CRLF
		,Output.="Cursor:`t" . EdtCursor . CRLF
		ControlGet,ProcInfo,List,,,ahk_id %hProcInfo%
		Output .= "[Process]" . CRLF . ProcInfo
	case,2 : ControlGet,PropInfo,List,,,ahk_id %hPropInfo% ;Details;
		ControlGet,ClassInfo,List,,,ahk_id %hClassInfo%
		Output .= "[Details]" . CRLF . ClassInfo . CRLF . CRLF . "[Properties]" . CRLF . PropInfo
	case,4 : ControlGet,ExtraInfo,List,,,ahk_id %hExtraInfo% ;""""""""""""""Extra""""""""""""""";
		Output .= "[Extra]" . CRLF . ExtraInfo
	case,5 : ControlGet,Child,List,,,ahk_id %hChildList% ;""""""!!!""""""Windows""""""""""!!"""";
		(Child!=""? Output .= "[Child]" . CRLF . Child . CRLF . CRLF)
		ControlGet,Sibling,List,,,ahk_id %hSiblingList%
		(Sibling!=""? Output .= "[Sibling]" . CRLF . Sibling . CRLF . CRLF)
		guicontrolGet,ParentLink,,ParentLink
		Output .= "Parent:`t" . RegExReplace(ParentLink, "\<\/?a\>") . CRLF
		guicontrolGet,OwnerLink,,OwnerLink
		Output .= "Owner:`t" . RegExReplace(OwnerLink, "\<\/?a\>")
	case,6 : if(g_Style) { ;"""""""""""""""Styles"""""""""""""""";
			guicontrolGet,Styles,,% hLbxStyles
			Output .="`t[Styles]" . CRLF . StrReplace(Styles, "|", CRLF) . CRLF . CRLF
		} if(g_ExStyle) {
			guicontrolGet,ExStyles,,% hLbxExStyles
			Output .="`t[ExStyles]" . CRLF . StrReplace(ExStyles, "|", CRLF) . CRLF . CRLF
		} if(g_ExtraStyle) {
			guicontrolGet,ExtraStyles,,% hLbxExtraStyles
			Output .="[ExtraStyles]" . CRLF . StrReplace(ExtraStyles, "|", CRLF)
		}
} Clipboard:= RTrim(Output,CRLF)
return,

Screenshot:
if(!WinExist("ahk_id" . g_hWnd)) {
	gui,Spy:+OwnDialogs
	MsgBox,0x40010,Error,Window no longer exists.
	return,
} if(IsChild(g_hWnd)) {
	WinActivate,% "ahk_id" . GetAncestor(g_hWnd)
	Sleep,100
	if(g_ShowBorder) {
		ShowBorder(g_hWnd,1,g_BorderColor,g_BorderWidth)
		Sleep,100
		Send,!{PrintScreen}
		Sleep,200
	} else,hbmp:= CaptureWindow(hSpyWnd,g_hWnd)
} else {
	WinActivate,ahk_id %g_hWnd%
	Sleep,100
	Send,!{PrintScreen}
} Loop,4 {
	Index:= A_Index +90
	gui,%Index%:hide
} WinActivate,ahk_id %hSpyWnd%
gui,Spy:+OwnDialogs
MsgBox,0x4004,% AppName,Snip copied to the clipboard.`n Save additionally?,5
ifMsgBox,Yes, {
	FileSelectFile,OutputVar,S,a_desktop . "\" . ProcTxT,% "Save " ProcTxT
	Gdip_SaveBitmapToFile(hBmp,OutputVar,85)
} else,(ifmsgbox,no||ifmsgbox,timeout? return())
return,

CaptureWindow(hwndOwner,hwnd) {
	VarSetCapacity(RECT,16,0)
	DllCall("GetWindowRect","Ptr",hwnd,"Ptr",&RECT)
	width	:= NumGet(RECT,8,"Int") -NumGet(RECT,0,"Int")
	height	:= NumGet(RECT,12,"Int")-NumGet(RECT,4,"Int")
	hdc		:= DllCall("GetDC","Ptr",0,"Ptr")
	hdcMem	:= DllCall("CreateCompatibleDC","Ptr",hdc,"UPtr")
	hBmp	:= DllCall("CreateCompatibleBitmap","Ptr",hdc,"Int",width,"Int",height,"UPtr")
	hdcOld	:= DllCall("SelectObject","Ptr",hdcMem,"Ptr",hBmp)
	DllCall("BitBlt","Ptr",hdcMem,"Int",0,"Int",0,"Int",width,"Int",height,"Ptr",hdc,"Int"
	,Numget(RECT,0,"Int"),"Int",Numget(RECT,4,"Int"),"UInt",0x00CC0020) ;SRCCOPY
	DllCall("SelectObject","Ptr",hdcMem,"Ptr",hdcOld)
	DllCall("OpenClipboard","Ptr",hwndOwner) ; Clipboard owner
	DllCall("EmptyClipboard")
	DllCall("SetClipboardData","UInt",0x2,"Ptr",hBmp) ; CF_BITMAP
	DllCall("CloseClipboard")
	DllCall("ReleaseDC","Ptr",0,"Ptr",hdc)
	return,hBmp
}

GetScrollInfo(hWnd,fnBar:= 1) { ; fnbar: 0 = horizontal, 1 = vertical, 2 = hWnd is a scroll bar
	Local o:= {}
	NumPut(VarSetCapacity(SCROLLINFO,28,0),SCROLLINFO,0,"UInt")
	NumPut(0x1F,SCROLLINFO,4,"UInt") ; fMask: SIF_ALL
	DllCall("GetScrollInfo","Ptr",hWnd,"Int",fnBar,"Ptr",&SCROLLINFO)
	o.Min:= NumGet(SCROLLINFO,8,"Int"), o.Max := NumGet(SCROLLINFO,12,"Int")
	o.Page:= NumGet(SCROLLINFO,16,"UInt"), o.Pos := NumGet(SCROLLINFO,20,"Int")
	return,o
}

ShowScrollBarInfo:
V:= H:= "No"
winget,Style,Style,ahk_id %g_hWnd%
wingetClass,Class,ahk_id %g_hWnd%
if(Class=="ScrollBar") {
	if(Style &1) ;SBS_VERT;
		V:= "Yes", VSB:= GetScrollInfo(g_hWnd,2)
	else,H:= "Yes", HSB:= GetScrollInfo(g_hWnd,2)
} else,(Style &0x200000? V:= "Yes"), (Style &0x100000? H:= "Yes") ;WS_HSCROLL;WS_VSCROLL;
	, HSB:= GetScrollInfo(g_hWnd,0), VSB:= GetScrollInfo(g_hWnd,1)
HPercent:= (HSB.Pos)? " (" . Round(HSB.Pos / (HSB.Max - HSB.Min) * 100) . "%)" :""
VPercent:= (VSB.Pos)? " (" . Round(VSB.Pos / (VSB.Max - VSB.Min) * 100) . "%)" :""
gui,ScrollInfo: New, LabelScrollInfo hWndhScrollInfo -MinimizeBox OwnerSpy
SetWindowIcon(hScrollInfo,ResDir . "\TreeIcons.icl",31) ;gui,Font,s9,Segoe UI gui,Color,black
gui,Add,CheckBox,w0 y0
gui,Add,GroupBox,x15 y13 w148 h152,% "Horizontal Scrollbar"
gui,Add,Text,x24 y32 w60 h23 +0x200,% "Visible:"
gui,Add,Edit,x86 y36 w60 h21 -E0x200,% H
gui,Add,Text,x24 y57 w60 h23 +0x200,% "Minimum:"
gui,Add,Edit,x86 y61 w60 h21 -E0x200,% HSB.Min
gui,Add,Text,x24 y82 w60 h23 +0x200,% "Maximum:"
gui,Add,Edit,x86 y86 w60 h21 -E0x200,% HSB.Max
gui,Add,Text,x24 y107 w60 h23 +0x200,% "Position:"
gui,Add,Edit,x86 y111 w70 h21 -E0x200,% HSB.Pos . HPercent
gui,Add,Text,x24 y132 w60 h23 +0x200,% "Page size:"
gui,Add,Edit,x86 y136 w60 h21 -E0x200,% HSB.Page
gui,Add,GroupBox,x178 y13 w148 h152,% "Vertical Scrollbar"
gui,Add,Text,x188 y32 w56 h23 +0x200,% "Visible:"
gui,Add,Edit,x250 y36 w60 h21 -E0x200,% V
gui,Add,Text,x188 y57 w56 h23 +0x200,% "Minimum:"
gui,Add,Edit,x250 y61 w60 h21 -E0x200,% VSB.Min
gui,Add,Text,x188 y82 w56 h23 +0x200,% "Maximum:"
gui,Add,Edit,x250 y86 w60 h21 -E0x200,% VSB.Max
gui,Add,Text,x188 y107 w56 h23 +0x200,% "Position:"
gui,Add,Edit,x250 y111 w70 h21 -E0x200,% VSB.Pos . VPercent
gui,Add,Text,x188 y132 w56 h23 +0x200,% "Page size:"
gui,Add,Edit,x250 y136 w60 h21 -E0x200,% VSB.Page
gui,Add,Text,x-1 y180 w343 h50 -Background +Border
gui,Add,Button,gScrollInfoClose x247 y193 w84 h24 +Default,% "&OK"
wingetPos,X,Y,,,ahk_id %hSpyWnd%
x+=30, y+=109
gui,Show,x%x% y%y% w341 h229,Scrollbars
return,

ScrollInfoClose:
ScrollInfoEscape:
gui,ScrollInfo:Destroy
return,

EndProcess:
guicontrolGet,Filename,,ProgName
if(Filename=="N/A")
	return,
gui,Spy:+OwnDialogs
MsgBox,0x40031,% AppName,Are you sure you want to exit %Filename%?
IfMsgBox,OK, {
	winget,PID,PID,ahk_id %g_hWnd%
	Process,Close,% PID
	if(ErrorLevel==0) {
		gui,Spy:+OwnDialogs
		MsgBox,0x40010,% "Error",% "The process named %Filename% with PID %PID% could not be ended."
}	} return,

/*
tb2() {
global	Gui,Add,Custom,ClassToolbarWindow32 0x100 +hwndhtb1	;TBSTYLE_TOOLTIPS=0x100
	;ControlGet,htb1,Hwnd,,ToolbarWindow321,% "ahk_id " hStylesTab
	;DllCall("SetParent","ptr",htb1,"ptr",hSpyWnd )
	SendMessage,0x43C,0,0,,% "ahk_id " htb1	;	TB_SETMAXTEXTROWS	; Text omitted from buttons
	vCount:= 6, vSize:= A_PtrSize=8? 32:20	;note: if more than one button has the same idCommand
	VarSetCapacity(TBBUTTON,vCount*vSize,0) ;,  only last button with idCommand will have ToolTip
	Loop,% vCount {
		vText%A_Index%:= "TB " A_Index, vOffset:= (A_Index-1)*vSize
		NumPut(A_Index-1,TBBUTTON,vOffset,	 "Int")	;iBitmap
		NumPut(A_Index-1,TBBUTTON,vOffset +4,"Int")	;idCommand ;TBSTATE_ENABLED=4
		NumPut(0x4,TBBUTTON,vOffset+8,"UChar")		;fsState
		NumPut(&vText%A_Index%,TBBUTTON,vOffset+(A_PtrSize=8? 24:16),"Ptr") ;iString
	}	hIL:= IL_Create(5,2,0)
	IL_Add(hIL,A_AhkPath,-159)	;Green H
	IL_Add(hIL,A_AhkPath,-206)	;Green S
	IL_Add(hIL,A_AhkPath,-207)	;Red H
	IL_Add(hIL,A_AhkPath,-208)	;Red S
	IL_Add(hIL,A_AhkPath,-160)	;File-icon
	SendMessage,0x430,0,% hIL,,% "ahk_id " htb1	;TB_SETIMAGELIST  ;TB_ADDBUTTONSW=0x444;
	vMsg:= A_IsUnicode? 0x444:0x414				;TB_ADDBUTTONSW/A ;TB_ADDBUTTONSA=0x414;
	SendMessage,% vMsg,% vCount,% &TBBUTTON,,% "ahk_id " htb1}
 */

IL_init(il="1") {
	global 	; switch il {; case3: ;crucial to determining ctlclass specific tb-items.	; }
	static ic1:= "C:\Script\AHK\- Script\WinSpy\winctrls3.ico,C:\Script\AHK\- Script\WinSpy\hv48.ico,C:\Script\AHK\- Script\WinSpy\borderthick.ico,C:\Script\AHK\- Script\WinSpy\eye48.ico,C:\Script\AHK\- Script\WinSpy\menu48.ico,C:\Script\AHK\- Script\WinSpy\DISABLED_48.ICO"
	,ic2:= "Resources\filedrop.ico,C:\Script\AHK\- Script\WinSpy\Resources\help48.ico,C:\Icon\256\reggie_watts.ico,C:\Script\AHK\- Script\WinSpy\Resources\layers48.ico,C:\Script\AHK\- Script\WinSpy\Resources\trans48.ico,resources\na_48.ico"
	,ic3:= "C:\Icon\48\disabled2_483.ico,C:\Script\AHK\- Script\WinSpy\winctrls3.ico,C:\Script\AHK\- Script\WinSpy\hv48.ico,C:\Script\AHK\- Script\WinSpy\borderthick.ico,C:\Script\AHK\- Script\WinSpy\eye48.ico,C:\Script\AHK\- Script\WinSpy\menu48.ico"
	,ic4:= "C:\Script\AHK\- Script\WinSpy\Resources\cog24.ico,C:\Script\AHK\- Script\WinSpy\Resources\cog24.ico,C:\Script\AHK\- Script\WinSpy\Resources\cog24.ico,C:\Script\AHK\- Script\WinSpy\Resources\cog24.ico,C:\Script\AHK\- Script\WinSpy\Resources\cog24.ico,C:\Script\AHK\- Script\WinSpy\Resources\cog24.ico,C:\Script\AHK\- Script\WinSpy\Resources\cog24.ico,C:\Script\AHK\- Script\WinSpy\Resources\cog24.ico,C:\Script\AHK\- Script\WinSpy\Resources\cog24.ico,C:\Script\AHK\- Script\WinSpy\Resources\cog24.ico,C:\Script\AHK\- Script\WinSpy\Resources\cog24.ico,C:\Script\AHK\- Script\WinSpy\Resources\cog24.ico,C:\Script\AHK\- Script\WinSpy\Resources\cog24.ico,C:\Script\AHK\- Script\WinSpy\Resources\cog24.ico,C:\Script\AHK\- Script\WinSpy\Resources\cog24.ico,C:\Script\AHK\- Script\WinSpy\Resources\cog24.ico,C:\Script\AHK\- Script\WinSpy\Resources\cog24.ico"
	;ic4:= "C:\Script\AHK\- Script\WinSpy\Resources\cog24.ico,C:\Script\AHK\- Script\WinSpy\Resources\ey3y32 24.ico,C:\Script\AHK\- Script\WinSpy\Resources\crossed24_5.ico,C:\Script\AHK\- Script\WinSpy\Resources\redo0_24.ico,C:\Script\AHK\- Script\WinSpy\Resources\undo0_24.ico,C:\Script\AHK\- Script\WinSpy\Resources\mag1_24.ico,C:\Script\AHK\- Script\WinSpy\Resources\Copy_24.ico"
	icon_array:= [] ;icon_array.push(ic%il%)
	loop,parse,% ic%il%,`,
		icon_array[ max_i:= A_index ]:= A_loopfield
	for,i,icopath in icon_array	;iBitmap
		IL_Add(hIL%il%,icopath,0) ;idCommand
	max_i>6? vCount:= 6 : vCount:= max_i
	hIL%il%:= IL_Create(vCount,2,2),	vSize:= A_PtrSize=8? 32:20
	VarSetCapacity(TBBUTTON,vCount*vSize,0)
	Loop,% vCount {
		switch,a_index {
			case,1 : (vTxt%A_Index%):= "Home is where the fart is..."
			default : (vTxt%A_Index%):= "       Cut-em-up!!`nI-can-dance-all-day!!!"
		} vOffset:= (A_Index -1) *vSize
		, NumPut(A_Index-1,		TBBUTTON,vOffset,	"Int")
		, NumPut(A_Index-1,		TBBUTTON,vOffset+4,	"Int")
		, NumPut(0x4,			TBBUTTON,vOffset+8,	"UChar")
		, NumPut(&vTxt%A_Index%,TBBUTTON,vOffset+(A_PtrSize=8? 24:16),"Ptr") ;iString;hIL2:= IL_Create(5,2,64)
	} for,i,icopath in icon_array
		IL_Add(hIL%il%,icopath,0)
	return,byref hIL%il%
}

statusbarinit() {
	global
	static init:= 0, inc:= 412, alienhic
	(init=0? alienhic:= ico2hicon(alien))
	Gui,spy:Add,StatusBar,+hWndSbarhWnd +e0x2000000
	SB_SetParts(inc,100)
	SendMessage,0x40F,0,% alienhic,,ahk_id %SbarhWnd%
	return,SbarhWnd
}

LinkToHandle:
guicontrolGet,LinkText,Spy:,% A_guicontrol
(RegExMatch(LinkText,"(0x\w+)",Match)? ShowWindowInfoIfExist(Match))
return,

OpenFolder:
gui,ListView,% hProcInfo
LV_GetText(ExePath,1,2)
if(ExePath !="")
	Run,*open explorer.exe /select`,"%ExePath%"
return,

LoadChildList:
gui,Spy:ListView,% hChildList
LV_Delete()
winget,ChildList,ControlListHwnd,ahk_id %g_hWnd%
Loop,Parse,ChildList,`n
{
	if(GetParent(A_LoopField) !=g_hWnd)
		Continue,
	wingetClass,Class,ahk_id %A_LoopField%
	ControlGetText,Text,,ahk_id %A_LoopField%
	LV_Add("",format("0x{:08X}",A_LoopField),Class,Text)
} return,

LoadSiblingList:
gui,Spy:ListView,% hSiblingList
LV_Delete()
hParent:= GetParent(g_hWnd)
if(IsChild(g_hWnd)) {
	winget,SiblingList,ControlListHwnd,ahk_id %hParent%
	Loop,Parse,SiblingList, `n
	{
		if(A_LoopField==g_hWnd)
			Continue,
		if(GetParent(A_LoopField) !=hParent)
			Continue,
		wingetClass,Class,ahk_id %A_LoopField%
		ControlGetText Text,,ahk_id %A_LoopField%
		LV_Add("",format("0x{:08X}",A_LoopField),Class,Text)
	}
} else {
	winget,WinList,List,% (hParent==0)? "":"ahk_id " . hParent
	Loop,% WinList {
		hWnd:= WinList%A_Index%
		if(hWnd==g_hWnd)
			Continue,
		wingetClass,Class,ahk_id %hWnd%
		wingetTitle,Text,ahk_id %hWnd%
		LV_Add("",format("0x{:08X}",hWnd),Class,Text)
}	} return,

SetHookMenu:
Hookcx:=  dllcall("SetWinEventHook","Uint",0x0006,"Uint",0x0006,"Ptr",0,"Ptr"
, Proccx_:= RegisterCallback("onCntMen","turd"),"Uint",0,"Uint",0,"Uint",OoC)
return,

CheckMen(hWnd="") {
	if(winexist("ahk_id " hWnd)||winexist("ahk_class #32768")){
		fn:= Func("CheckMen").Bind(hWnd)
		settimer,% fn,-1000 ;else,if g_Topmost;	winset,AlwaysOnTop,on,ahk_id %hSpyWnd%
	}
}

onCntMen(Hookcx,eventcr,hWnd,idObject,idChild,dwEventThread) { ;-🪝--🪝--🪝--🪝
	global g_Topmost, r_pid
	(!g_Topmost?return())
	winget,pid,pid,ahk_id %hwnd%
	(pid=r_pid? return()) ;winset,AlwaysOnTop,%a%,ahk_id %hSpyWnd%;
	winset,AlwaysOnTop,off,ahk_id %hSpyWnd%
	fn:= Func("CheckMen").Bind(hWnd)
	settimer,% fn,-1444	;return,	;--🪝--🪝--🪝--🪝--🪝--🪝--🪝--🪝--🪝--🪝--🪝--🪝--🪝>>
}

ChildListHandler:
SiblingListHandler:
gui,Spy:ListView,% (A_ThisLabel=="ChildListHandler")? hChildList : hSiblingList
(A_guiEvent!="ColClick")? (LV_GetText(hWnd,LV_GetNext()),ShowWindowInfoIfExist(hWnd))
return,

SetDHW:
if(g_DetectHiddn:= !g_DetectHiddn)
	guicontrol,,% dhwcheck,-1
return,

SetTopmost:
if(g_Topmost:=!g_Topmost)
	guicontrol,,% dhwcheck,-1 ;winset,AlwaysOnTop,%a%,ahk_id %hSpyWnd%; tt(ExStyleSet(hSpyWnd, a))
	winset,exstyle,^0x8
if(g_Topmost!="0")
	winset,top,,ahk_id %hSpyWnd% ;DllCall("SetWindowBand","ptr",hSpyWnd,"ptr",0,"uint",15,"uint")
;	StyleSet(hSpyWnd,"+0x80000000")	;winset,style,+0x80000000,ahk_id %hSpyWnd%
;else {	;winset,alwaysontop,off,ahk_id %hSpyWnd% 	;StyleSet(hSpyWnd,"+0x80000000")
;}
return,

ShowRegionSet:
p:= GetWindowPlacement(hSpyWnd)
if(WinExist("ahk_id" . hRegionSet)) {
	if(!IsWindowVisible(hRegionSet)) { ;if g_Topmost ;gui,XYWH:+alwaysontop
		gui,XYWH:Show,% "x" p.x +p.w " y" p.y+128 "w429 h170 hide",% "Position and Size"
		WinAnimate(hRegionSet,"activate slide hpos",200)
		winset,top,,ahk_id %hspywnd%
		SetWindowIcon(hRegionSet,"C:\Script\AHK\- Script\WinSpy\Resources\tree.ico")
	} else {
		WinAnimate(hRegionSet,"hide slide hneg",200)
		gui,XYWH:destroy
	} return,
} else { ;if(opAlwaysOnTop) ;aoot:= " +alwaysontop "
	gui,XYWH:New,-dpiscale +toolwindow -resize -0x400000 +0x40000 hwndhxywh ;%aoot%
	;if g_Topmost ; gui,XYWH:+alwaysontop +E0x8
	;gui,Font,s9,Segoe UI 	;gui,Color,black
;	gui,Add,GroupBox,x10 y6 w145 h115,% "Relative to:"
;	gui,Add,Radio,hwndhClientCoords vClientCoords gSetXYWH x15 y27 w120 h23 +Checked,% "Client area"
;	gui,Add,Radio,hwndhWindowCoords vWindowCoords  gSetXYWH x15 y60 w130 h23,% "Window border"
;	gui,Add,Radio,hwndhScreenCoords vScreenCoords gSetXYWH x15 y92 w130 h23,% "Screen coords"
;	gui,Add,GroupBox,x166 y5 w253 h115
;	gui,Add,Text,x182 y31 w26 h23 +0x200,% "X:"
;	gui,Add,Edit,vEdtX x209 y31 w70 h21
;	gui,Add,UpDown,gMoveWindow Range-64000-64000 +0x80
;	gui,Add,Text,x303 y31 w26 h23 +0x200,% "Y:"
;	gui,Add,Edit,vEdtY x330 y31 w70 h21
;	gui,Add,UpDown,gMoveWindow Range-64000-64000 +0x80
;	gui,Add,Text,x182 y78 w26 h23 +0x200,% "W:"
;	gui,Add,Edit,vEdtW x209 y78 w70 h21
;	gui,Add,UpDown,gMoveWindow Range-64000-64000 +0x80
;	gui,Add,Text,x303 y78 w26 h23 +0x200,% "H:"
;	gui,Add,Edit,vEdtH x330 y78 w70 h21
;	gui,Add,UpDown,gMoveWindow Range-64000-64000 +0x80
;	gui,Add,Text,x-1 y121 w460 h49 +0x200 -Background +Border
;	gui,Add,Button,gResetXYWH x9 y144 w88 h39,% "&Reset"
;	gui,Add,Button,gMoveWindow x235 y138 w88 h39 +Default,% "&Apply"
;	gui,Add,Button,gXYWHClose x331 y138 w88 h39,% "&Close"
;	gui,Show,% "na hide x" p.x +p.w " y" p.y+128 "w429 h189",% "Position and Size"
;	WinAnimate(hxywh,"activate slide hpos",200), g_NewXYWH:= True
;	winset,style,-0x80000000,ahk_id %hxywh%
	gui,XYWH: +MinSize429x189 +MaxSize429x189 ;winactivate,ahk_id %hspywnd%
	;loop,parse,% "hxywh,hSettingsDlg",`,
	;{
;	gk:= %a_loopField%
	;	winset,top,,ahk_id %gk%
;	} GoSub,goRegionSet
} return,

RegionSetClose:
RegionSetEscape:
;gui,RegionSet:Destroy
return,

SetMinimize:
g_Minimize:= !g_Minimize
return,

ShowXYWHDlg:
p:= GetWindowPlacement(hSpyWnd)
if(WinExist("ahk_id" . hxywh)) {
	if(!IsWindowVisible(hxywh)) {
		; if g_Topmost
			;gui,XYWH:+alwaysontop
		gui,XYWH:Show,% "x" p.x +p.w " y" p.y+128 "w429 h170 hide",% "Position and Size"
		WinAnimate(hxywh,"activate slide hpos",200)
		winset,top,,ahk_id %hspywnd%
		SetWindowIcon(hxywh,"C:\Script\AHK\- Script\WinSpy\Resources\tree.ico")
	} else {
		WinAnimate(hxywh,"hide slide hneg",200)
		gui,XYWH:destroy
	}
	return,
} else { ;if(opAlwaysOnTop) ;aoot:= " +alwaysontop "
	gui,XYWH:New,-dpiscale +toolwindow -resize -0x400000 +0x40000 hwndhxywh ;%aoot%
	; if g_Topmost	; gui,XYWH:+alwaysontop +E0x8 ;gui,Font,s9,Segoe UI ;gui,Color,black
	gui,Add,GroupBox,x10 y6 w145 h115,% "Relative to:"
	gui,Add,Radio,hwndhClientCoords vClientCoords gSetXYWH x15 y27 w120 h23 +Checked,% "Client area"
	gui,Add,Radio,hwndhWindowCoords vWindowCoords  gSetXYWH x15 y60 w130 h23,% "Window border"
	gui,Add,Radio,hwndhScreenCoords vScreenCoords gSetXYWH x15 y92 w130 h23,% "Screen coords"
	gui,Add,GroupBox,x166 y5 w253 h115
	gui,Add,Text,x182 y31 w26 h23 +0x200,% "X:"
	gui,Add,Edit,vEdtX x209 y31 w70 h21
	gui,Add,UpDown,gMoveWindow Range-64000-64000 +0x80
	gui,Add,Text,x303 y31 w26 h23 +0x200,% "Y:"
	gui,Add,Edit,vEdtY x330 y31 w70 h21
	gui,Add,UpDown,gMoveWindow Range-64000-64000 +0x80
	gui,Add,Text,x182 y78 w26 h23 +0x200,% "W:"
	gui,Add,Edit,vEdtW x209 y78 w70 h21
	gui,Add,UpDown,gMoveWindow Range-64000-64000 +0x80
	gui,Add,Text,x303 y78 w26 h23 +0x200,% "H:"
	gui,Add,Edit,vEdtH x330 y78 w70 h21
	gui,Add,UpDown,gMoveWindow Range-64000-64000 +0x80
	gui,Add,Text,x-1 y121 w460 h49 +0x200 -Background +Border
	gui,Add,Button,gResetXYWH x9 y144 w88 h39,% "&Reset"
	gui,Add,Button,gMoveWindow x235 y138 w88 h39 +Default,% "&Apply"
	gui,Add,Button,gXYWHClose x331 y138 w88 h39,% "&Close"
	gui,Show,% "na hide x" p.x +p.w " y" p.y+128 "w429 h189",% "Position and Size"
	WinAnimate(hxywh,"activate slide hpos",200), g_NewXYWH:= True
	winset,style,-0x80000000,ahk_id %hxywh%
	winset,style,-0x80000000,ahk_id %hxywh%
	winset,style,+0x40000000,ahk_id %hxywh%
	gui,XYWH: +MinSize429x189 +MaxSize429x189 ;winactivate,ahk_id %hspywnd%
	loop,parse,% "hxywh,hSettingsDlg",`,
	{
		gk:= %a_loopField%
		winset,top,,ahk_id %gk%
	} GoSub,SetXYWH
} return,

XYWHClose:
XYWHEscape:
gui,XYWH:Destroy
return,

SetXYWH:
if(IsChild(g_hWnd)) {
	guicontrol,Enable,% hClientCoords
	guicontrol,Enable,% hWindowCoords
	guicontrol,Enable,% hScreenCoords
} else {
	guicontrol,Disable,% hClientCoords
	guicontrol,Disable,% hWindowCoords
	guicontrol,Disable,% hScreenCoords
	guicontrol,,% hScreenCoords,1
} gui,XYWH:Submit,NoHide
if(IsChild(g_hWnd)) {
	if(ClientCoords)
		GetWindowPos(g_hWnd,X,Y,W,H)
	else,if(WindowCoords)
		ControlGetPos,X,Y,W,H,,ahk_id %g_hWnd%
	else,if(ScreenCoords)
		wingetPos,X,Y,W,H,ahk_id %g_hWnd%
} else,wingetPos,X,Y,W,H,ahk_id %g_hWnd%  ; Top-level window
guicontrol,XYWH:,EdtX,% X
guicontrol,XYWH:,EdtY,% Y
guicontrol,XYWH:,EdtW,% W
guicontrol,XYWH:,EdtH,% H
(g_NewXYWH?	g_BackupXYWH:= [X,Y,W,H], g_NewXYWH:= False)
return,

MoveWindow:
gui,XYWH:Submit,NoHide
if(IsChild(g_hWnd)) {
	if(ClientCoords)
		SetWindowPos(g_hWnd,EdtX,EdtY,EdtW,EdtH,0,0x14) ; SWP_NOACTIVATE|SWP_NOZORDER
	else,if(WindowCoords)
		ControlMove,,% EdtX,% EdtY,% EdtW,% EdtH,ahk_id %g_hWnd%
	else,if(ScreenCoords) {
		VarSetCapacity(POINT,8,0)
		NumPut(EdtX,POINT,0), NumPut(EdtY,POINT,4)
		DllCall("ScreenToClient","Ptr",GetParent(g_hWnd),"Ptr",&POINT) ; PARENT
		X:= NumGet(POINT,0), Y:= NumGet(POINT,4)
		SetWindowPos(g_hWnd,X,Y,EdtW,EdtH,0,0x14) ; SWP_NOACTIVATE | SWP_NOZORDER
	}
} else,WinMove,ahk_id %g_hWnd%,,% EdtX,% EdtY,% EdtW,% EdtH
winset,RedRaw,,ahk_id %g_hWnd%
return,

ResetXYWH:
gui,XYWH:Submit,NoHide
if(IsChild(g_hWnd))
	guicontrol,XYWH:,ClientCoords,1
guicontrol,,EdtX,% g_BackupXYWH[1]
guicontrol,,EdtY,% g_BackupXYWH[2]
guicontrol,,EdtW,% g_BackupXYWH[3]
guicontrol,,EdtH,% g_BackupXYWH[4]
GoSub,MoveWindow
return,

AutoXYWH(DimSize,cList*) {
	Static cInfo:= {}
	if(DimSize="reset")
		return,cInfo:= {}
	for,i,ctrl in cList {
		ctrlID:= A_gui,":" ctrl
		if(cInfo[ctrlID].x = "") {
			guicontrolGet i,%A_gui%: Pos,% ctrl
			MMD:= InStr(DimSize,"*")? "MoveDraw":"Move"
			fx:= fy:= fw:= fh:= 0
			for,i,dim in (a:= StrSplit(RegExReplace(DimSize,"i)[^xywh]")))
				if(!RegExMatch(DimSize,"i)" . dim . "\s*\K[\d.-]+", f%dim%))
					f%dim%:= 1
			cInfo[ctrlID]:= {x: ix, fx: fx, y: iy, fy: fy, w: iw, fw: fw, h: ih, fh: fh
							, gw: A_guiWidth, gh: A_guiHeight, a: a, m: MMD}
		} else,if(cInfo[ctrlID].a.1) {
			dgx:= dgw:= A_guiWidth -cInfo[ctrlID].gw, dgy:= dgh:= A_guiHeight -cInfo[ctrlID].gh
			, Options:= ""
			for,i,dim in cInfo[ctrlID]["a"]
				Options .=dim . (dg%dim% *cInfo[ctrlID]["f" . dim] +cInfo[ctrlID][dim]) . A_Space
			guicontrol,% A_gui ":" cInfo[ctrlID].m,% ctrl,% Options
}	}	}

GetWindowPos(hWnd,ByRef X,ByRef Y,ByRef W,ByRef H) {
	VarSetCapacity(RECT,16,0)
	DllCall("GetWindowRect","Ptr",hWnd,"Ptr",&RECT)
	DllCall("MapWindowPoints","Ptr",0,"Ptr",GetParent(hWnd),"Ptr",&RECT,"UInt",2)
	X:= NumGet(RECT,0,"Int"), Y:= NumGet(RECT,4,"Int")
	W:= NumGet(RECT,8,"Int") -X, H:= NumGet(RECT,12,"Int") -Y
}

ChooseBorderColor:
if(ChooseColor((g_BorderColorTemp:= g_BorderColor),hSettingsDlg))
	guicontrol,Settings:+c%g_BorderColorTemp%,BorderColorPreview
return,

ChooseColor(ByRef Color,hOwner:= 0) {
	rgbResult:= ((Color &0xFF)<<16) +(Color &0xFF00) +((Color>>16) &0xFF)
	VarSetCapacity(CUSTOM,64,0)
	NumPut(VarSetCapacity(CHOOSECOLOR,A_PtrSize *9,0),CHOOSECOLOR,0)
	NumPut(hOwner,CHOOSECOLOR,A_PtrSize)
	NumPut(rgbResult,CHOOSECOLOR,A_PtrSize *3)
	NumPut(&CUSTOM,CHOOSECOLOR,A_PtrSize *4) ;COLORREF *lpCustColors
	NumPut(0x103,CHOOSECOLOR,A_PtrSize *5) ;Flags: CC_ANYCOLOR|CC_RGBINIT|CC_FULLOPEN
	RetVal:= DllCall("comdlg32\ChooseColorA","Str",CHOOSECOLOR)
	if(ErrorLevel!=0||RetVal==0)
		return,False
	rgbResult:= NumGet(CHOOSECOLOR,A_PtrSize *3)
	Color:= (rgbResult &0xFF00) +((rgbResult &0xFF0000)>>16) +((rgbResult &0xFF)<<16)
	Color:= format("0x{:06X}",Color)
	return,True
}

GetSysColorName(Value) {
	Static SysColors:= {0: "COLOR_SCROLLBAR", 1: "COLOR_BACKGROUND", 2: "COLOR_ACTIVECAPTION", 3: "COLOR_INACTIVECAPTION"
	, 4: "COLOR_MENU", 5: "COLOR_WINDOW", 6: "COLOR_WINDOWFRAME", 7: "COLOR_MENUTEXT", 8: "COLOR_WINDOWTEXT"
	, 9: "COLOR_CAPTIONTEXT", 10: "COLOR_ACTIVEBORDER", 11: "COLOR_INACTIVEBORDER", 12: "COLOR_APPWORKSPACE"
	, 13: "COLOR_HIGHLIGHT", 14: "COLOR_HIGHLIGHTTEXT", 15: "COLOR_BTNFACE", 16: "COLOR_BTNSHADOW"
	, 17: "COLOR_GRAYTEXT", 18: "COLOR_BTNTEXT", 19: "COLOR_INACTIVECAPTIONTEXT", 20: "COLOR_BTNHIGHLIGHT"
	, 21: "COLOR_3DDKSHADOW", 22: "COLOR_3DLIGHT", 23: "COLOR_INFOTEXT", 24: "COLOR_INFOBK", 26: "COLOR_HOTLIGHT"
	, 27: "COLOR_GRADIENTACTIVECAPTION", 28: "COLOR_GRADIENTINACTIVECAPTION", 29: "COLOR_MENUHILIGHT", 30: "COLOR_MENUBAR"}
	return,(Color:= SysColors[Value]==""? Value:Color)
}

AddUniqueClass(ClassName) {
	Local Unique:= True
	Loop,% (Classes.Length()) {
		if(ClassName==Classes[A_Index]) {
			Unique:= False
			Break,
	}	} (Unique? Classes.Push(ClassName))
	guicontrol,+RedRaw,% hFindList
}

MatchCriteria(Text,Class,Process) {
	global
	if(EdtFindByText !="") {
		if(ChkFindRegEx) {
			if(RegExMatch(Text,EdtFindByText)<1)
				return,False
		} else,if(!InStr(Text,EdtFindByText))
			return,False
	}
	if(CbxFindByClass !="" && !InStr(Class,CbxFindByClass))
		return,False
	if(CbxFindByProcess !="")
		return,IsNumber(Process)? CbxFindByProcess==Process : InStr(Process,CbxFindByProcess)
	return,True
}

CreateImageList() { ;Generic Window; icon,Desktop(#32769),Dialog(#32770),Button,CheckBox,ComboBox,DateTime,Edit,GroupBox,Hotkey,Icon,Link,ListBox,ListView,MonthCal,Picture,Progress,Radio,RichEdit,Separator,Slider,Statusbar,Tab,Text,Toolbar,Tooltips,TreeView,UpDown,IE,Scintilla,ScrollBar,SysHeader"
	global TreeIcons
	ImageList:= IL_Create(32)
	loop,32
		IL_Add(ImageList,TreeIcons,a_index)
	return,ImageList
}

TreeHandler:
if(A_guiEvent=="DoubleClick") {
	g_hWnd:= TreeIDs[A_EventInfo]
	ShowWindowInfo()
} else,TT(A_guiEvent)
return,

ShowTree:
if(WinExist("ahk_id" . hTreeWnd)) {
	if(!IsWindowVisible(hTreeWnd)) { ;p:= GetWindowPlacement(hSpyWnd) ;gui,tree:Show,% "x" p.x-520 " y" p.y " w523 h703 hide",% "WinPsY-Tree" ;%AppName% -Tree; WinAnimate(hTreeWnd,"activate slide hneg",200)
		SetWindowIcon(hTreeWnd,"C:\Script\AHK\- Script\WinSpy\Resources\tree.ico")
	} else {
		WinAnimate(hTreeWnd,"hide slide hpos",200)
		gui,Tree:destroy
		return,
	}
} else {
	gui,Tree:New,% "-dpiscale LabelTree hWndhTreeWnd +0x40040000 +Resize +MinSize" 523 "x" G_SPY_H -13  " +MaxSize" 523 "x" G_SPY_H -13
	SetWindowIcon(hTreeWnd,"C:\Script\AHK\- Script\WinSpy\Resources\tree.ico")
	Menu,TreeMenu,Add,%	"&Reload`tF5",LoadTree
	Menu,TreeMenu,Add
	Menu,TreeMenu,Add,%	"E&xit`tEsc",TreeClose
	Menu,MenuBar,Add,%	"&Tree",:TreeMenu
	Menu,ViewMenu,Add,%	"Show &Hidden Windows",ToggleHiddenWindows
	Menu,ViewMenu,Add
	Menu,ViewMenu,Add,%	"&Flash Window`tF6",FlashWindow
	Menu,ViewMenu,Add
	Menu,ViewMenu,Add,%	"E&xpand All Nodes",ExpandAll
	Menu,ViewMenu,Add,%	"&Collapse All Nodes",CollapseAll
	Menu,MenuBar,Add,%	"&View",:ViewMenu
	gui,Tree:Menu,MenuBar
	gui,Font,s8
	p:= GetWindowPlacement(hSpyWnd)
	gui,Add,TreeView,hWndhTree gTreeHandler x0 y0 w515 h%G_SPY_H% -Lines +0x9000
	TV_SetImageList(CreateImageList())
	SetExplorerTheme(hTree)
	SetWindowIcon(hTreeWnd,"C:\Script\AHK\- Script\WinSpy\Resources\tree.ico")
		winset,style,-0xc90000, ahk_id %hTreewnd%
	winset,style,-0x80000000, ahk_id %hTreewnd%
	winset,exstyle,-0x200, ahk_id %hTreewnd%
	gui,Show,% "na hide x" p.x-518 " y" p.y " w545 h" G_SPY_H -13 " hide",% "WinPsY-Tree" ;%AppName% -Tree
	WinAnimate(hTreeWnd,"activate slide hneg",200) ;	winset,RedRaw,,ahk_id %hTreewnd%
	winset,top,,ahk_id %hspywnd%
	loop,parse,% "hspywnd,hxywh,hSettingsDlg",`,
	{
		gk:= %a_loopField%
		winset,top,,ahk_id %gk%
	}
} GoSub,LoadTree
return,

TreeClose:
TreeEscape:
gui,Tree:destroy
return,

TreeSize:
if(A_EventInfo==1)
	return, ;Minimized;
AutoXYWH("wh",hTree)
return,

LoadTree:
global TreeIDs:= {}
gui,Tree:Default
TV_Delete()
RootID:= TV_Add("Desktop",0,"Icon2")
TreeIDs[RootID]:= DllCall("GetDesktopWindow","Ptr")
winget,WinList,List
Loop,% WinList {
	hWnd:= WinList%A_Index%
	wingetClass,Class,ahk_id %hWnd%
	wingetTitle,Title,ahk_id %hWnd%
	(Title !=""? Title:= " - " . Title)
	Invisible:= !IsWindowVisible(hWnd)
	if(!g_TreeShowAll && Invisible)
		Continue,
	(Invisible?	Title .= " (hidden)")
	Icon:= GetWindowIcon(hWnd,Class,True)
	ID:= TV_Add(Class . Title,RootID,"Icon" . Icon)
	TreeIDs[ID]:= hWnd
	Tree(hWnd,ID)
} TV_Modify(RootID,"+Expand")
for,Key,Value in TreeIDs
	(g_hWnd==Value? TV_Modify(Key,"Select"))
return,

Tree(hParentWnd,ParentID) {
	winget,WinList,ControlListHwnd,ahk_id %hParentWnd%
	Loop Parse,WinList, `n
	{
		if(GetParent(A_LoopField) !=hParentWnd)
			Continue,
		wingetClass,Class,ahk_id %A_LoopField%
		if(IsChild(A_LoopField))
			ControlGetText,Text,,ahk_id %A_LoopField%
		else,wingetTitle,Text,,ahk_id %A_LoopField%
		((Text != "")? Text:= " - " . Text)
		Invisible:= !IsWindowVisible(A_LoopField)
		if(!g_TreeShowAll && Invisible)
			Continue,
		(Invisible? Text .=" (hidden)")
		Icon:= GetWindowIcon(A_LoopField,Class)
		ID:= TV_Add(Class . Text,ParentID,"Icon" . Icon)
		TreeIDs[ID]:= A_LoopField
		Tree(A_LoopField,ID)
}	}

GetWindowIcon(hWnd,Class,TopLevel:= False) {
	Static Classes:= {0:0
	,"#32770": 3				,"Radio": 18				,"Icon": 11					,"ToolbarWindow32": 25
	,"Button": 4				,"RebarWindow32": 25		,"SysLink": 12				,"tooltips_class32": 26
	,"CheckBox": 5				,"RichEdit": 19				,"ListBox": 13				,"SysTreeView32": 27
	,"ComboBox": 6				,"Separator": 20			,"SysListView32": 14		,"msctls_updown32": 28
	,"SysDateTimePick32": 7		,"msctls_trackbar32": 21	,"SysMonthCal32": 15		,"Internet Explorer_Server": 29
	,"Edit": 8					,"msctls_statusbar32": 22	,"Picture": 16				,"Scintilla": 30
	,"GroupBox": 9				,"SysTabControl32": 23		,"msctls_progress32": 17	,"ScrollBar": 31
	,"msctls_hotkey32": 10		,"Static": 24				,"SysHeader32": 32			,"AutoHotkeyGui": 33}
	switch,class {
		case,"Button" : winget,Style,Style,ahk_id %hWnd%
			Type:= Style &0xF, ((Type=7)? (Class:="GroupBox")
			: (((Type ~="2|3|5|6")? (Class:="CheckBox")
			: (((Type ~= "4|9")? (Class:= "Radio")
			: (Class:= "Button"))))))
		case,"Static" :	winget,0Style,Style,ahk_id %hWnd%
			Type:= Style &0x1F ;SS_TYPEMASK
			((Type==3)? (Class:= "Icon") : ((Type==14)? (Class:= "Picture"):
			,	(((Type==0x10)? (Class:= "Separator") : (Class:= "Static")))))
		default : ((InStr(Class,"RICHED",True)==1)? Class:= "RichEdit") ;RICHEDIT50W
			Icon:= Classes[Class]
			if(Icon !="")
				return,Icon
			SendMessage,0x7F,2,0,,ahk_id %hWnd% ;WM_GETICON,ICON_SMALL2
			hIcon:= ErrorLevel
			if(hIcon==0 && TopLevel) {
				winget,ProcessPath,ProcessPath,ahk_id %hWnd%
				hIcon:= GetFileIcon(ProcessPath)
	}		}
	IconIndex:= (hIcon)? IL_Add(ImageList,"HICON: " . hIcon):1
	return,IconIndex
}

ToggleHiddenWindows:
g_TreeShowAll:= !g_TreeShowAll
GoSub,LoadTree
Menu,ViewMenu,ToggleCheck,Show &Hidden Windows
return,

ExpandAll:
CollapseAll:
Expand:= (A_ThisLabel=="ExpandAll")? "+Expand":"-Expand"
ItemID:= 0
Loop {
	ItemID:= TV_GetNext(ItemID,"Full")
	if(!ItemID)
		Break,
	TV_Modify(ItemID,Expand)
} return,

ShowMenuViewer: ;Based on a script written by Lexicos
if(MenuViewerExist) {
	gui,MenuViewer:Show
	GoSub,ShowMenuItems
	return,
} gui,MenuViewer:New,-dpiscale +LabelMenuViewer +hWndhMenuViewer +Resize
gui,Font,s9
gui,Color,0x000000
gui,Add,ListView,hWndhMenuList vLVMenu x0 y0 w600 h400 +LV0x14000,% "Menu Item String|Keyboard|Menu ID"
LV_ModifyCol(1,410), LV_ModifyCol(2,103), LV_ModifyCol(3,"65 Integer")
SetExplorerTheme(hMenuList)
gui,Add,Edit,hWndhEdtMenuSearch vEdtMenuSearch gSearchMenu x8 y408 w200 h23 +0x2000000 ;WS_CLIPCHILDREN;
DllCall("SendMessage","Ptr",hEdtMenuSearch,"UInt",0x1501,"Ptr",1,"WStr","Search")
gui,Add,Picture,hWndhSearchIcon x178 y1 w16 h16,%ResDir%\Search.ico
DllCall("SetParent","Ptr",hSearchIcon,"Ptr",hEdtMenuSearch)
winset,Style,-0x40000000,ahk_id %hSearchIcon% ;-WS_CHILD
ControlFocus,,ahk_id %hEdtMenuSearch%
NoAmpersands:= True
gui,Add,CheckBox
,vNoAmpersands gShowMenuItems x220 y408 w167 h23 Checked%NoAmpersands%,% "Remove Ampersands (&&)"
gui,Add,Button,vBtnMenuCopy gCopyMenuList x466 y407 w125 h25,% "Copy to Clipboard"
gui,Show,w600 h440,Menu Viewer
MenuViewerExist:= True
GoSub,ShowMenuItems
return,

ShowMenuItems:
gui,MenuViewer:Default
gui,Submit,NoHide
LV_Delete(), (hMenu:= GetMenu(g_hWnd))? (MenuItems:= [], GetMenuItems(hMenu,"","")):()
return,

GetMenuItems(hMenu,Prefix,ByRef Commands) {
	global
	ItemCount:= GetMenuItemCount(hMenu)
	Loop,% ItemCount {
		ItemString:= GetMenuString(hMenu,A_Index -1)
		,	ItemID:= GetMenuItemID(hMenu,A_Index -1)
		RegExMatch(ItemString,"\t(.+)",Keyboard)
		ItemString:= RegExReplace(ItemString,"\t.*")
		(ItemString=="SEPARATOR"? ItemString:= "----------------------------")
		MenuItems.Push([ItemString,Keyboard1,ItemID])
		(NoAmpersands? ItemString:= StrReplace(ItemString,"&"))
		LV_Add("",Prefix.ItemString,Keyboard1,ItemID)
		if(ItemID==-1) { ; Submenu
			hSubMenu:= GetSubMenu(hMenu,A_Index -1)
			if(hSubMenu) {
				GetMenuItems(hSubMenu,Prefix .="		",Commands)
				Prefix:= StrReplace(Prefix,"		","",,1)
				Continue,
}	}	}	}

SearchMenu:
gui,MenuViewer:Submit,NoHide
gui,ListView,% hMenuList
LV_Delete()
Loop,% MenuItems.Length() {
	  MenuItem:= MenuItems[A_Index][1]
	, Keyboard:= MenuItems[A_Index][2]
	, MenuID  := MenuItems[A_Index][3]
	(NoAmpersands? MenuItem:= StrReplace(MenuItem,"&"))
	if( InStr(MenuItem,EdtMenuSearch)
	||	InStr(Keyboard,EdtMenuSearch)
	||	InStr(MenuID,  EdtMenuSearch))
		LV_Add("",MenuItem,Keyboard,MenuID)
} return,

CopyMenuList:
gui,MenuViewer:Default
ControlGet,MenuList,List,,,ahk_id %hMenuList%
Clipboard:= StrReplace(MenuList,"		","`t")
return,

MenuViewerClose:
MenuViewerEscape:
gui,MenuViewer:Hide
return,

MenuViewerSize:
if(A_EventInf==1) ;Minimized;
	return,
 AutoXYWH("wh",hMenuList)
,AutoXYWH("y", hEdtMenuSearch)
,AutoXYWH("y", hSearchIcon)
,AutoXYWH("y","NoAmpersands")
,AutoXYWH("xy","BtnMenuCopy")
return,

MenuViewerContextMenu:
Row:= LV_GetNext()
LV_GetText(MenuString,Row,1), LV_GetText(MenuID,Row,3)
if(A_guicontrol=="LVMenu" && MenuID>0 && !InStr(MenuString,"-----")) {
	Menu,MenuMenu,Add,% "Invoke Menu Command",InvokeMenuCommand
	Menu,MenuMenu,Show
} return,

Parent_Button_Eval:
for,Handle in OldParents
	(g_hwnd=Handle? Removed_Prior:=true)
if(Removed_Prior) {
;	guicontrol,% hRemParentButton,restore parent
; else,guicontrol,% hRemParentButton,Remove from parent
;	gui,Add,Button, +hwndhRemParentButton gparent_remove x250 y560 w190 h38,% "Remove from parent"
	tt("detected removed prior")
	GuiControl,disable,% hRemParentButton1
	GuiControl,enable,% hRemParentButton2
} return,

InvokeMenuCommand:
PostMessage,0x111,% MenuID,,,ahk_id %g_hWnd%
return,

OldTimeReset:
OldTimeReset:= ""
return,

LoadProcessProperties:
(!OldTimeReset? OldTimeReset:=a_tickcount : ((a_tickcount-OldTimeReset<2000)
? (timer("OldTimeReset",-1000), return())))
winset,style,+0xe -0x3,ahk_id %hProgIcon%
gui,Spy:Submit,NoHide
gosub,Parent_Button_Eval
winget,PID,PID,ahk_id %g_hWnd%
StrQuery:= "SELECT * FROM Win32_Process WHERE ProcessId=" . PID
Enum:= ComObjGet("winmgmts:").ExecQuery(StrQuery)._NewEnum
if(Enum[Process]) {
	ExePath:= Process.ExecutablePath ; hIcon:= GetFileIcon(ExePath,0)
	if(archived_path:=icon_arr[_:=Process.Name])
		hIcon:= archived_path
	else,switch,Process.Name {
		case,"AUTOHOTKEYU64_UIA.EXE": hIcon:= "C:\Icon\256\Autism5.ico"
		;default : hIcon:= "HICON: " . LoadPicture(ExePath,"w64 Icon" . 0,ErrorLevel)
		default : hIcon:= ExePath
			if(!hIcon||ExePath=="")
				hIcon:= "C:\Script\AHK\- Script\WinSpy\Resources\INJEX.ani"
	} ; winanimate(hProgIcon,"hide center",150),	; winanimate(hfukbk2,"hide center",150)
	; guicontrol,hide,ProgIcon; winset,transparent,1,ahk_id %hprogicon%,; winset,transparent,off,ahk_id %hprogicon%
	; guicontrol,+backgroundtrans,ahk_id %hProgIcon%
	guicontrol,,ProgIcon,%	hIcon
	guicontrol,hide,ahk_id %hfukbk2%
	; guicontrol,hide,ProgIcon,;guicontrol,show,ProgIcon,	;guicontrol,hide,ahk_id %hfukbk2%
	guicontrol,show,ahk_id %hfukbk2% ;guicontrol,hide,ProgIcon
	sleep,20
	; winanimate(hProgIcon,"activate slide vneg",120)
	; winanimate(hfukbk2,"activate center",120)
	; winset,RedRaw,,ahk_id %hfukbk2% ; winset,RedRaw,,ahk_id %fukbk%
	; guicontrol,% "+backgroundtrans",ProgIcon; winset,RedRaw,,ahk_id %hProgIcon%
	sleep 20
	; guicontrol,+backgroundtrans,ahk_id %hProgIcon%; guicontrol,+backgroundtrans,ahk_id %fukbk%
	; guicontrol,+backgroundtrans,ahk_id %hfukbk2%; guicontrol,show,ProgIcon
	; winset,RedRaw,,ahk_id %hProgIcon%; winset,RedRaw,,ahk_id %hProgIcon%
	; win_move(fukbk,"","",76,76,-1);win_move(hProgIcon,"","" ,64,64,-1);win_move(hfukbk2,"","" ,76,76,-1)
	; winset,top,,ahk_id %hProgIcon%; winset,exstyle,+0x8,ahk_id %hProgIcon%;l;
	guicontrol,,	vProgName,%	Process.Name
	fileGetVersion,	ProgVer,%	ExePath
	guicontrol,,	ProgVer,%	ProgVer
	gui,listview,%	hProcInfo
	SubStr((CreationDate:= Process.CreationDate),1,InStr(CreationDate,".") -1)
	formatTime,CreationDate,%CreationDate% D1 T0 ;Short date and time with seconds;
	LV_Delete(), LV_Add("","Path",ExePath)
	, CMDline:= Process.CommandLine ;LV_Add("","VirtualSize",formatBytes(Process.VirtualSize,Sep,"mb"));
	, LV_Add("","CmdLine",CMDline)
	, LV_Add("","Started",CreationDate) ;LV_Add("","Image Type",GetImageType(PID));
	, LV_Add("","Process ID",Process.ProcessId)
	, LV_Add("","Thread ID",DllCall("GetWindowThreadProcessId","Ptr",g_hWnd,"Ptr",0))
	, LV_Add("","WorkingSet",formatBytes(Process.WorkingSetSize,Sep,"mb"))
} return,

SetExplorerTheme(hWnd) {
	return,DllCall("UxTheme.dll\SetWindowTheme","Ptr",hWnd,"WStr","explorer","Ptr",0)
}

SetButtonIcon(hButton,File,Index:=1,pos="") {
	static BUTTON_IMAGELIST_ALIGN_LEFT:= 0x0, BUTTON_IMAGELIST_ALIGN_RIGHT:= 0x1
	, BUTTON_IMAGELIST_ALIGN_TOP:= 0x2, BUTTON_IMAGELIST_ALIGN_BOTTOM:= 0x3, BUTTON_IMAGELIST_ALIGN_CENTER:= 0x4
	((pos="")? pos:= BUTTON_IMAGELIST_ALIGN_LEFT : pos:= "BUTTON_IMAGELIST_ALIGN_" . ltrim(pos:= rtrim(pos)))
	;	loop,parse,% "LEFT,RIGHT,TOP,BOTTOM",`,
	;		(a_Loopfield=pos)? (np:= "BUTTON_IMAGELIST_ALIGN_" . a_Loopfield)
	;		: (np:= "BUTTON_IMAGELIST_ALIGN_LEFT")
	himl:= DllCall("ImageList_Create","Int",16,"Int",16,"UInt",0x20,"Int",1,"Int",1,"Ptr") ;ILC_COLOR32;
	IL_Add(himl,File,Index)
	VarSetCapacity(BUTTON_IMAGELIST,20 +A_PtrSize,0)
	NumPut(himl,BUTTON_IMAGELIST,0,"Ptr") ;Alignment,BUTTON_IMAGELIST_ALIGN_CENTER;
	NumPut(%pos%,BUTTON_IMAGELIST,16 +A_PtrSize,"UInt")
	SendMessage,0x1602,0,&BUTTON_IMAGELIST,,ahk_id %hButton% ;BCM_SETIMAGELIST;
	return,ErrorLevel
}

GetImageType(PID) {	;PROCESS_QUERY_INforMATION;
	hProc:= DllCall("OpenProcess","UInt",0x400,"Int",False,"UInt",PID,"Ptr")
	if(!hProc)
		return,"N/A"
	if(A_Is64bitOS) ;Determines whether the specified process is running under WOW64.;
		Try,DllCall("IsWow64Process","Ptr",hProc,"Int*",Is32Bit:= True)
	else,Is32Bit:= True
	DllCall("CloseHandle","Ptr",hProc)
	return,(Is32Bit)? "32-bit":"64-bit"
}

GetWindowPlacement(hWnd) {
	VarSetCapacity(WINDOWPLACEMENT,44,0)
	NumPut(44,WINDOWPLACEMENT)
	DllCall("GetWindowPlacement","Ptr",hWnd,"Ptr",&WINDOWPLACEMENT)
	Result:= {}
	Result.x:= NumGet(WINDOWPLACEMENT,7 *4,"UInt"),	Result.y:= NumGet(WINDOWPLACEMENT,8 *4,"UInt")
	Result.w:= NumGet(WINDOWPLACEMENT,9 *4,"UInt") -Result.x, Result.h:= NumGet(WINDOWPLACEMENT,10 *4,"UInt") -Result.y
	Result.showCmd:= NumGet(WINDOWPLACEMENT,8,"UInt")
	return,Result ;1=normal, 2=minimized, 3=maximized;
}

GetWindowInfo(hWnd) {
	NumPut(VarSetCapacity(WINDOWINFO,60,0),WINDOWINFO)
	DllCall("GetWindowInfo","Ptr",hWnd,"Ptr",&WINDOWINFO)
	wi:= Object()
	,wi.WindowX:= NumGet(WINDOWINFO,4,"Int"),  wi.WindowY:= NumGet(WINDOWINFO,8,"Int")
	,wi.WindowW:= NumGet(WINDOWINFO,12,"Int") -wi.WindowX
	,wi.WindowH:= NumGet(WINDOWINFO,16,"Int") -wi.WindowY
	,wi.ClientX:= NumGet(WINDOWINFO,20,"Int"), wi.ClientY:= NumGet(WINDOWINFO,24,"Int")
	,wi.ClientW:= NumGet(WINDOWINFO,28,"Int") -wi.ClientX
	,wi.ClientH:= NumGet(WINDOWINFO,32,"Int") -wi.ClientY
	,wi.Style  := NumGet(WINDOWINFO,36,"UInt"),wi.ExStyle:= NumGet(WINDOWINFO,40,"UInt")
	,wi.Active := NumGet(WINDOWINFO,44,"UInt"),wi.BorderW:= NumGet(WINDOWINFO,48,"UInt")
	,wi.BorderH:= NumGet(WINDOWINFO,52,"UInt"),wi.Atom   := NumGet(WINDOWINFO,56,"UShort")
	,wi.Version:= NumGet(WINDOWINFO,58,"UShort")
	return,wi
}

sbiconreset() {
	static init:= 0, inc:= 452, eyeo
	SendMessage,0x40F,0,% img["ico_EyeOpn48"],,ahk_id %SbarhWnd% ;(init=0? (img["ico_EyeOpn48"].push({"hicon":eyeo}),init:=1))
}

GetParent(hWnd) {
	return,DllCall("GetParent","Ptr",hWnd,"Ptr")
}

GetOwner(hWnd) {
	return,DllCall("GetWindow","Ptr",hWnd,"UInt",4,"Ptr") ;GW_OWNER;
}

ShowWindow(hWnd,nCmdShow:= 1) {
	DllCall("ShowWindow","Ptr",hWnd,"Int",nCmdShow)
}

IsWindow(hWnd) {
	return,DllCall("IsWindow","Ptr",hWnd)
}

IsWindowVisible(hWnd) {
	return,DllCall("IsWindowVisible","Ptr",hWnd)
}

GetMenu(hWnd) {
	return,DllCall("GetMenu","Ptr",hWnd,"Ptr")
}

GetSubMenu(hMenu, nPos) {
	return,DllCall("GetSubMenu","Ptr",hMenu,"Int",nPos,"Ptr")
}

GetMenuItemCount(hMenu) {
	return,DllCall("GetMenuItemCount","Ptr",hMenu)
}

GetMenuItemID(hMenu, nPos) {
	return,DllCall("GetMenuItemID","Ptr",hMenu,"Int",nPos)
}

GetMenuString(hMenu,uIDItem) { ;uIDItem: the zero-based relative position of the menu item;
	Local lpString, MenuItemID
	VarSetCapacity(lpString,4096)
	if(!(DllCall("GetMenuString","Ptr",hMenu,"UInt",uIDItem,"Str",lpString,"Int",4096,"UInt",0x400))) {
		MenuItemID:= GetMenuItemID(hMenu,uIDItem)
		if(MenuItemID>-1)
			return,"SEPARATOR"
		else,return,(GetSubMenu(hMenu,uIDItem))? "SUBMENU":"ERROR"
	} return,lpString
}

GetFileIcon(File,SmallIcon= 1) {
	VarSetCapacity(SHFILEINFO,cbFileInfo:= A_PtrSize +688)
	if(DllCall("Shell32.dll\SHGetFileInfoW"
	, "WStr",File
	, "UInt",0
	, "Ptr",&SHFILEINFO
	, "UInt",cbFileInfo
	, "UInt",0x100|SmallIcon)) { ;SHGFI_ICON
		return,NumGet(SHFILEINFO,0,"Ptr")
}	}

SetWindowPos(hWnd,x,y,w,h,hWndInsertAfter:= 0,uFlags:= 0x40) { ;SWP_SHOWWINDOW
	return,DllCall("SetWindowPos","Ptr",hWnd,"Ptr",hWndInsertAfter,"Int"
	,x,"Int",y,"Int",w,"Int",h,"UInt",uFlags)
}

;SendMessage,0x80,0,hSmIcon,,ahk_id %hWnd% ; WM_SETICON,ICON_SMALL
;SendMessage,0x80,1,hLgIcon,,ahk_id %hWnd% ; WM_SETICON,ICON_LARGE

SetWindowIcon(hWnd="",SmIconFilename="",LgIconFilename="",Index=1) {
	switch,A_ScreenDPI {
		case,96 :smxy:= 16, Lgxy:= 32
		case,120:smxy:= 20, Lgxy:= 40
		case,144:smxy:= 24, Lgxy:= 48
		case,192:smxy:= 28, Lgxy:= 64
		case,240:smxy:= 32, Lgxy:= 64
	} (SmIconFilename!=""? hSmIcon:= LoadPicture(SmIconFilename,"w" Smxy " Icon" . Index,ErrorLevel)
	, SendMessage(hWnd,0x80,0,hSmIcon))
	(LgIconFilename!=""? hLgIcon:= LoadPicture(LgIconFilename,"w" Lgxy " Icon" . Index,ErrorLevel)
	, SendMessage(hWnd,0x80,1,hLgIcon))
	return,ErrorLevel
}

SendMessage(hwnd="",Message="",wParam=0,lParam=0) {
	SendMessage,% Message,% wParam,% lParam,,% "ahk_id " (hwnd=""? g_hWnd:hwnd)
	return,ErrorLevel
}

GetClientCoords(hWnd,ByRef X,ByRef Y) {
	VarSetCapacity(POINT,8,0)
	NumPut(X,POINT,0,"Int"), NumPut(Y,POINT,4,"Int")
	hParent:= GetParent(hWnd)
	DllCall("ScreenToClient","Ptr",(hParent==0? hWnd:hParent),"Ptr",&POINT)
	X:= NumGet(POINT,0,"Int"), Y:= NumGet(POINT,4,"Int")
}

GetWindowCoords(hWnd,ByRef X,ByRef Y) {
	hParent:= GetParent(hWnd)
	wingetPos,pxx,pyy,,,% "ahk_id" . (hParent==0? hWnd:hParent)
	X:= X-pxx, Y:= Y-pyy
}

ControlGetTabs(hTab) {
	Static MAX_TEXT_LENGTH:= 260, MAX_TEXT_SIZE:= MAX_TEXT_LENGTH *(A_IsUnicode? 2:1)
	winget,PID,PID,ahk_id %hTab%
	if(!(hProc:= DllCall("OpenProcess","UInt",0x438,"Int",False,"UInt",PID,"Ptr")))
		return,	;Open the process for read/write and query info;
	if(A_Is64bitOS) ;PROCESS_VM_READ|PROCESS_VM_WRITE|PROCESS_VM_OPERATION|PROCESS_QUERY_INforMATION
		Try,DllCall("IsWow64Process","Ptr",hProc,"Int*",Is32bit:= true)
	else,Is32bit:= True
	RPtrSize:= Is32bit? 4:8, TCITEM_SIZE:= 16 +RPtrSize *3 ;Allocate a buffer in the (presumably) remote process.
	remote_item:= DllCall("VirtualAllocEx","Ptr",hProc,"Ptr",0
						 , "uPtr",TCITEM_SIZE +MAX_TEXT_SIZE
						 , "UInt",0x1000,"UInt",4,"Ptr") ;MEM_COMMIT,PAGE_READWRITE;
	remote_text:= remote_item +TCITEM_SIZE, VarSetCapacity(TCITEM,TCITEM_SIZE,0)
	NumPut(1,TCITEM,0,"UInt") ;mask (TCIF_TEXT) ;Prepare the TCITEM structure locally.;
	NumPut(remote_text,TCITEM,8 +RPtrSize) ;pszText;
	NumPut(MAX_TEXT_LENGTH,TCITEM,8 +RPtrSize *2,"Int") ;cchTextMax;
	DllCall("WriteProcessMemory","Ptr",hProc,"Ptr",remote_item,"Ptr",&TCITEM,"UPtr",TCITEM_SIZE,"Ptr",0)
	Tabs:= [] ;above; Write the local structure into the remote buffer^
	VarSetCapacity(TabText,MAX_TEXT_SIZE)
	SendMessage,0x1304,0,0,,ahk_id %hTab% ;TCM_GETITEMCOUNT;
	Loop,% (ErrorLevel !="FAIL")? ErrorLevel:0 { ;Retrieve the item text.;
		SendMessage,% (A_IsUnicode)? 0x133C:0x1305,A_Index -1,remote_item,,ahk_id %hTab% ;TCM_GETITEM
		if(ErrorLevel==1) { ; Success
			DllCall("ReadProcessMemory","Ptr",hProc,"Ptr",remote_text,"Ptr",&TabText,"UPtr",MAX_TEXT_SIZE,"Ptr",0)
		} else,TabText:= ""
		Tabs[A_Index]:= TabText
	}	; Release the remote memory and Handle.
	DllCall("VirtualFreeEx","Ptr",hProc,"Ptr",remote_item,"UPtr",0,"UInt",0x8000) ;MEM_RELEASE
	DllCall("CloseHandle","Ptr",hProc)
	return,Tabs
}

GetClassName(hWnd) {
	wingetClass,Class,ahk_id %hWnd%
	return,Class
}

GetClassLong(hWnd,Param) {
	Static GetClassLong:= A_PtrSize==8? "GetClassLongPtr":"GetClassLong"
	return,DllCall(GetClassLong,"Ptr",hWnd,"Int",Param)
}

GetWindowLong(hWnd,Param) { ;GetWindowLong:= A_PtrSize==8? "GetWindowLongPtr":"GetWindowLong"
	return,DllCall("GetWindowLong","Ptr",hWnd,"Int",Param)
}

GetFont() {
	global FontName:= FontSize:= FontStyle:= ""
	wingetclass,Class,ahk_id %g_hWnd%
	if(Class=="Scintilla") { ;SCI_STYLEGETSIZE,STYLE_DEFAULT
		FontName:= Scintilla_GetFont(g_hWnd), FontSize:= SendMsg(2485,32)
	} else {
		Control_GetFont(g_hWnd,FontName,FontSize,FontStyle)
		if(FontName==""||FontSize>1000)
			return,"System default"
	} FontInfo:= FontName . ", " . format("{:d}",FontSize)
	(FontStyle !=""? FontInfo .=", " . FontStyle)
	return,FontInfo
}

Control_GetFont(hWnd,ByRef Name,ByRef Size,ByRef Style,IsGDIFontSize:= 0) {
	SendMessage 0x31,0,0,,ahk_id %hWnd% ;WM_GETFONT
	if(ErrorLevel=="FAIL")
		return,
	hFont:= Errorlevel
	VarSetCapacity(LOGFONT,LOGFONTSize:= 60 *(A_IsUnicode? 2:1))
	DllCall("GetObject","Ptr",hFont,"Int",LOGFONTSize,"Ptr",&LOGFONT)
	Name:= DllCall("MulDiv","Int",&LOGFONT +28,"Int",1,"Int",1,"Str")
	Style:= Trim((Weight:= NumGet(LOGFONT,16,"Int"))==700? "Bold":(Weight==400)? "": " w" . Weight
	. (NumGet(LOGFONT,20,"UChar")? " Italic":"")
	. (NumGet(LOGFONT,21,"UChar")? " Underline":"")
	. (NumGet(LOGFONT,22,"UChar")? " Strikeout":""))
	Size:= IsGDIFontSize? -NumGet(LOGFONT,0,"Int") : Round((-NumGet(LOGFONT,0,"Int") *72)/ A_ScreenDPI)
}

Scintilla_GetFont(hWnd) {
	winget,PID,PID,ahk_id %hWnd%
	if(!(hProc:= DllCall("OpenProcess","UInt",0x438,"Int",False,"UInt",PID,"Ptr")))
		return,
	Address:= DllCall("VirtualAllocEx","Ptr",hProc,"Ptr",0,"UPtr",32,"UInt",0x1000,"UInt",4,"Ptr")
	SendMessage,2486,32,Address,,ahk_id %hWnd% ;SCI_STYLEGETFONT, STYLE_DEFAULT
	if(ErrorLevel !="FAIL") { ;LF_FACESIZE:= 32
		VarSetCapacity(FontName,32,0)
		DllCall("ReadProcessMemory","Ptr",hProc,"Ptr",Address,"Ptr",&FontName,"UPtr",32,"Ptr",0)
		FontName:= StrGet(&FontName,"UTF-8")
	}
	DllCall("VirtualFreeEx","Ptr",hProc,"Ptr",Address,"UPtr",0,"UInt",0x8000) ;MEM_RELEASE
	DllCall("CloseHandle","Ptr",hProc)
	return,FontName
}

Scintilla_GetLexerLanguage(hWnd) {
	winget,PID,PID,ahk_id %hWnd%
	if(!(hProc:= DllCall("OpenProcess","UInt",0x438,"Int",False,"UInt",PID,"Ptr")))
		return,
	Sendmessage,4012,0,0,,ahk_id %hWnd% ;SCI_GETLEXERLANGUAGE
	BufferSize:= ErrorLevel
	Address:= DllCall("VirtualAllocEx","Ptr",hProc,"Ptr",0,"UPtr",BufferSize,"UInt",0x1000,"UInt",4,"Ptr")
	Sendmessage,4012,0,Address,,ahk_id %hWnd% ;SCI_GETLEXERLANGUAGE
	if(ErrorLevel!="FAIL") {
		VarSetCapacity(LexerName,BufferSize,0)
		DllCall("ReadProcessMemory","Ptr",hProc,"Ptr",Address,"Ptr",&LexerName,"UPtr",32,"Ptr",0)
		LexerName:= StrGet(&LexerName,"UTF-8")
	}
	DllCall("VirtualFreeEx","Ptr",hProc,"Ptr",Address,"UPtr",0,"UInt",0x8000) ;MEM_RELEASE
	DllCall("CloseHandle","Ptr",hProc)
	return,LexerName
}

GetClassStyles(Style) {
	Static CS:= {0x1: "CS_VRedRaw", 0x2: "CS_HRedRaw", 0x8: "CS_DBLCLKS", 0x20: "CS_OWNDC"
	,	0x40: "CS_CLASSDC", 0x80: "CS_PARENTDC", 0x200: "CS_NOCLOSE", 0x800: "CS_SAVEBITS"
	,	0x1000: "CS_BYTEALIGNCLIENT", 0x2000: "CS_BYTEALIGNWINDOW", 0x4000: "CS_globalCLASS"
	,				0x10000: "CS_IME", 0x20000: "CS_DROPSHADOW"},	Styles:= " ("
	for,k,v in CS
		((Style &k)? Styles .= v ", ")
	return,RTrim(Styles, ", ") . ")"
}

LoadCursors() {
	Static Constants:= {"IDC_ARROW": 32512, "IDC_IBEAM": 32513, "IDC_WAIT": 32514, "IDC_CROSS": 32515
		, "IDC_UPARROW": 32516, "IDC_SIZENWSE": 32642, "IDC_SIZENESW": 32643, "IDC_SIZEWE": 32644
		, "IDC_SIZENS": 32645, "IDC_SIZEALL": 32646, "IDC_NO": 32648, "IDC_HAND": 32649
		, "IDC_APPSTARTING": 32650, "IDC_HELP": 32651}
	for,Key,Value in Constants {
		hCursor:= DllCall("LoadCursor","Ptr",0,"UInt",Value,"Ptr")
		Cursors[hCursor]:= Key
	}
}

GetCursor(CursorHandle) {
	Cursor:= Cursors[CursorHandle]
	return,(Cursor!="")? Cursor:CursorHandle
}

ControlFromPoint(mx,my,hWnd) {
	((hParent:= GetParent(hWnd))==0? hParent:= hWnd)
	SmallerArea:= 999999999, hChildWnd:= 0
	winget,List,ControlListHwnd,ahk_id %hParent% ; EnumChildWindows
	Loop,Parse,List,`n
	{
		VarSetCapacity(RECT,16,0)
		DllCall("GetWindowRect","Ptr",A_LoopField,"Ptr",&RECT)
		Left:= NumGet(RECT,0,"Int"), Right:= NumGet(RECT,8,"Int")
		Top:= NumGet(RECT,4,"Int"), Bottom:= NumGet(RECT,12,"Int")
		if((mx >= Left) && (mx <= Right) && (my >= Top) && (my <= Bottom)) {
			Area:= (Right -Left) *(Bottom -Top)
			if(Area<SmallerArea) {
				SmallerArea:= Area, hChildWnd:= A_LoopField
	}	}	} return,(hChildWnd==0? hWnd:hChildWnd)
}

IsChild(hWnd) {
	winget,Style,Style,ahk_id %hWnd%
	return,Style &0x40000000 ;WS_CHILD
}

ExStyleSet(hWNd11,eXstyle) {
	winset,eXstyle,%eXstyle%,ahk_id %hWNd11%
	return,!errorlevel
}

StyleSet(hWNd11,style) {
	winset,style,%style%,ahk_id %hWNd11%
	return,!errorlevel
}

GetAncestor(hWnd,Flag:= 2) { ; Flag: GA_PARENT=1,GA_ROOT=2,GA_ROOTOWNER=3 ;
	return,DllCall("GetAncestor","Ptr",hWnd,"UInt",Flag,"Ptr")
}

Dec2HeX(Dec) {
	return,format("{:#x}",Dec)
}

IsWindowEnabled(hWnd) {
	return,DllCall("IsWindowEnabled","Ptr",hWnd)
}

GetClassNNEx(hWnd) {
	NN:= 0
	if(!hAncestor:= GetAncestor(hWnd))
		return,
	wingetClass,BaseClass,ahk_id %hWnd%
	winget,ControlList,ControlListHwnd,% "ahk_id " . hAncestor
	Loop,Parse,ControlList,`n
	{
		wingetClass,Class,ahk_id %A_LoopField%
		if(Class==BaseClass) {
			NN++
			if(A_LoopField==hWnd)
				return,Class . NN
}	}	}

formatBytes(Value,sThousand:= ".",Unit:= -1,ShowUnit:= True) {
	if((Unit==-1 && Value>999) || Unit=="K")
		Value /=1024, Unit:= ShowUnit? " K":""
	else,if (unit="mb")
		Value:=round((Value/=1024)/1024), (Unit:= ShowUnit? " MB ":"")
	else,Unit:= (ShowUnit? " B":"")
	a:= ""
	Loop,% StrLen(Value)
		a.=SubStr(Value,1-A_Index,1)
	,	(Mod(A_Index, 3)==0)? a.=sThousand : ()
	a:= RTrim(a,sThousand), b:= ""
	Loop,% StrLen(a)
		b.=SubStr(a,1-A_Index,1)
	return,(b . Unit)
}

INI_Read:
IniFile:= AppName . ".ini", Version:= "1.0.3"
IniRead,pxx,%IniFile%,Settings,x,Center
IniRead,pyy,%IniFile%,Settings,y,Center
IniRead,g_DetectHiddn,% IniFile,Settings,	DetectHiddn,0
IniRead,g_Minimize,%	IniFile,Settings,	CompactMode,0
IniRead,g_Topmost,%	IniFile,Settings,	AlwaysOnTop,0
IniRead,g_ShowBorder,%	IniFile,Screenshot,	ShowBorder,	1
IniRead,g_BorderColor,%	IniFile,Screenshot,	BorderColor,0xFF0000
IniRead,g_BorderWidth,%	IniFile,Screenshot,	BorderWidth,4
		g_BorderColorTemp:= g_BorderColor
return,

SettingsShow:
if(IsWindowVisible(hSettingsDlg)) {
	winanimate(hSettingsDlg,"hide slide hneg",150) 	;winhide,ahk_id %hSettingsDlg%
	gui,Settings:destroy
	return,
} p:= wingetpos(hSpyWnd)
gui,Settings:New,-dpiscale LabelSettings hWndhSettingsDlg -MinimizeBox +MinSize429x420 +MaxSize429x420 -0x400000 +0x40000
SetWindowIcon(hSettingsDlg,"C:\Script\AHK\- Script\WinSpy\Resources\cog24.ico")
SendMessage,0x80,0,hSmIcon,,ahk_id %hWnd% ; WM_SETICON,ICON_SMALL
	SendMessage,0x80,1,hLgIcon,,ahk_id %hWnd% ; WM_SETICON,ICON_LARGE
gui,Font,s10,Continuum light
if g_Topmost
	gui, +alwaysontop +E0x8
gui,Color,black
gui,Add,GroupBox,x8 y7 w412 h54,% AppName
gui,Add,CheckBox,gCheckChecks vg_Topmost x62 y29 w319 h24 Checked%g_Topmost%
,%	"Always on top. (BAND_UIACCESS)"
gui,Add,GroupBox,x8 y69 w412 h152,Screenshot
gui,Add,Radio,% "x90 y110 w300 h23 " . (!g_ShowBorder? 		"Checked":"")
,%	"Only capture control-element. "
gui,Add,Radio,vg_ShowBorder x90 y145 w300 h23 Checked%g_ShowBorder%
,%	"Highlight control element. "
gui,Add,Text,x48 y187 w200 h28 +0x200,% 					"Border-Color:"
gui,Add,Progress
,vBorderColorPreview hwndhBorderColorPrev x170 y185 w28 h28 +0x800000 c%g_BorderColor%,100
;gui,Add,Button,gChooseBorderColor x200 y187 w80 h32,% "Choose"
gui,Add,Text,x240 y187 w120 h28 +0x200,%					"Width:"
gui,Add,Edit,vg_BorderWidth x306 y187 w42 h28
gui,Add,UpDown,x350 y185 w24 h40,% g_BorderWidth
gui,Add,Text,x-1 y280 w338 h48 -Background +Border
gui,Add,Button,gApplySettings x85 y365 w80 h38 +Default,% "&OK"
gui,Add,Button,gSettingsClose x253 y365 w84 h38 +0x56012000 +E0x8,%	"&Cancel"
gui Add,Slider,x48 y246 hwndhtabhslider altsubmit vTabHeightSlider gTabHeightSlider NoTicks Range%MinTabHeight%-%MaxTabHeight% Vertical,% TAB_GetItemHeight(hTab)
winset,style,-0x80000000,ahk_id %hSettingsDlg%
winset,style,+0x40000000,ahk_id %hSettingsDlg%
gui Add,Text,x12 y230 Section,Tab-Height:%A_Space% (disfunctional)
gui,Show,% "na hide x" p.x +p.w " y" p.y +300 " w429 h410",% 		"Settings"
WinAnimate(hSettingsDlg,"activate slide hpos",150)

gui,Settings: +MinSize429x410 +MaxSize429x410
winactivate,ahk_id %hspywnd%
loop,parse,% "hxywh,hSettingsDlg",`,
{
	gk:= %a_loopField%
	winset,top,,ahk_id %gk%
} return,

SettingsClose:
SettingsEscape:
gui,Settings:Destroy
return,

ApplySettings:
gui,Settings:Submit
if(g_Topmost)
	winset,top,,ahk_id %hSpyWnd% ;winset,top,% g_Topmost? "On":"Off",ahk_id %hSpyWnd%
g_ShowBorder:= (g_ShowBorder==2)? 1:0
g_BorderColor:= g_BorderColorTemp
return,

;-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

isSingleton() {
	global AppName, r_PID
	r_PID:= DllCall("GetCurrentProcessId")
	if(!_:= winexist(AppName " ahk_class AutoHotkeyGUI")) {
		process,exist,AppName " ahk_class AutoHotkeyGUI"
		if(!pid:=errorlevel)
			return,r_PID
		else,if(pid!=R_pid)
			return,r_PID
	} else {
		winget,pidNew,pid,ahk_id %_%
		if(pidnew!=r_pid) {
			_:= Send_WMCOPYDATA("fadein",A_scriptname "ahk_class AutoHotkey ahk_pid " pidNew)
			exitapp,
			return,
}	}	}

RedRaww(){
	msgbox,never prox
}

CheckChecks:
if(g_Topmost){
	guicontrol,,% topmcheck,0
	guicontrol,,% topmcheck,-1
	;SendMessage,0xF3,2,0,,% "ahk_id " topmcheck ;BM_SETSTATE
	;SendMessage,0xF1,2,0,,% "ahk_id " topmcheck ;BM_SETSTATE
	;loop,parse,% "hSettingsDlg,hxywhhScrollInfo,hFindDlg,hTreeWnd",`,
	;	winset,top,,% "ahk_id " %a_loopField%
} if(g_DetectHiddn)
	guicontrol,,% dhwcheck,0
	guicontrol,,% dhwcheck,-1
	;SendMessage,0xF3,2,0,,% "ahk_id " dhwcheck ;BM_SETSTATE
	;SendMessage,0xF1,2,0,,% "ahk_id " dhwcheck ;BM_SETSTATE
return,

TargetManually() {
	mousegetpos,x,y,g_hWnd,cw,3
	ShowWindowInfo(g_hWnd),	TT("Ok.")
	return,g_hWnd
}

Receive_WM_COPYDATA(wParam,lParam) {
	switch,CopyOfData:= StrGet(StringAddress:= NumGet(lParam +(2* A_PtrSize))) {
		case,"fadein" : settimer,WinkUI,-20
	}
	return,1
}

WinkUI:
winactivate,ahk_id %hSpyWnd%
winset,style,-0x40000,ahk_id %hSpyWnd%
WinAnimate(hSpyWnd,"hide center",120)
sleep,30
winset,exstyle,+0x2000000,ahk_id %hSpyWnd%
WinAnimate(hSpyWnd,"activate center",100)
winactivate,ahk_id %hSpyWnd%
winset,exstyle,-0x2000000,ahk_id %hSpyWnd%
winset,style,+0x040000,ahk_id %hSpyWnd%
return,

FlashWindow:
(A_gui=="Tree"? hWnd:= TreeIDs[TV_GetSelection()]: hWnd:= g_hWnd)
loop,3
	ShowBorder(hWnd,200,0xFF0000)
	, Ssleep(200)
return,

AnimateShow(hWNd) {
	;winset,style,-0x0840000,ahk_id %hSpyWnd%
	;winset,exstyle,+0x2000000,ahk_id %hSpyWnd%
	;WinAnimate(HWND,"activate center",250)
	winset,exstyle,-0x2000000,ahk_id %hSpyWnd%
	winset,style,+0x0840000,ahk_id %hSpyWnd%
	;WinAnimate(htab3,"activate center",250)
	gui,spy:Show,na
}

OnWM_SYSCMD(wParam,lParam="",msg="",hWnd="") {
	if(wParam=0xC0DE) {
		gui,Spy:+OwnDialogs
		MsgBox,0x40040,About,WincePie %Version%`nWindow information tool`n`nCredits:`n - MW (WincePie developer)`n - Lexicos (AHk developer)
}	}

menHandl4:
switch,A_ThisMenuItem {
	case,"Visible" : ShowWindow(g_hWnd,!IsWindowVisible(g_hWnd))
	case,"Enabled" : DllCall("EnableWindow","Ptr",g_hWnd,"UInt",!IsWindowEnabled(g_hWnd))
	case,"Always on Top": winset,Top,,ahk_id %g_hWnd%;winset,AlwaysOnTop,Toggle,ahk_id %g_hWnd%
	case,"Close Window" : WinClose,ahk_id %g_hWnd%
	case,"RedRaw Window": winset,RedRaw,,ahk_id %g_hWnd%
} return,

menhangla(wparam="",lparam="") {
	static Open:=65407, EDITSCRIPT:=65304, EXIT:=65307
	, SUSPENDvks:=65305, Pause:=65306, Reload:= 65303
	switch,dui:= strreplace(strreplace(strreplace(strreplace(a_thismenuitem,"'"),"-")," "),"&") {
		case,"Open containing": return,open_containing(a_scriptfullpath)
		case,"reload" :	gosub,ini_write
				cok:=%dui%
		default: cok:=%dui%
	} if(cok)
		PostMessage,0x0111,%cok%,,,% A_ScriptName " - AutoHotkey"
}

WM_TRAYMEN(wParam="",byref lParam="") { ;tray-menu;
	switch,lParam {  ;case,0x0206: ;WM_RBUTTONDBLCLK; case,0x020B:;WM_XBUTTONDOWN
	;	case,0x0201: ;WM_LBUTTONDOWN; case,0x0202:;WM_LBUTTONUP
		case,0x0204: settimer,menfunctest,-10 ;WM_RBUTTONdn;
		case,0x0203: settimer,WinkUI,-20 ;WM_doubleclick0x0203; ;settimer,ID_VIEW_VARIABLES,-10	;return,tt("Loading Var-table...","tray",1);,DllCall("PostMessage","Ptr",a_scripthwnd,"UInt",0x111,"int",65407,"int",0) ;PostMessage,0x0111,65407,,,% a_ScriptName " - AutoHotkey"; sleep(80),
	}
	return,
}

menfunctest() {
	global
	trayActiv:= True
	Menu,Tray,Show
	trayActiv:= False
}

Menuz:
Menu,Tray,Icon
Menu,Tray,Icon,% "C:\Icon\48_24\WINSPY48_24.ico"
Menu,Tray,noStandard
try,menu,Tray,Deleteall ; menu,tray,new
menu,Tray,add,Open Script Folder,% "Open_Script_Location"
;menu,tray,NoStandard ; menu,tray,icon,% TrayIconPath ;menu,tray,	add,%	"Open Script Dir",		S_OpenDir
menu,tray,Add,%	"Open",			menhangla
menu,tray,Icon,%	"Open",%			"C:\Icon\64ribbon\regview3264.ico",,48
menu,tray,Add,%	"Open Containing",menhangla
menu,tray,Icon,%	"Open Containing",%	"C:\Icon\256\#86_2.ico",,48
menu,tray,Add,%	"Edit Script",	menhangla
menu,tray,Icon,%	"Edit Script",%		"C:\Icon\256\np++Hackjob.ico",,48
menu,tray,Add,%	"Reload",%	"menhangla"		;DllCall("PostMessage","Ptr",a_scripthwnd,"UInt",0x111,"int",65303,"int",0)

menu,tray,Icon,%	"Reload",%			"C:\Icon\256\IDI_ICON1.ico",,48
menu,tray,Add,%	"Suspend VKs",	menhangla
menu,tray,Icon,%	"Suspend VKs",%		"C:\Icon\256\invert_goatse_256.ico",0,48
menu,tray,Add,%	"Pause",		menhangla
menu,tray,Icon,%	"Pause",%			"C:\Icon\24\head_fk_a_24_c2b.ico",,48
menu,tray,Add,%	"Exit",			menhangla
menu,tray,Icon,%	"Exit",%			"C:\Icon\256\DOO0m.ico",,48
return,

setExplorerTheme:
setExplorerTheme(hClassInfo)
,SetExplorerTheme(hPropInfo)
,SetExplorerTheme(hProcInfo)
,SetExplorerTheme(hExtraInfo)
,SetExplorerTheme(hChildList)
,SetExplorerTheme(hSiblingList)
return,

Open_Script_Location:
toolTip,% a_scriptFullPath
E=explorer.exe /select,%a_scriptFullPath%
run,%comspec% /C %E%,,hide
return,

CurChanged: ;hOldCursor2:=DllCall("SetCursor","Ptr",img["ani_syringe"],"Ptr")tt("vvdfvd")
(CurChanged=0)? (CurChanged:=1, CurSet(ResDir . ChangeToIcon), ssleep(100)) ;img["ani_syringe"],"Ptr")
return,

CurCheck:
if(CurChanged) {
	mousegetpos,,,hwnd,cwnd,2
	if(hwnd=hspywnd) {
		settimer,curcheck,-100
		return,
	}
	CurChanged:=false
DllCall("SystemParametersInfo","uInt",0x57,"uInt",0,"uInt",0,"uInt",0) ;RestoreCursor()
} return,

CurChanged1:
CurChanged:= 1
SetSystemCursor(ResDir . ChangeToIcon,48,48)
settimer,curcheck,-100
return,
ssleep(90)
loop {
	mousegetpos,,,,hwndnn,2
		if(!(hwndnn=hBtnCmds)) {
			settimer,curcheck_general,-10 ;tt(htab "dfsdfd" hwndnn)
			return,
	} ssleep(250)
} return,

Cur_RestoreOld:
DllCall("SetCursor","Ptr",hOldCursor2,"Ptr")
tt("reset")
sleep,40
CurChanged:= 0
return,

ExitFunc() {
	global
	winset,style,-0x40000,ahk_id %hSpyWnd%
	DllCall("SystemParametersInfo","uInt",0x57,"uInt",0,"uInt",0,"uInt",0) ; RestoreCursor()
	settimer,ini_write,-1	; settimer,reg_write,-1 ;not yet imp ;
	ssleep(5)
	try,WinAnimate(hSpyWnd,"hide blend",350)
	ssleep,(20)	;
	exitapp,
}

CloseButtShowLITCHK( ) {
	global	;WinAnimate(hCloseButt2,"activate center",400)
	if(CloseButtShowLIT) {
		WinAnimate(hCloseButt2,"hide center",600)
		CloseButtShowLIT:= false
	}
}

CloseButtShowLITenable:
if(!CloseButtShowLIT) {
	WinAnimate(hCloseButt2,"activate center",300)
	CloseButtShowLIT:= true
} return,

olord:
if(Moving) {
	Moving()
	if(!(LbD:=GetKeyState("~lbutton","P"))||!Moving) {
		;Moving:= false
		return,
	} return,
} else,settimer,olord,off
return,

olord3:
if(Moving) {
	Moving()
	if(!(LbD:=GetKeyState("~lbutton","P"))||!Moving) {
		;Moving:= false
		return,
	}
} else,settimer,olord3,off
return,

flash_asshole() {
	;global
	return,
}

OnWM_KEYDOWN(wParam, lParam, msg, hWnd) {
	global
	switch,hwnd {
		case,hSettingsDlg : switch,wParam {
			case,"38","40" : (wParam=18? TabHeightSlider++:TabHeightSlider--) ;tt("sdfsdfdsfdsfds")
				gui,settings:submit,nohide
		}
	} switch,wParam {
		case,112 : settimer,ShowHelp,-10
		case,113 : (hParent:= GetParent(g_hWnd))
					? (g_hWnd:= hParent, ShowWindowInfo())
		case,114 : settimer,ShowFindDlg,-10
		case,115 : settimer,ShowTree,-10
		case,116 : if(WinActive("ahk_id " hTreeWnd))
				return, ;gui,Spy:Submit,NoHide ;ShowWindowInfoIfExist(EdtHandle)
		case,117 : settimer,FlashWindow,-10
		case,118 : settimer,ShowXYWHDlg,-10
		case,119 : settimer,Cpy2Clip,-10
		case,120 : settimer,Screenshot,-10
		case,"38","40" : (wParam=38)? TabHeightSlider++:TabHeightSlider-- ;tt(TabHeightSlider)
			gui,settings:submit,nohide  
			}
 }
 
OnWM_RBUTTONDOWN(wParam,lParam,msg,hWnd) {  
 	switch,mcwnd {
		case,hprogicon : GuiiconMenu()
	} switch,hwnd {
		case,hLbxStyles,hLbxExStyles,hLbxExtraStyles:SendMessage,0x1A9,0,lParam,,ahk_id %hWnd% ; LB_ITEMFROMPOINT
			Index:= ErrorLevel
			SendMessage,0x18A,% Index,0,,ahk_id %hWnd% ; LB_GETTEXTLEN
			Len:= ErrorLevel
			VarSetCapacity(LB_Text,Len << !!A_IsUnicode,0)
			SendMessage,0x189,% Index,% &LB_Text,,ahk_id %hWnd% ; LB_GETTEXT
			Const:= StrSplit(StrGet(&LB_Text,Len),"`t")[1]
			, Desc:= StrReplace(oStyles[Const].Desc,"\n","`n")
			guicontrol,,GrpDesc,% Const
			guicontrol,,TxtDesc,% Desc
		;case,"": ;case,"":
	} if(hWnd==hLbxStyles||hWnd==hLbxExStyles||hWnd==hLbxExtraStyles)
		return,
	moving2:= true
	send,{blind}{LButton down}
	PostMessage,0xA1,2,,,ahk_id %hspywnd% ; WM_NCLBUTTONDOWN
}

OnWM_RBUTTUP(wParam,lParam,msg,hWnd) {
	;moving2:=false 
	;send {blind} {lbutton up }
	;PostMessage,0xA2,2,,,ahk_id %hspywnd% ; WM_NCLBUTTONDOWN
}

~rbutton:: return,
~rbutton up:: moving:= moving2:= false

~#g::
if(bbounce:=!bbounce)
	settimer,bb,1
else {
	settimer,bb,off
	sleep,100
	SendMessage,0x448,-1,0,,ahk_id %htb%
} return,

bb:
buttbounce(htb,17,250)
return,

ButtBounce(tbHandle="",butts="",hilt_ms=199) {
	global
	loop,1 {
		loop,% butts {
			(!bbounce?return())
			SendMessage,0x448,a_index-1,0,,ahk_id %tbHandle% ;TB_SETIMAGELIST:=0x430 ;TB_ADDBUTTONSA:= 0x414 TB_SETHOTITEM-0x448
			sleep,% hilt_ms
		} loop,% butts {
			(!bbounce?return())
			SendMessage,0x448,butts-a_index,0,,ahk_id %tbHandle% ;TB_SETIMAGELIST:=0x430 ;TB_ADDBUTTONSA:= 0x414
			sleep,% hilt_ms
		}
	}
}

GuiiconMenu() {
	global
	try,menu,new,deleteall
	; menu,new,add,Topmost,MenHandla
	; menu,new,icon,Topmost,% opt_topmost? "C:\Icon\48\pin_48.ico" : "C:\Icon\48\move_48.ico",,48
	; menu,NewSubMen_Pin,add,Pin to other window,MenHandla
	; menu,NewSubMen_Pin,add,Pin to desktop,MenHandla
	; menu,NewSubMen_Pin,add,Pin to desktop Perm,MenHandla
	; menu,new,add,Open containing,MenHandla
	; menu,new,icon,Open containing,% "C:\Icon\48\EXPLORER_48.ico",,48
	; menu,new,add,Copy path,MenHandla
	; menu,new,icon,Copy path,% "C:\Icon\48\copy248.ico",,48
	; menu,new,add,% _:= "Cut " . quote(Image_Title . "." . x10n),MenHandla
	; menu,new,icon,% _,% "C:\Icon\48\ss_48.ico",,48
	; menu,new,add,Delete ,MenHandla
	; menu,new,icon,Delete,% "C:\Icon\ICON54_1.ico",,48
	; menu,new,add,Move,MenHandla
	; menu,new,icon,Move,% "C:\Icon\48\move_48.ico",,48
	; menu,new,add,Pin,:NewSubMen_Pin
	; menu,new,add,Pin,MenHandla
	; menu,new,icon,Pin,% "C:\Icon\48\pin_48.ico",,48
	; menu,new,add,Exit,MenHandla
	; menu,new,icon,Exit,C:\Icon\48\xray_(total-recall)_48 (2).ico,,48
	Menu,new,add,Assign new icon for %ProcTxT%,iconassign
	Menu,new,icon,Assign new icon for %ProcTxT%,% "C:\Icon\48\move_48.ico"
	Menu,new,Show
}

IconAssign:
FileSelectFile,iconpath_New,S8,% "C:\Icon\256",% "Select icon file",*.ico
guicontrol,,ProgIcon,%	"HICON: " . LoadPicture(icon_arr[ProcTxT]:=iconpath_New,"w64 Icon" . 0,ErrorLevel)
msgbox,% "save system-wide?"
return,

WM_LBD(wParam="",lParam="",unknown="",hwnd="")  {
	global ;global lbutton_cooldown, lbd, gpos, TrigG:= false
	static initted:= RECT := false, bum , g2 ;(!initted)? (RECT:= VarSetCapacity(RECT,16)
	mousegetpos,mxs,mys,hwn,cnm ;tooltip %   ("bbdbneeeee")
	moving2:= false
	g2:= wingetpos(hSpyWnd), xs:=mxs-g2.x, ys:=mys-g2.y
	if(instr(cnm,"SysHeader32")||instr(cnm,"syslist")||instr(cnm,"systab")) ;tt("dont move for this class")
		return,
	switch,hwn {
		case,hTreeWnd:return,
	} switch,hwnd {
		case,SbarhWnd: if(xs<55) {
				gui,Spy:Submit,NoHide
				ss:= wingetpos(SbarhWnd)
				tooltip,% "Refreshing...",ss.x-100,ss.y-35.1
				SendMessage,0x40F,0,% img["ico_Eye48"],,ahk_id %SbarhWnd%
				settimer,sbiconreset,-480
				settimer,ttoff,-1480
				ShowWindowInfoIfExist(EdtHandle)
				return,
			} tt(ys " " xs "`nSbar")
		case,hFinda1,htb1: return,
		case,htabhslider: winactivate , ahk_id %hSettingsDlg%
			try,GuiControl,Focus,tabhslider
			return,tt("slider not functionally available (gui-bug)")
		default: GPos:= wingetpos(hspywnd), Moving:= True, Then:= a_tickcount ; case,hSpyWnd,hStylesTab,htab: rECT:= false
			try,GuiControl,Focus,SysListView321
			ssleep(1) ;coordMode,Pixel,Screen ;coordMode,mouse,Screen
			mousegetpos,xmove,ymove
			xmove_offset:=xmove-GPos.x, ymove_offset:=ymove-GPos.y
			, Moving:=true, movestart:=a_tickcount
			, ssleep( 1 ), ;Moving()
			PostMessage,0xA1,2,,,ahk_id %hspywnd% ; WM_NCLBUTTONDOWN
			return,
	}
}

OnWM_LBUTTONUP(wParam="",lParam="",msg="",hWnd="") {
	global Moving, movestart
	static SPI_SetCurSORS=0x57
	ymove:= ymove_offset:= xmove:= xmove_offset:= ""
	DllCall("SystemParametersInfo","uint",0x57,"uint",0,"ptr",0,"uint",0)
	if(dragging) {
		Loop,4
			try,gui,% A_Index +90 ":hide"
		settimer,destroyBorders,-10
			winget,fp,processpath,ahk_id %g_hWnd%
		(instr(fp,"program files")? fp:= strreplace(fp,"program files","Prgfiles"))
		(instr(fp,"windows\system")? fp:= strreplace(fp,"windows\system","sys"))
		SB_SetText(format("0x{:X}",g_hWnd),2), SB_SetText(fp,1)
		if(IsWindowVisible(hTreeWnd))
			GoSub,LoadTree
		if(IsWindowVisible(hXYWH))
			GoSub,SetXYWH
	} else,if(!dragging) {
		Loop,4
			try,gui,% A_Index +90 ":hide"
	} else,if(Moving) {
		Moving:= false
		wm_moveend()
	} if(hWnd=hSpyWnd&&a_tickcount-movestart>300) {
		try,GuiControl,Focus,SysListView321
		return,
	} else,return
}

OnWM_MOUSEMOVE(wParam,lParam,msg,hWnd2) {
	global hOldWnd, g_hWnd,hOldCursor,SbarhWnd,img, CurChanged
	, CloseButtShowLIT,hWndmm, Dragging, yres, xres
	, hBtn1, hBtn2, hBtn3, ht1b4, ht1b1, hSpyWnd
	, xmove, xmove_offset, ymove, ymove_offset
	static init:=0,xss,yss,hOldCursor2,_327701
	if(!_327701) {
		controlget,_327701,hwnd,,#327701,ahk_id %hSpyWnd%
	} (init=7? init:=0:())
	if(init=0) {
		init:= 1, pp:=wingetpos(hSpyWnd)
		MouseGetPos,xas,yas,hWin,hCtl,2
		xres:=xas-pp.x, yres:=yas-pp.y
	} yss:= hiword(lParam), xss:= loword(lParam)
	MouseGetPos,x,y,hWin,hCtl,2
	hWndmm:= format("0x{:x}",hWnd2)
	if(Dragging) {
		loop,1 {
			if(!getkeystate("LButton","P")) { ;mbox always prox
				OnWM_LBUTTONUP()
				return, ;else msgbox % ("1")
			} g_hWnd:= (hCtl=="")? hWin:hCtl
			if(g_MouseCoordMode !="Screen") {
				SendMessage,0x84,0,% y<<16|x,,ahk_id %hWndmm% ;WM_NCHITTEST
				(((HitTest:= ErrorLevel)==1||hCtl !="")? (g_MouseCoordMode=="Client"
				? GetClientCoords(g_hWnd,x,y) : (g_MouseCoordMode=="Window"
				? GetWindowCoords(g_hWnd,x,y)))) ; 1=HTCLIENT
			} guicontrol,Spy:,EdtCursor,%x%,%y%
			(g_DetectHiddn? g_hWnd:= ControlFromPoint(x,y,g_hWnd))
			if(!IsBorder(g_hWnd)){
				if(!(g_hWnd=hOldWnd)) {
					ShowBorder(g_hWnd,-1) ;if(IsChild(g_hWnd)) { ; MouseGetPos,,,,ClassNN ; LoadControlInfo(ClassNN)
				} else,ShowBorder(g_hWnd,2000)
				LoadWindowInfo()
				settimer,UpdateTitleBar,-1
			}
		} hOldWnd:= g_hWnd
	} else,if Moving {
	sleep,20
	;	((!SubWin_VisibleCount||SubWin_VisibleCount="arse")? EnterSizeMove():(SubWin_VisibleCount>1)? wm_move())
	;	Moving()
		if(!Moving||!getkeystate("lbutton")&&!getkeystate("rbutton")) {
			wm_moveend() ;tt("wm_moveend")
			Moving:=false, ymove:= ymove_offset:= xmove:= xmove_offset:= ""
		} ;if(init=7) {
	;		init:= 0
	;		return,
	;	} else,{
	;		settimer,olord3,10
	;		gosub,olord
	;	}
	} else {
		init:=0
		switch,hWnd2 {
			case,hCloseButt1,hCloseButt2 : ;gcursor("\doomdie.ani")
				settimer,CloseButtShowLITenable,-1
			case,hBtn1 : gcursor("\hand.CUR")
				SendMessage,0x0411,0,"Search *.*  wingui",,ahk_id %hWndhBtn1% ;msctls_statusbar321 ;0x0410 SB_SETTIPTEXTA / 0x0411 SB_SETTIPTEXTW;
			case,hBtn2 : GCURSOR("\hand.CUR")
				SendMessage,0x0411,0,"Search *.*  wingui",,ahk_id %hWndhBtn2%  sys tree view (*.*)
			case,hBtn3 : gcursor("\hand.CUR")
			case,hBtn4 : gcursor("\INJEX.ANI")
			case,hBtn5 : gcursor("\INJEX.ANI")
			case,hBtnCmds : gcursor("\INJEX.ANI")
			case,hFinda1 : gcursor("\INJEX.ANI")
			case,fukbk,hfukbk2,hfkuu2,hprogicon : gcursor("\INJEX.ANI")
			msgbox
			case,SbarhWnd : gcursor("\hand.CUR") ;0x0410=SB_SETTIPTEXTA / 0x0411=SB_SETTIPTEXTW;
				if(xs<55) ;msctls_statusbar321;;
					SendMessage,0x0411, 0, "refresh the view with the eye...",,ahk_id %SbarhWnd%
			case,htab : gcursor("\hand256.ANI")
			case,hRemParentButton1 : gcursor("\flicker.ANI")
			case,hbuttendprocess : gcursor("\doomdie.ani")
			case,hopenfolder : gcursor("\hand.CUR")
			case,hbuttsendmsg : gcursor("\flicker.ANI")
			case,hbuttpostmsg : gcursor("\flicker.ANI")
			case,happlystyle : gcursor("\hand.CUR")
			case,hresetstyle : gcursor("\flicker.ANI")
			case,hRemParentButton1:gcursor("\flicker.ANI")
			case,hRemParentButton2:gcursor("\flicker.ANI")
			case,htb1:gcursor("\hand.CUR")
			case,hStylesTab : gcursor("\hand256.ANI")
			case,ht1b1 : gcursor("\hand.CUR")
			case,ht1b4 : gcursor("\hand.CUR")
			case,dHWCheck,tOPMCheck : gcursor("\hand.CUR")
			case,hFinda1 : gcursor("\INJEX.ANI")
			case,hLbxStyles : gcursor("\hand.CUR")
			case,hLbxExStyles : gcursor("\hand.CUR")
			case,hLbxExtraStyles : gcursor("\hand.CUR")
			case,hSpyWnd : settimer,curcheck_general,-1
			case,htabhslider : winset,style,+0x80000000,ahk_id %hSettingsDlg%
				winset,style,-0x40000000,ahk_id %hSettingsDlg%
				,curcheck_general,-1
			case,hSettingsDlg : winset,style,-0x80000000,ahk_id %hSettingsDlg%
				winset,style,+0x40000000,ahk_id %hSettingsDlg%
		} switch,hCtl {
			case,_327701 : settimer,curcheck_general,-1
			case,fukbk,hfukbk2,hfkuu2,hprogicon: gcursor("\INJEX.ANI")
		}
	} return,
}

SecondaryMoving() {
	global ;tt("fsdf");loop,parse,% "hxywh",`, ;hScrollInfo,hFindDlg,hTreeWnd
	critical
	mousegetpos,xmove1,ymove1
	GPos:= wingetpos(hspywnd)
	, xres:= xmove1-GPos.x, yres:= ymove1-GPos.y ;,SubWin_VisibleCount:= 0 ;;winactivate,% "ahk_id " %a_loopField%;if !gpos;p:= GetWindowPlacement(hSpyWnd),Win_Move(g_findgui_isopen,xres,yres,"","","") ;if(IsWindowVisible(hScrollInfo)){;if(IsWindowVisible(hSettingsDlg))if(IsWindowVisible(hxywh)){;if(IsWindowVisible(hFindDlg)||g_findgui_isopen) if(IsWindowVisible(hTreeWnd)) {;	winset,top,,ahk_id %hxywh%;	winset,top,,ahk_id %hSettingsDlg%
	, Win_Move(hTreeWnd,GPos.x-507,GPos.y+2,"","","")
	, Win_Move(hxywh,GPos.x+GPos.w-8,GPos.y,"","","")
	, Win_Move(hSettingsDlg,GPos.x+GPos.w-8,GPos.y+208,"","","") ;, Win_Move(hScrollInfo,xres,yres,"","","")	;} ;if(SubWin_VisibleCount>1)
}

Moving() {
	global
	if(!Moving||!getkeystate("lbutton")){
		ymove:=ymove_offset:=xmove:=xmove_offset:=""
		Moving:=false, wm_moveend()
	} try,{
		mousegetpos,xmove1,ymove1
		if ((xmove>=0)&&(ymove>=0)){
			if(((xres:=xmove1-xmove_offset)>0)&&((yres:=ymove1-ymove_offset)>0)){
				Win_Move(hspywnd,xres,yres,"","","")
				try,GuiControl,Focus,SysListView321
				SecondaryMoving()
}	}	}	}

gCursor(cursor="\link.cur") {
	global ChangeToIcon
	if(CurChanged!=1){
		settimer,CurChanged1,-10 ; case hSpyWnd: if(CurChanged=1) { ; }
		return,ChangeToIcon:= cursor
	}
}

PointerLeave(wParam="",lParam="",msg="",hWnd="") {
	global CurChanged,hSpyWnd,xres,yres,Moving
	settimer,curcheck_general,-100
;	if(Moving) {
	;	if(!(getkeystate("~LButton","P")))			;OnWM_LBUTTONUP()
	;		settimer,oLord,15	;CurChanged? (RestoreCursor(), CurChanged:= false)
;	} 
if(Dragging) { ;msgbox % (Dragging )
			loop,1 {
				if(!(getkeystate("~LButton","P")))
					return
					;OnWM_LBUTTONUP()
}		}	}

OnWM_NCMOUSEMOVE(wParam,lParam,msg,hWnd2) {
	global CurChanged,hSpyWnd,xres,yres,Moving
	settimer,curcheck_general,-100
;	if(Moving) ;msgbox % xres " " yres
		;settimer,olord,10 	;CurChanged? (RestoreCursor(), CurChanged:= false)
}

Curcheck_General() { ;thread priority, -1
	global CurChanged, CloseButtShowLIT
	CurChanged? (RestoreCursor(), CurChanged:= false):()
	CloseButtShowLIT? CloseButtShowLITCHK() : ()
}

TTOff:
tooltip,
return,

Reg_Read:
RegRead,Sep,HKEY_CURRENT_USER\Control Panel\International,sThousand
 ((Sep="")? Sep:= ".")
r3gk3y:="HKCU\SOFTWARE\_MW\WinP5y"
return,
loop,parse,% "varnames-opt_,MaxFill,alignment,,,,",`,
	regread,  OPT_%a_loopfield%,% r3gk3y, %a_loopfield%
loop,parse,% "netx,nety,varnames,,",`,
	regread,%a_loopfield%,% r3gk3y, %a_loopfield%
return,

Reg_Write:
loop,parse,% Options:= "ShrinkFill,MaxFill,recurse,topmost,preserveoffsets,brightness",`,
	regwrite,% "REG_SZ",% r3gk3y,%a_loopfield%,% OPT_%a_loopfield%
loop,parse,% other:= "netx,nety",`,
	regwrite,% "REG_SZ",% r3gk3y,%a_loopfield%,% %a_loopfield%
return,

Varz:
global AppName, alien, r_PID, sep, spyy, CurChanged:=0, TreeIcons:= ResDir . "\TreeIcons.icl", classText
, hTreeWnd:=0, htab, hLbx, hLbxExStyles, hLbxExtraStyles, hLbxStyles, SbarhWnd, hBtnCmds, gpos, hfkuu2
, ProcTxT ,fukbk ,hfukbk2, lasttrig, hBtn1, hBtn2, hBtn3, hBtn4, hBtn5, ht1b4, ht1b1, hClientCoords, hWindowCoords, hScreenCoords
, dHWCheck, tOPMCheck, spyy, xres, yres, r3gk3y, sep, ImageList, args, _msg, TrigG, TrayActiv, parent, ChangeToIcon, OldTimeReset
, hSpyWnd,  hCommandsMenu, hTab, htb, htb2, htb1, p1pwnd, p2pwnd, hCloseButt1, hCloseButt2, StyleTabCurrent,Transcol, Transval, g_dwmcomposition
, trigger, Moving, moving2, StyleTabisInit, hRemParentButton2, hRemParentButton1, hresetstyle, happlystyle, htabhslider, TabHeightSlider, hIL4
, hbuttpostmsg, hbuttsendmsg, hopenfolder,hbuttendprocess,hRemParentButton1, hCbxMsg, hStylesTab, hxywh, hSettingsDlg, hdwmchk
, hWindowsTab, hFinda1, hFindDlg, hScrollInfo, hprogicon, CloseButtShowLIT, hBorderColorPrev, hWndmm, hWndnn, htabbody
, g_ExtraStyle, g_Minimized, g_Minimize, g_Topmost, g_DetectHiddn, g_hWnd, g_Style, g_ExStyle, ahkchildrentruefalse
, g_MouseCoordMode:= "Screen", SubWin_VisibleCount, xmove, xmove_offset, ymove, ymovemove_offset, bbounce
global g_WinMsgs:= "", SYSGUI_TBbUTTSZ1:= 64, SYSGUI_TBbUTTSZ2:= 24, _s:= " ", pxx, pyy, xxx:= 1
, g_Borders:= [], oStyles:= {}, Cursors:= {}, hOldCursor, hOldCursor2, hOldWnd, OldParents:= [], styletabold:= 12, inde_x:= 0
, Dragging:= False
, Workaround:= True
, FindDlgExist:= False
, g_TreeShowAll:= False
, MenuViewerExist:= False, g_findgui_isopen, CloseButtShowLIT
, Img:=[]
  img["cur_link"]:= DllCall("LoadImage","Int",0,"Str",ResDir "\Link.cur","Int",2,"Int",56,"Int",56,"UInt",0x10,"Ptr")
, img["Banner1"]:= ({"Path" : path:= ResDir "\PsyCho515-nq8.png","xoff" : 65,  "yoff" : 3})
, img["Banner2"]:= ({"Path" : path:= ResDir "\PsyCho618-nq8.png","Xoff" : 65, "Yoff" : 3})
, img["Banner3"]:= ({"Path" : path:= ResDir "\o\p5yb4n (17).png", "Xoff" : 65, "Yoff" : 3}) ;multi
, img["Banner4"]:= ({"Path" : path:= ResDir "\o\p5yb4n (37).png","Xoff" : 65, "Yoff" : 3}) ;pink
, img["Banner5"]:= ({"Path" : path:= ResDir "\o\Clipboarder.2023.03.30-013.png","Xoff" : 65, "Yoff" : 3})
, img["notepad++.exe"]	:= ico2hicon("C:\Icon\64ribbon\notepad_64_32.ico") ;notepad++.exe
, img["ico_EyeOpn48"]:=ico2hicon("C:\Script\AHK\- Script\WinSpy\Resources\eyeopen48.ico")
  img["ani_syringe"]:= DllCall("LoadImage","Int",0,"Str", ResDir "\INJEX2.ANI", "Int",2,"Int",56,"Int",56,"UInt",0x10,"Ptr")
, img["CloseButt1"]	:= ResDir "\CloseButt1-nq8.png"
, img["CloseButt2"]	:= ResDir "\CloseButt2-nq8.png"
, img["CloseButt3"]	:= ResDir "\closebuttcross.png"
, img["SndVol.exe"]	:= ico2hicon("C:\Icon\64ribbon\sndvol_64_48_32.ico") ;steamwebhelper.exe
, img["ico_Eye48"]	:= ico2hicon("C:\Script\AHK\- Script\WinSpy\Resources\iiiclo48.ico")
, img["program"]	:= ico2hicon("C:\Icon\256\keetk.ico")
, img["ico_ahk"]	:= ico2hicon("C:\Icon\256\Autism5.ico")
, img["finda1"]:= DllCall("LoadImage","Int",0,"Str",ResDir "\INJEX.ANI","Int",2,"Int",64,"Int",64,"UInt",0x10,"Ptr")
, img["steam"]	:= ico2hicon("C:\Icon\64ribbon\st33m64_32 (2).ico") ;steamwebhelper.exe
, icon_arr:= []
Loop,Reg,% "HKCU\Software\_MW\Icons\pn",KV
{
	keyN_:= A_LoopRegName,
	regRead, v_
	icon_arr[keyN_]:= v_ ;msgbox % icon_arr["discord.exe"]
} loop,10
	global (t1t%a_index%)
return,

ShowHelp:
gui,Spy:+OwnDialogs
MsgBox,0x40,%AppName% Keyboard Shortcuts,
(
F2:  Go to the parent window
F3:  Show the Find dialog
F4:  Show the hierarchical window tree
F5:  Reload window information
F6:  Highlight window location
F7:  Position and Size dialog
F8:  Copy information to the clipboard
F9:  Copy screenshot to the clipboard
) return,

; col() {	; global
	; static go:= !false
	; winactive(hSpyWnd)? go:= true : go:= false
	; (go? (col:=181535,col2:="c220040", col3:="c99aafe")
	;:(col:= 050513, col2:= "c200570", col3:="c6688aff"))
	;;Gui,spy:Color,%col%
	;;Gui,spy:Font,%col2% ;guicontrol,Font,text1 ;guicontrol,Font,text2
	; tt("col"); }