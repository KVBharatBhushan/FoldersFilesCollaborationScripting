

#Config Variables
$SharePointSiteURL = "https://clienteur.sharepoint.com/sites/S022-013-IS/DemoMigration"
$FolderName= "One More Folder"
$RelativeURL= "/Reports Archive" #Relative URL of the Parent Folder
 
Try {
    #Connect to PnP Online    
    #Connect-PnPOnline -Url $SharePointSiteURL -CurrentCredentials
    Connect-PnPOnline -Url $SharePointSiteURL -UseWebLogin
     
    #sharepoint online create folder powershell
    Add-PnPFolder -Name $FolderName -Folder $RelativeURL -ErrorAction Stop
    Write-host -f Green "New Folder '$FolderName' Added!"
}
catch {
    write-host "Error: $($_.Exception.Message)" -foregroundcolor Red
}


