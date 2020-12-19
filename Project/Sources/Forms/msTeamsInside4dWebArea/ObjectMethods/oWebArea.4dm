// OM: "msTeamsInside4dWebArea".oWebArea

C_TEXT:C284($resultTxt)
C_OBJECT:C1216($obj)

Case of 
	: (Form event code:C388=On End URL Loading:K2:47)
		If (Shift down:C543)
			TRACE:C157
		End if 
		Form:C1466.currUrl:=WA Get current URL:C1025(*; "oWebArea")
		Form:C1466.currPageTitle:=WA Get page title:C1036(*; "oWebArea")
		
		Form:C1466.colPageContents:=New collection:C1472
		
		Case of 
			: (Form:C1466.currUrl="https://login.microsoftonline.com/common/oauth2/authorize?response_type=id_token&client_id=@")
				
				$resultTxt:=WA Evaluate JavaScript:C1029(*; "oWebArea"; "document.querySelectorAll('#tilesHolder > div.tile-container > div > div > div > div.table-cell.text-left.content > div')[0].textContent.trim()"; Is text:K8:3)
				$obj:=New object:C1471
				$obj.typ:="tilesHolder"
				$obj.content:=Replace string:C233(Replace string:C233(Replace string:C233(Replace string:C233($resultTxt; "\r\n"; " "); "\r"; " "); "\n"; " "); "\t"; " ")
				Form:C1466.colPageContents.push($obj)
				
				$resultTxt:=WA Evaluate JavaScript:C1029(*; "oWebArea"; "document.querySelectorAll('#otherTile > div > div.table-cell.text-left.content')[0].textContent.trim()"; Is text:K8:3)
				$obj:=New object:C1471
				$obj.typ:="otherTile"
				$obj.content:=Replace string:C233(Replace string:C233(Replace string:C233(Replace string:C233($resultTxt; "\r\n"; " "); "\r"; " "); "\n"; " "); "\t"; " ")
				Form:C1466.colPageContents.push($obj)
				
				
			: (Form:C1466.currUrl="https://login.live.com/oauth20_authorize.srf?response_type=code&client_id=@")
				
				$resultTxt:=WA Evaluate JavaScript:C1029(*; "oWebArea"; "document.querySelectorAll('#displayName.identity[title]')[0].title"; Is text:K8:3)
				$obj:=New object:C1471
				$obj.typ:="identity"
				$obj.content:=Replace string:C233(Replace string:C233(Replace string:C233(Replace string:C233($resultTxt; "\r\n"; " "); "\r"; " "); "\n"; " "); "\t"; " ")
				Form:C1466.colPageContents.push($obj)
				
				$resultTxt:=WA Evaluate JavaScript:C1029(*; "oWebArea"; "document.querySelectorAll('input[type=\"password\"][name=\"passwd\"][id]')[0].ariaLabel"; Is text:K8:3)
				$obj:=New object:C1471
				$obj.typ:="password"
				$obj.content:=Replace string:C233(Replace string:C233(Replace string:C233(Replace string:C233($resultTxt; "\r\n"; " "); "\r"; " "); "\n"; " "); "\t"; " ")
				Form:C1466.colPageContents.push($obj)
				
			Else 
				IDLE:C311
				If (False:C215)
					TRACE:C157
				End if 
				
		End case 
		
End case 

// - EOF -