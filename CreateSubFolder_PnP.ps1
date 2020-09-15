#Config Variables
$SiteURL = "https://client.sharepoint.com/sites/S022-013-IS/DemoMigration"
$FolderName= "Created Sub Folder"
$RelativeURL= "/DemoLibrary/Created Folder" #Relative URL of the Parent Folder
Connect-PnPOnline -Url $SiteURL -UseWebLogin
 
#Get Credentials to connect
#$Cred = Get-Credential
 
Try {
    #Connect to PnP Online
    #Connect-PnPOnline -Url $SiteURL -Credentials $Cred
    Connect-PnPOnline -Url $SiteURL -UseWebLogin
     
    #sharepoint online create folder powershell
    Add-PnPFolder -Name $FolderName -Folder $RelativeURL -ErrorAction Stop
    Write-host -f Green "New Sub Folder '$FolderName' Added!"
}
catch {
    write-host "Error: $($_.Exception.Message)" -foregroundcolor Red
}


