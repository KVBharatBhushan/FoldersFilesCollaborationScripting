#Install-Module SharePointPnPPowerShellOnline
#Variables
$SiteURL = "https://client.sharepoint.com/sites/S022-013-IS/DemoMigration"
$FilesPath = "C:\Users\123594\Dummy Files2"
$SiteRelativePath = "/DemoLibrary/Created Folder"
 
#Connect to PNP Online
Connect-PnPOnline -Url $SiteURL -UseWebLogin 
 
#Get All Files from a Local Folder
$Files = Get-ChildItem -Path $FilesPath -Force -Recurse
 
#Upload All files from the directory
ForEach ($File in $Files)
{
    Write-host "Uploading $($File.Directory)\$($File.Name)"
  
    #upload a file to sharepoint online using powershell - Upload File and Set Metadata
    Add-PnPFile -Path "$($File.Directory)\$($File.Name)" -Folder $SiteRelativePath -Values @{"Title" = $($File.Name)}
}
