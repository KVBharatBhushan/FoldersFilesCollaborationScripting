#Config Variables
$SiteURL = "https://client.sharepoint.com/sites/S022-013-IS/DemoMigration"
$CSVFilePath = "D:\Bharat\Folders_SameLib.csv"
  
Try {
    #Connect to PnP Online
    Connect-PnPOnline -Url $SiteURL -UseWebLogin
 
    #Get the CSV file
    $CSVFile = Import-Csv $CSVFilePath
   
    #Read CSV file and create document document library
    ForEach($Row in $CSVFile)
    {
        #Create Folder if it doesn't exist
        Resolve-PnPFolder -SiteRelativePath $Row.FolderSiteRelativeURL | Out-Null
        Write-host "Ensured Folder:"$Row.FolderSiteRelativeURL -f Green
    }
}
catch {
    write-host "Error: $($_.Exception.Message)" -foregroundcolor Red
}


