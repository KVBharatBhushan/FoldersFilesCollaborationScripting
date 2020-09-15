#Config Variables
$SiteURL = "https://client.sharepoint.com/sites/S022-013-IS/DemoMigration"
$LibraryName = "Reports Archive"
  
#Connect to PnP Online
Connect-PnPOnline -Url $SiteURL -UseWebLogin
 
#Get All Files from the document library
$Files = Get-PnPListItem -List $LibraryName -PageSize 1000 | Where {$_["FileLeafRef"] -like "*dummy*"}
  
#Loop through each File
Write-host -f Green "Number of Files Found:"$Files.Count
ForEach($File in $Files)
{ 
    Write-Host ("Renaming File '{0}' at {1}" -f $File["FileLeafRef"], $File["FileRef"])
    #Rename File
    Rename-PnPFile -ServerRelativeUrl $File["FileRef"] -TargetFileName "SpecialDemo_$($File['FileLeafRef'])" -OverwriteIfAlreadyExists -Force
}
