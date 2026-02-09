$PBExportHeader$w_login.srw
forward
global type w_login from window
end type
type cb_1 from commandbutton within w_login
end type
type cb_cancel from commandbutton within w_login
end type
type cb_ok from commandbutton within w_login
end type
type sle_pwd from singlelineedit within w_login
end type
type sle_user from singlelineedit within w_login
end type
type st_pwd from statictext within w_login
end type
type st_user from statictext within w_login
end type
type st_title from statictext within w_login
end type
end forward

global type w_login from window
integer width = 1787
integer height = 812
boolean titlebar = true
string title = "PB Offline License Release Records"
boolean controlmenu = true
boolean resizable = true
long backcolor = 67108864
string icon = "DataWindowIcon1!"
boolean center = true
cb_1 cb_1
cb_cancel cb_cancel
cb_ok cb_ok
sle_pwd sle_pwd
sle_user sle_user
st_pwd st_pwd
st_user st_user
st_title st_title
end type
global w_login w_login

type variables
string usera = "Aubrey"
string passworda = "Appeon1"

string userb = "Tom"
string passwordb = "Appeon"
end variables

on w_login.create
this.cb_1=create cb_1
this.cb_cancel=create cb_cancel
this.cb_ok=create cb_ok
this.sle_pwd=create sle_pwd
this.sle_user=create sle_user
this.st_pwd=create st_pwd
this.st_user=create st_user
this.st_title=create st_title
this.Control[]={this.cb_1,&
this.cb_cancel,&
this.cb_ok,&
this.sle_pwd,&
this.sle_user,&
this.st_pwd,&
this.st_user,&
this.st_title}
end on

on w_login.destroy
destroy(this.cb_1)
destroy(this.cb_cancel)
destroy(this.cb_ok)
destroy(this.sle_pwd)
destroy(this.sle_user)
destroy(this.st_pwd)
destroy(this.st_user)
destroy(this.st_title)
end on

type cb_1 from commandbutton within w_login
integer x = 663
integer y = 512
integer width = 457
integer height = 132
integer taborder = 50
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "testforgit"
end type

event clicked;open(w_emptywindow)
end event

type cb_cancel from commandbutton within w_login
integer x = 1102
integer y = 512
integer width = 352
integer height = 132
integer taborder = 40
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Cancel"
end type

event clicked;HALT
end event

type cb_ok from commandbutton within w_login
integer x = 302
integer y = 512
integer width = 352
integer height = 132
integer taborder = 30
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "OK"
boolean cancel = true
boolean default = true
end type

event clicked;//gnv_connect = CREATE n_oss_connectservice
//
//IF gnv_connect.of_ConnectDB ( ) = 0 THEN
//          open(w_history)
//		 close (w_login)
//END IF


If (sle_user.text=usera AND sle_pwd.text=passworda) OR (sle_user.text=userb AND sle_pwd.text=passwordb) then
	gnv_connect = CREATE n_oss_connectservice

	IF gnv_connect.of_ConnectDB ( ) = 0 THEN
	
		open(w_history)
		close(w_login)

		end if
		
	else
		messagebox("Error","Incorrect username or password!")
end if

	

end event

type sle_pwd from singlelineedit within w_login
integer x = 722
integer y = 352
integer width = 649
integer height = 92
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
boolean password = true
borderstyle borderstyle = stylelowered!
end type

type sle_user from singlelineedit within w_login
integer x = 722
integer y = 228
integer width = 649
integer height = 92
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
borderstyle borderstyle = stylelowered!
end type

type st_pwd from statictext within w_login
integer x = 325
integer y = 356
integer width = 402
integer height = 80
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Password"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_user from statictext within w_login
integer x = 325
integer y = 228
integer width = 402
integer height = 80
integer textsize = -11
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Username"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_title from statictext within w_login
integer x = 69
integer y = 52
integer width = 1637
integer height = 128
integer textsize = -13
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "PB Offline License Release Records"
alignment alignment = center!
boolean focusrectangle = false
boolean disabledlook = true
end type

