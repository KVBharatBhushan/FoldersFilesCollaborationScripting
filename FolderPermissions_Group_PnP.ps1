#Config Variables
$SiteURL = "https://client.sharepoint.com/sites/S022-013-IS/DemoMigration"
$ListName="Reports Archive"
$FolderServerRelativeURL = "/sites/S022-013-IS/DemoMigration/Reports Archive/Created Folder"
   
#Connect to PnP Online
Connect-PnPOnline -Url $SiteURL -UseWebLogin
  
#Grant folder permissions to SharePoint Group which should exist!
Set-PnPfolderPermission -List $ListName -identity $FolderServerRelativeURL -AddRole "Read" -Group "Demo Migration Members"

