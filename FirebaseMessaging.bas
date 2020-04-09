B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=Service
Version=9.01
@EndOfDesignText@
#Region  Service Attributes 
	#StartAtBoot: False
	
#End Region

Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.
	Dim fm As FirebaseMessaging
End Sub

Sub Service_Create
 	fm.Initialize("fm")
End Sub

Public Sub SubscribeToTopics
	fm.SubscribeToTopic("covid")
End Sub

Sub Service_Start (StartingIntent As Intent)
	If StartingIntent.IsInitialized Then fm.HandleIntent(StartingIntent)
	Sleep(0)
	Service.StopAutomaticForeground 'Call this when the background task completes (if there is one)
End Sub

Sub Service_Destroy

End Sub

Sub fm_MessageArrived (Message As RemoteMessage)
	Log("Message arrived")
	Log($"Message data : "${Message.GetData}"$)
	Dim n As Notification
	n.Initialize
	n.Icon = "icon"
	n.AutoCancel =True
	n.Vibrate = True
	n.Light = True
	n.SetInfo(Message.GetData.Get("title"), Message.GetData.Get("body"), Main)
	
	n.Notify(1)
End Sub