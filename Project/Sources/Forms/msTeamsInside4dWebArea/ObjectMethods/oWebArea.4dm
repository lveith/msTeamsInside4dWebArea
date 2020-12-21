// OM: "msTeamsInside4dWebArea".oWebArea

C_TEXT:C284($resultTxt)
C_OBJECT:C1216($obj)
C_TEXT:C284($url;$description)
C_LONGINT:C283($errorCode)

Case of 
	: (Form event code:C388=On Begin URL Loading:K2:45)
		
	: (Form event code:C388=On End URL Loading:K2:47)
		If (Shift down:C543)
			TRACE:C157
		End if 
		Form:C1466.currUrl:=WA Get current URL:C1025(*;"oWebArea")
		Form:C1466.currPageTitle:=WA Get page title:C1036(*;"oWebArea")
		
		Form:C1466.colPageContents:=New collection:C1472
		
		Case of 
			: (Form:C1466.currUrl="https://login.microsoftonline.com/common/oauth2/authorize?response_type=id_token&client_id=@")
				$resultTxt:=WA Evaluate JavaScript:C1029(*;"oWebArea";"document.querySelectorAll('#tilesHolder > div.tile-container > div > div > div > div.table-cell.text-left.content > div')[0].textContent.trim()";Is text:K8:3)
				$obj:=New object:C1471
				$obj.typ:="tilesHolder"
				$obj.content:=Replace string:C233(Replace string:C233(Replace string:C233(Replace string:C233($resultTxt;"\r\n";" ");"\r";" ");"\n";" ");"\t";" ")
				Form:C1466.colPageContents.push($obj)
				
				$resultTxt:=WA Evaluate JavaScript:C1029(*;"oWebArea";"document.querySelectorAll('#otherTile > div > div.table-cell.text-left.content')[0].textContent.trim()";Is text:K8:3)
				$obj:=New object:C1471
				$obj.typ:="otherTile"
				$obj.content:=Replace string:C233(Replace string:C233(Replace string:C233(Replace string:C233($resultTxt;"\r\n";" ");"\r";" ");"\n";" ");"\t";" ")
				Form:C1466.colPageContents.push($obj)
				
			: (Form:C1466.currUrl="https://login.live.com/oauth20_authorize.srf?response_type=code&client_id=@")
				$resultTxt:=WA Evaluate JavaScript:C1029(*;"oWebArea";"document.querySelectorAll('#displayName.identity[title]')[0].title";Is text:K8:3)
				$obj:=New object:C1471
				$obj.typ:="identity"
				$obj.content:=Replace string:C233(Replace string:C233(Replace string:C233(Replace string:C233($resultTxt;"\r\n";" ");"\r";" ");"\n";" ");"\t";" ")
				Form:C1466.colPageContents.push($obj)
				
				$resultTxt:=WA Evaluate JavaScript:C1029(*;"oWebArea";"document.querySelectorAll('input[type=\"password\"][name=\"passwd\"][id]')[0].ariaLabel";Is text:K8:3)
				$obj:=New object:C1471
				$obj.typ:="password"
				$obj.content:=Replace string:C233(Replace string:C233(Replace string:C233(Replace string:C233($resultTxt;"\r\n";" ");"\r";" ");"\n";" ");"\t";" ")
				Form:C1466.colPageContents.push($obj)
				
			Else 
				IDLE:C311
				If (False:C215)
					TRACE:C157
				End if 
				
		End case 
		
	: (Form event code:C388=On Window Opening Denied:K2:51)  // A pop-up window has been blocked
		$resultTxt:=WA Get last filtered URL:C1035(*;"oWebArea")
		$obj:=New object:C1471
		$obj.typ:="popup window blocked"
		$obj.content:=$resultTxt
		Form:C1466.colPageContents.push($obj)
		
	: (Form event code:C388=On URL Resource Loading:K2:46)
		
	: (Form event code:C388=On URL Loading Error:K2:48)
		WA GET LAST URL ERROR:C1034(*;"oWebArea";$url;$description;$errorCode)
		$obj:=New object:C1471
		$obj.typ:="URL Loading Error #"+String:C10($errorCode)+" "+$description
		$obj.content:=$url
		Form:C1466.colPageContents.push($obj)
		
	: (Form event code:C388=On URL Filtering:K2:49)
		$resultTxt:=WA Get last filtered URL:C1035(*;"oWebArea")
		$obj:=New object:C1471
		$obj.typ:="URL Filtering"
		$obj.content:=$resultTxt
		Form:C1466.colPageContents.push($obj)
		
	: (Form event code:C388=On Open External Link:K2:50)  // An external URL has been opened in the browser
		$resultTxt:=WA Get last filtered URL:C1035(*;"oWebArea")
		$obj:=New object:C1471
		$obj.typ:="external URL opened in browser"
		$obj.content:=$resultTxt
		Form:C1466.colPageContents.push($obj)
		
End case 

// - EOF -