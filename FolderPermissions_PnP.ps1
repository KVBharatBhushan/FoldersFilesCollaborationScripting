#Config Variables
$SiteURL = "https://client.sharepoint.com/sites/S022-013-IS/DemoMigration"
$ListName="Reports Archive"
$FolderServerRelativeURL = "/sites/S022-013-IS/DemoMigration/Reports Archive/Created Folder"
$UserAccount = "krish.rade@client.com"
  
#Connect to PnP Online
Connect-PnPOnline -Url $SiteURL -Useweblogin
 
#Get the Folder from URL
$Folder = Get-PnPFolder -Url $FolderServerRelativeURL
     
#Set Permission to Folder
Set-PnPListItemPermission -List $ListName -Identity $Folder.ListItemAllFields -User $UserAccount -AddRole 'Contribute'