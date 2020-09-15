#Config Variables
$SiteURL = "https://client.sharepoint.com/sites/S022-013-IS/DemoMigration"
$ListName="Reports Archive"
$FileRelativeURL = "/sites/S022-013-IS/DemoMigration/Reports Archive/Created Folder/Topdf.pdf"

$DownloadPath ="D:\Bharat"
 
#Get Credentials to connect
#$Cred = Get-Credential
 
Try {
    #Connect to PNP Online
    Connect-PnPOnline -Url $SiteURL -Useweblogin
     
    #powershell download file from sharepoint online
    Get-PnPFile -Url $FileRelativeURL -Path $DownloadPath -AsFile
}
catch {
    write-host "Error: $($_.Exception.Message)" -foregroundcolor Red
}


