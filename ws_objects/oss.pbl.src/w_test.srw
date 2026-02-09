$PBExportHeader$w_test.srw
forward
global type w_test from window
end type
type cb_1 from commandbutton within w_test
end type
end forward

global type w_test from window
integer width = 3378
integer height = 1484
boolean titlebar = true
string title = "Export Release Records to Excel"
string menuname = "m_home"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
end type
global w_test w_test

on w_test.create
if this.MenuName = "m_home" then this.MenuID = create m_home
this.cb_1=create cb_1
this.Control[]={this.cb_1}
end on

on w_test.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.cb_1)
end on

type cb_1 from commandbutton within w_test
integer x = 535
integer y = 376
integer width = 457
integer height = 132
integer taborder = 10
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "none"
end type

event clicked;//声明一个String variable
String ls_data 
//给ls_data赋值
ls_data = w_history.dw_detail.Object.requestdate.Attributes
//显示信息窗口
Messagebox("1",ls_data)
end event

