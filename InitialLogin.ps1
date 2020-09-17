#$O365ServiceAccount = "veera.kaveri@client.com"  

#$O365ServiceAccountPwd = "###################"

$SharePointSiteURL = "https://clienteur.sharepoint.com/sites/S022-013-IS/DemoMigration"  

Connect-PnPOnline -Url $SharePointSiteURL -UseWebLogin