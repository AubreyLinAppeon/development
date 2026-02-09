$PBExportHeader$w_history.srw
forward
global type w_history from window
end type
type st_1 from statictext within w_history
end type
type dw_exportdate from datawindow within w_history
end type
type cb_export from commandbutton within w_history
end type
type cb_delete from commandbutton within w_history
end type
type cb_save from commandbutton within w_history
end type
type cb_new from commandbutton within w_history
end type
type cb_search from commandbutton within w_history
end type
type sle_search from singlelineedit within w_history
end type
type dw_detail from datawindow within w_history
end type
type dw_history from datawindow within w_history
end type
end forward

global type w_history from window
integer width = 3378
integer height = 2176
boolean titlebar = true
string title = "PowerBuilder Offline License Release Records"
string menuname = "m_home"
boolean controlmenu = true
long backcolor = 67108864
string icon = "DataWindowIcon1!"
boolean clientedge = true
boolean center = true
event ue_retrieve ( )
event ue_insert ( )
event ue_update ( )
event ue_delete ( )
st_1 st_1
dw_exportdate dw_exportdate
cb_export cb_export
cb_delete cb_delete
cb_save cb_save
cb_new cb_new
cb_search cb_search
sle_search sle_search
dw_detail dw_detail
dw_history dw_history
end type
global w_history w_history

type variables
long ll_itemnum

String ls_search
String ls_filter_useremail
String ls_filter_company
Date ld_exportdate
Date ld_currentdate
long ll_months
long ll_years
long ll_monthbetween
end variables

event ue_retrieve();IF dw_history.Retrieve() <> -1 THEN
    dw_history.SetFocus()
    //dw_history.SetRowFocusIndicator(Hand!)
END IF
end event

event ue_insert();dw_detail.Reset()
dw_detail.InsertRow(0)
dw_detail.SetFocus()

end event

event ue_update();IF dw_detail.Update() = 1 THEN
 COMMIT using SQLCA;
 MessageBox("Save","Saved successfully!")
ELSE
 ROLLBACK using SQLCA;
END IF

end event

event ue_delete();dw_detail.DeleteRow(0)

end event

on w_history.create
if this.MenuName = "m_home" then this.MenuID = create m_home
this.st_1=create st_1
this.dw_exportdate=create dw_exportdate
this.cb_export=create cb_export
this.cb_delete=create cb_delete
this.cb_save=create cb_save
this.cb_new=create cb_new
this.cb_search=create cb_search
this.sle_search=create sle_search
this.dw_detail=create dw_detail
this.dw_history=create dw_history
this.Control[]={this.st_1,&
this.dw_exportdate,&
this.cb_export,&
this.cb_delete,&
this.cb_save,&
this.cb_new,&
this.cb_search,&
this.sle_search,&
this.dw_detail,&
this.dw_history}
end on

on w_history.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.st_1)
destroy(this.dw_exportdate)
destroy(this.cb_export)
destroy(this.cb_delete)
destroy(this.cb_save)
destroy(this.cb_new)
destroy(this.cb_search)
destroy(this.sle_search)
destroy(this.dw_detail)
destroy(this.dw_history)
end on

event open;dw_history.settransobject ( sqlca )
dw_detail.settransobject ( sqlca )
this.EVENT ue_retrieve()

//显示last export日期
dw_exportdate.settransobject ( sqlca )
if dw_exportdate.Retrieve() > 0 then
	ld_exportdate = dw_exportdate.GetItemDate(1, "exportdate", Primary!, true) //获取数据库exportdate列第一行
	//dw_exportdate.SetItem(1, "exportdate", ld_exportdate)//设置dw第一行的值
end if

ld_currentdate = Today()
ll_months = month(ld_currentdate) - month(ld_exportdate)
ll_years = year(ld_currentdate) - year(ld_exportdate)

IF ll_years > 0 THEN
	ll_monthbetween = 12 - month(ld_exportdate) + month(ld_currentdate)
ELSE 
	ll_monthbetween = ll_months
END IF

IF (ll_monthbetween > 3) or (ll_monthbetween = 3) THEN
	Messagebox("Note","You haven't backed up the PowerBuilder offline license release records in 3 months. Please make a backup.")
END IF
	


end event

type st_1 from statictext within w_history
integer x = 2450
integer y = 912
integer width = 366
integer height = 72
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 134217745
long backcolor = 67108864
string text = "Last export:"
boolean focusrectangle = false
end type

type dw_exportdate from datawindow within w_history
integer x = 2825
integer y = 912
integer width = 402
integer height = 72
integer taborder = 30
string title = "none"
string dataobject = "d_exportdate"
boolean border = false
boolean livescroll = true
end type

type cb_export from commandbutton within w_history
integer x = 2793
integer y = 48
integer width = 507
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Export as Excel"
end type

event clicked;

//获取当前日期并插入到数据表
ld_exportdate = Today()
dw_exportdate.SetItem(1, "exportdate", ld_exportdate)
dw_exportdate.Update()

dw_history.SaveAs("C:\Users\Public\Downloads\Release Records-"+string(ld_exportdate, "yyyymmdd")+".xls", Excel!, false)


string lsPath
lsPath = "C:\Users\Public\Downloads"

Run("explorer " + lsPath)

end event

type cb_delete from commandbutton within w_history
integer x = 2491
integer y = 48
integer width = 279
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Delete"
end type

event clicked;dw_history.DeleteRow(0)

IF dw_history.Update() = 1 THEN
 COMMIT using SQLCA;
 MessageBox("Save","Deleted successfully!")
ELSE
 ROLLBACK using SQLCA;
END IF


end event

type cb_save from commandbutton within w_history
integer x = 2190
integer y = 48
integer width = 279
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Save"
end type

event clicked;w_history.EVENT ue_update()
//w_history.EVENT ue_retrieve()
end event

type cb_new from commandbutton within w_history
integer x = 1893
integer y = 48
integer width = 279
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "New"
end type

event clicked;dw_detail.reset()    //先清空
dw_detail.InsertRow(0)//再插入空白行
//dw_detail.Object.requestdate.tex=(Today(), "mm/dd/yy")


end event

type cb_search from commandbutton within w_history
integer x = 1591
integer y = 48
integer width = 279
integer height = 112
integer taborder = 20
integer textsize = -10
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Search"
end type

event clicked;
ls_search = sle_search.text
ls_filter_useremail = ls_search
ls_filter_company = ls_search

w_history.EVENT ue_retrieve()

//dw_history.SetFilter("useremail LIKE '%"+ ls_filter_useremail +"%'")

IF ls_search = "" THEN
	dw_history.SetFilter("")
ELSE
dw_history.SetFilter("(useremail LIKE '%"+ ls_filter_useremail +"%') OR (#3 LIKE '%"+ ls_filter_company +"%')")
END IF

dw_history.SetRedraw(false)
dw_history.Filter()
dw_history.SetRedraw(true)



end event

type sle_search from singlelineedit within w_history
integer x = 101
integer y = 48
integer width = 1449
integer height = 112
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

type dw_detail from datawindow within w_history
integer x = 101
integer y = 992
integer width = 3200
integer height = 960
integer taborder = 20
string title = "none"
string dataobject = "d_details"
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_history from datawindow within w_history
integer x = 101
integer y = 200
integer width = 3200
integer height = 700
integer taborder = 10
string title = "License Management System"
string dataobject = "d_releasehistory"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;
IF currentrow>0 THEN   //如果dw_history里有数据有focus, retrieve这一行的具体数据
	ll_itemnum = this.object.data[currentrow, 1]
	IF dw_detail.Retrieve(ll_itemnum) =0 THEN  
	dw_detail.reset() 
	dw_detail.InsertRow(0)
	End IF
else                                //如果dw_history里数据被清空，同时清空dw_detail里的数据，保留表格
		dw_detail.reset()    //先清空
		dw_detail.InsertRow(0)//再插入空白行

END IF

end event

