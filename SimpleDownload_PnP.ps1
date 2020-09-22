$SharePointSiteURL = "https://sonyeur.sharepoint.com/sites/S022-013-IS/BoxMigration"  
# Change this SharePoint Site URL  
$SharedDriveFolderPath = "D:\Bharat\DemoLibFiles4"  
# Change this Network Folder path  
$SharePointFolderPath = "/Reports Archive/Barry" 
#$SiteRelativePath = "/Reports Archive/Barry"
  

#Connecting to SharePoint site
Connect-PnPOnline -Url $SharePointSiteURL -UseWebLogin
  
$Files = Get-PnPFolderItem -FolderSiteRelativeUrl $SharePointFolderPath -ItemType File  
foreach($File in $Files) {  
    Get-PnPFile -Url $File.ServerRelativeUrl -Path $SharedDriveFolderPath -FileName $File.Name -AsFile  
  
}   