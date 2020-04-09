B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Activity
Version=9.01
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: False
#End Region

Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.

End Sub

Sub Globals
	'These global variables will be redeclared each time the activity is created.
	'These variables can only be accessed from this module.
	Dim cs As CSBuilder
	
End Sub

Sub Activity_Create(FirstTime As Boolean)
	'Do not forget to load the layout file created with the visual designer. For example:
	'Activity.LoadLayout("Layout1")
	Activity.Color =0xff1a223a
	cs.Initialize
	cs.Size(17).Color(Colors.White).Append("COVID-19").Pop.Pop.Size(12).Color(0xffff5570).Append( " Myanmar").PopAll
	Activity.Title  = cs
	
	Dim lbl As Label
	lbl.Initialize("lbl")
	lbl.Gravity = Gravity.CENTER
	Activity.AddView( lbl, 0, 0, -1, 100%y - 100dip)
	
	cs.Initialize
	cs.Size(40).Typeface(Typeface.DEFAULT_BOLD).Color(Colors.White).Append("COVID-19").Pop.Pop.Pop
	cs.Size(12).Color(0xffff5570).Append( CRLF & "Powered by JOY Mogok" ).Pop.Pop
	cs.Size(12).Color(Colors.White).BackgroundColor(Colors.DarkGray).Append(CRLF & CRLF & "  Version : 4.1  " & CRLF & CRLF & CRLF & CRLF ).Pop.Pop.Pop
	cs.Size(12).BackgroundColor(0xaa1ac679).Color(Colors.White).Append("  Developed by  " & CRLF ).Pop.Pop
	cs.Size(20).Color(0xff1ac679).Append("NAY SHEIN OO" & CRLF & CRLF).Pop.Pop
	cs.Size(12).BackgroundColor(0xaaff5570).Color(Colors.White).Append("  Developer's Email  " & CRLF ).Pop.Pop
	cs.Size(15).Color(0xffff5570).Append("naysheinoo.dev@gmail.com" & CRLF & CRLF ).Pop.Pop
	cs.Size(12).BackgroundColor(0xaa1ac679).Color(Colors.White).Append("  Developer's Facebook Profile  " & CRLF ).Pop.Pop
	cs.Size(15).Color(0xff1ac679).Append("www.facebook.com/mgkboy" & CRLF & CRLF & CRLF ).Pop.Pop
	cs.Size(11).Color(Colors.White).Typeface(Main.mm).Append("ယခု App တွင် နိုင်ငံတစ်ကာအချက်အလက်များကို" & CRLF & "Worldometers.info မှ ရယူထားခြင်းဖြစ်ပြီး၊" & CRLF & "မြန်မာနိုင်ငံအတွက်အချက်အလက်များကို" & CRLF & "Central Epidemiology Unit, Department of Public Health," & CRLF & "Ministry of Health and Sports, Myanmar Surveillance Dashboardမှရယူထားခြင်းဖြစ်ပါသည်။" & CRLF &  "အချက်အလက်များကို Developer မှ ပြုပြင်ထားခြင်းမရှိသည့်အပြင်" & CRLF &"App Developer နှင့် ယခုအချက်အလက်များသက်ဆိုင်မှုမရှိပါ။").PopAll
	
	
	
	lbl.Text = cs
	
	
End Sub

Sub lbl_Click
	cs.Initialize
	cs.Size(13).Append("Go to developer's facebook profile ?" & CRLF ).Pop
	cs.Size(12).Typeface(Main.mm).Append("Developer ရဲ့ Facebook Profile သို့သွားမည်လား ?").PopAll
	Dim result As Int = Msgbox2( cs, "", "Open", "Cancel", "", Null)
	If result = DialogResponse.POSITIVE Then
		openFacebook("fb://profile/100000928296672", "https://facebook.com/mgkboy")
	End If
End Sub

Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)

End Sub

Sub openFacebook ( id As String, url As String)
	Try
		Dim facebook As Intent
		facebook.Initialize(facebook.ACTION_VIEW, id)
		StartActivity(facebook)
	Catch
		Dim i As Intent
		i.Initialize(i.ACTION_VIEW, url)
		StartActivity(i)
		Log(LastException)
	End Try
End Sub

