$PBExportHeader$oss.sra
$PBExportComments$Generated Application Object
forward
global type oss from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
n_oss_connectservice gnv_connect
end variables

global type oss from application
string appname = "oss"
string themepath = "C:\Program Files (x86)\Appeon\PowerBuilder 21.0\IDE\theme"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = false
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 5
long richtexteditx64type = 5
long richtexteditversion = 3
string richtexteditkey = ""
string appicon = "D:\SVN\support\Workspace\Aubrey\OneStopSupport\llic.ico"
string appruntimeversion = "25.0.0.3726"
boolean manualsession = false
boolean unsupportedapierror = true
boolean bignoreservercertificate = false
uint ignoreservercertificate = 0
integer highdpimode = 0
end type
global oss oss

on oss.create
appname="oss"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on oss.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;open(w_login)
end event

event close;if isvalid(gnv_connect) then
	gnv_connect.of_DisconnectDB ( )
end if
end event

