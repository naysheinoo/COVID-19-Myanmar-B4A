B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Activity
Version=8.8
@EndOfDesignText@
#Region  Activity Attributes 
	#FullScreen: False
	#IncludeTitle: True
#End Region

Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.
	Dim title As String
	Dim urls As String
	Dim isCleanCache As Boolean = False
End Sub

Sub Globals
	'These global variables will be redeclared each time the activity is created.
	'These variables can only be accessed from this module.
	Dim lblTitle As Label
	Dim wv As WebView
	Dim vv As WebViewExtras
	Dim dwc As DefaultWebViewClient
	Dim ad As AdView
End Sub

Sub Activity_Create(FirstTime As Boolean)
	'Do not forget to load the layout file created with the visual designer. For example:
	'Activity.LoadLayout("Layout1")
	
	Activity.Color = 0xfff8f8f9
	nsoCode.SetStatusBarColor(0xff1a223a)
	
	lblTitle.Initialize("")
	lblTitle.Text = title
	lblTitle.Gravity = Gravity.CENTER_VERTICAL + Gravity.LEFT
	lblTitle.Typeface = Main.mm
	lblTitle.Color = 0xff1a223a
	lblTitle.TextColor = Colors.White
	lblTitle.Padding = Array As Int ( 20dip, 0, 0, 0)
	Activity.AddView ( lblTitle, 0, 0, 100%x, 50dip )
	

	wv.Initialize("wv")
	Activity.AddView( wv, 0, 50dip, 100%x , 100%y - ( nsoCode.adHeight + 50dip ))
	
	dwc.Initialize("dwc")
	
	vv.Initialize(wv)
	vv.SetWebViewClient(dwc)
	
	Dim setting As WebSettings = vv.GetSettings
	If isCleanCache = True Then
		setting.SetCacheMode(setting.LOAD_NO_CACHE)
	End If
	
	
	
	vv.LoadUrl(urls)
	vv.ZoomEnabled= False
	ProgressDialogShow("Getting data...")
	


	
	ad.Initialize2("ad", "your-admob-id", ad.SIZE_SMART_BANNER) 
	ad.LoadAd
	Activity.AddView( ad, 0 , 100%y - nsoCode.adHeight ,100%x, nsoCode.adHeight)
	
End Sub

Sub dwc_PageFinished(Url As String)
	ProgressDialogHide
End Sub

Sub dwc_ReceivedError(ErrorCode As Int, Description As String, FailingUrl As String)
	vv.LoadHtml("<p>Error occured !<br><small>Please check your internet connection and try again.</small><br><br><code>#covid19mm</code></p>")
End Sub


Sub Activity_Resume

End Sub

Sub Activity_Pause (UserClosed As Boolean)
	
End Sub
