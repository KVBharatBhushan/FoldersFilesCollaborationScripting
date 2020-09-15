#Config Variables
$SiteURL = "https://client.sharepoint.com/sites/S022-013-IS/DemoMigration"
$ListName="Reports Archive"
$FolderServerRelativeURL = "/sites/S022-013-IS/DemoMigration/Reports Archive/Created Folder"
  
#Connect to PnP Online
Connect-PnPOnline -Url $SiteURL -UseWebLogin
 
#Set folder permissions - Add User
Set-PnPfolderPermission -List $ListName -identity $FolderServerRelativeURL -User "krish.rade@client.com" -AddRole "Full Control"



