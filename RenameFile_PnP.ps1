#Config Variables
$SiteURL = "https://client.sharepoint.com/sites/S022-013-IS/DemoMigration"
$FileURL= "Reports Archive/Created Folder/test2.txt"
$NewFileName ="newNAMEfile.txt" #Always include file extension
 
#Connect to PnP Online
Connect-PnPOnline -Url $SiteURL -UseWebLogin
 
#Rename the File
Rename-PnPFile -SiteRelativeUrl $FileURL -TargetFileName $NewFileName -Force


