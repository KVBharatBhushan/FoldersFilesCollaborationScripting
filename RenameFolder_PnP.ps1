#Config Variables 
$SiteURL = "https://client.sharepoint.com/sites/S022-013-IS/DemoMigration" 
#$LibURL= "Reports Archive/" #For renaming Lib name
$FolderURL= "Reports Archive/TestABC" #For renaming Folder name

#Site Relative URL 
$FolderNewName ="Reports Archive" 

#Connect to PnP Online 
Connect-PnPOnline -Url $SiteURL -UseWebLogin

#Rename the Folder 
Rename-PnPFolder -Folder $FolderURL -TargetFolderName $FolderNewName

