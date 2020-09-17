#Config Variables
$SiteURL = "https://clienteur.sharepoint.com/sites/S022-013-IS/DemoMigration"
$ListName="Reports Archive"
$FolderServerRelativeURL = "/sites/S022-013-IS/DemoMigration/Reports Archive/Created Folder"
  
#Connect to PnP Online
Connect-PnPOnline -Url $SiteURL -UseWebLogin

#To remove user, use:- -RemoveRole
Set-PnPfolderPermission -List $ListName -identity $FolderServerRelativeURL -User "krish.rade@client.com" -RemoveRole "Full Control"
 



