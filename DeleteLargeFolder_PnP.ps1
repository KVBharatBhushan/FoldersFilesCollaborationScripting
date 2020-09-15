#Config Variables
$SiteURL = "https://client.sharepoint.com/sites/S022-013-IS/DemoMigration"
$ListName="Reports Archive"
$FolderServerRelativeURL = "/sites/S022-013-IS/DemoMigration/Reports Archive/Created Folder"
 
Try {
    #Connect to PnP Online
    Connect-PnPOnline -Url $SiteURL -UseWebLogin
      
    #Get All Items from Folder in Batch
    $ListItems = Get-PnPListItem -List $ListName -FolderServerRelativeUrl $FolderServerRelativeURL -PageSize 2000 | Sort-Object ID -Descending
  
    #Powershell to delete all files from folder
    ForEach ($Item in $ListItems)
    {
        Remove-PnPListItem -List $ListName -Identity $Item.Id -Recycle -Force
        Write-host "Removed File:"$Item.FieldValues.FileRef
    }
}
Catch {
    write-host "Error: $($_.Exception.Message)" -foregroundcolor Red
}

