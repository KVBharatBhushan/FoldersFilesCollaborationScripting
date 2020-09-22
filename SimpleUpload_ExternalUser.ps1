$FilesPath = "D:\Bharat\DemoLibFiles4"
$SiteRelativePath = "/DemoLibrary/ALS" 
 
$Username = "kvbharatbhushan@hotmail.com"
$Password = ‘##################’
$SiteCollection = "https://sonyeur.sharepoint.com/sites/S022-013-IS/BoxMigration"

[SecureString]$SecurePass = ConvertTo-SecureString $Password -AsPlainText -Force
[System.Management.Automation.PSCredential]$PSCredentials = New-Object System.Management.Automation.PSCredential($Username, $SecurePass)
Connect-PnPOnline -Url $SiteCollection -Credentials $PSCredentials
 
 
#Get All Files from a Local Folder
$Files = Get-ChildItem -Path $FilesPath -Force -Recurse
 
#Upload All files from the directory
ForEach ($File in $Files)
{
    Write-host "Uploading $($File.Directory)\$($File.Name)"
  
    #upload a file to sharepoint online using powershell - Upload File and Set Metadata
    Add-PnPFile -Path "$($File.Directory)\$($File.Name)" -Folder $SiteRelativePath -Values @{"Title" = $($File.Name)}
}
  

