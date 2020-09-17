#PowerShell script to Download files from SharePoint Online Document Library folder to network path  
#Created By: Veera Bharat 

$SharePointSiteURL = "https://clienteur.sharepoint.com/sites/S022-013-IS/DemoMigration"  
# Change this SharePoint Site URL  
$SharedDriveFolderPath = "D:\Bharat\DemoLibFiles4"  
# Change this Network Folder path  
$SharePointFolderPath = "/Reports Archive/Barry" 
#$SiteRelativePath = "/Reports Archive/Barry"
  
# Change the Document Library and Folder path  
#Ends[SecureString] $SecurePass = ConvertTo - SecureString $O365ServiceAccountPwd - AsPlainText - Force[System.Management.Automation.PSCredential] $PSCredentials = New - Object System.Management.Automation.PSCredential($O365ServiceAccount, $SecurePass)  

#Connecting to SharePoint site  
#Connect-PnPOnline -Url $SharePointSiteURL -Credentials $PSCredentials
Connect-PnPOnline -Url $SharePointSiteURL -UseWebLogin
  
$Files = Get-PnPFolderItem -FolderSiteRelativeUrl $SharePointFolderPath -ItemType File  
foreach($File in $Files) {  
    Get-PnPFile -Url $File.ServerRelativeUrl -Path $SharedDriveFolderPath -FileName $File.Name -AsFile 
    
    #Get-PnPFile -Path "$($File.Directory)\$($File.Name)" -Folder $SiteRelativePath -Values @{"Title" = $($File.Name)} 
}   