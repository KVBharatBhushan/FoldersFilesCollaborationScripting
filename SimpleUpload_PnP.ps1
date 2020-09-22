$SiteURL = "https://sonyeur.sharepoint.com/sites/S022-013-IS/BoxMigration"
$FilesPath = "C:\Users\7000023594\Dummy Files2"
$SiteRelativePath = "/Reports Archive"
 
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
