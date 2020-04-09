B4A=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=9.01
@EndOfDesignText@
'Code module
'Subs in this code module will be accessible from all modules.
Sub Process_Globals
	'These global variables will be declared once when the application starts.
	'These variables can be accessed from all modules.
	Dim tot As List
End Sub

Sub adHeight As Int
	Dim admobheight As Int
	Dim screenHeightScale As Float
	screenHeightScale = GetDeviceLayoutValues.Height / GetDeviceLayoutValues.Scale
		
	If screenHeightScale <= 400 Then
		admobheight = 32dip
	Else If screenHeightScale > 400 And screenHeightScale <= 720 Then
		admobheight = 50dip
	Else If screenHeightScale > 720 Then
		admobheight = 90dip
	End If
	
	Return admobheight
End Sub

Sub SetStatusBarColor(clr As Int)
	Dim p As Phone
	If p.SdkVersion >= 21 Then
		Dim jo As JavaObject
		jo.InitializeContext
		Dim window As JavaObject = jo.RunMethodJO("getWindow", Null)
		window.RunMethod("addFlags", Array (0x80000000))
		window.RunMethod("clearFlags", Array (0x04000000))
		window.RunMethod("setStatusBarColor", Array(clr))
	End If
End Sub

Sub createTableAndInsertData ( str As String )
	
	DBUtils.DropTable(Main.sql, "data")
	
	Dim m As Map
	m.Initialize
	m.Put("id", DBUtils.DB_INTEGER)
	m.Put("country", DBUtils.DB_TEXT)
	m.Put("totalcases", DBUtils.DB_TEXT)
	m.Put("newcases", DBUtils.DB_TEXT)
	m.Put("totaldeaths", DBUtils.DB_TEXT)
	m.Put("newdeaths", DBUtils.DB_TEXT)
	m.Put("totalrecovered", DBUtils.DB_TEXT)
	m.Put("activecases", DBUtils.DB_TEXT)
	m.Put("seriouscritical", DBUtils.DB_TEXT)
	m.Put("cases1mpop", DBUtils.DB_TEXT)
	m.Put("deaths1mpop", DBUtils.DB_TEXT)
	DBUtils.CreateTable(Main.sql, "data", m, "id")
	
	' Parse from gbdata.json 	
	Dim parser As JSONParser
	parser.Initialize(str)
	Dim root As Map = parser.NextObject
	Dim data As List = root.Get("data")
	
	Dim listofmap As List
	listofmap.Initialize
	For Each coldata As List In data
		If coldata.Size <> 0 Then
		Dim m As Map
		m.Initialize
		Dim country As String = coldata.Get(0)
			If country.Contains ("Total") = False Then		
				If country <> "null" Then
					m.Put("country", country)
					m.Put("totalcases", removeString(coldata.Get(1)))
					m.Put("newcases", removeString(coldata.Get(2)))
					m.Put("totaldeaths", removeString(coldata.Get(3)))
					m.Put("newdeaths", removeString(coldata.Get(4)))
					m.Put("totalrecovered", removeString(coldata.Get(5)))
					m.Put("activecases", removeString(coldata.Get(6)))
					m.Put("seriouscritical", removeString(coldata.Get(7)))
					m.Put("cases1mpop", removeString(coldata.Get(8)))
					m.Put("deaths1mpop", removeString(coldata.Get(9)))
					listofmap.Add(m)
				End If
			
			Else
				Dim l As List
				l.Initialize
				l.Add(removeString(coldata.Get(2)))
				l.Add(removeString(coldata.Get(4)))
			End If
		End If
	Next
	
	DBUtils.InsertMaps(Main.sql, "data", listofmap )
'	CallSubDelayed2(Main, "addExtraItemToGB", l)
	tot.Initialize
	tot = l
	
End Sub

Sub removeString ( a As String ) As String
	a = Regex.Replace("[/\r?\n|\r/]",a ,"")
	a = a.Replace("+", "").Replace(",","")
	Return a
End Sub
	
	


