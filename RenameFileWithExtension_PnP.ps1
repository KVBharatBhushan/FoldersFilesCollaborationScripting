#Config Variables
$SiteURL = "https://client.sharepoint.com/sites/S022-013-IS/DemoMigration"
$FileURL= "Reports Archive/Created Folder/newNAMEfile.txt"
$NewFileName ="Topdf.pdf" #Always include file extension
 
#Connect to PnP Online
Connect-PnPOnline -Url $SiteURL -UseWebLogin
 
#Rename the File
Rename-PnPFile -SiteRelativeUrl $FileURL -TargetFileName $NewFileName -Force


