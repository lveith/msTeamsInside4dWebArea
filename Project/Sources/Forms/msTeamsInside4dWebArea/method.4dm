// OM: "msTeamsInside4dWebArea".oWebArea

Case of 
	: (Form event code:C388=On Load:K2:1)
		WA SET PREFERENCE:C1041(*; "oWebArea"; WA enable contextual menu:K62:6; True:C214)
		WA SET PREFERENCE:C1041(*; "oWebArea"; WA enable JavaScript:K62:4; True:C214)
		WA SET PREFERENCE:C1041(*; "oWebArea"; WA enable plugins:K62:5; True:C214)
		WA SET PREFERENCE:C1041(*; "oWebArea"; WA enable Web inspector:K62:7; True:C214)
		WA SET PREFERENCE:C1041(*; "oWebArea"; WA enable URL drop:K62:8; False:C215)
		WA SET PREFERENCE:C1041(*; "oWebArea"; WA enable Java applets:K62:3; False:C215)
		WA OPEN URL:C1020(*; "oWebArea"; "about:blank")  // prevent from adopting previous wa-session as start-default
		WA OPEN URL:C1020(*; "oWebArea"; "https://teams.microsoft.com")
		
		Form:C1466.colPageContents:=New collection:C1472
		
	: (Form event code:C388=On Unload:K2:2)
		WA OPEN URL:C1020(*; "oWebArea"; "about:blank")  // prevent from adopting previous wa-session as start-default
		
End case 

// - EOF -