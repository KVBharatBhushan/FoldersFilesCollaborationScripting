#Config Variables
$SiteURL = "https://client.sharepoint.com/sites/S022-013-IS/DemoMigration"
$FileRelativeURL ="/sites/S022-013-IS/DemoMigration/Reports Archive/SpecialDemo_dummyfile704.pdf"
 
#Get Credentials to connect
#$Cred = Get-Credential
 
Try {
    #Connect to PNP Online
    Connect-PnPOnline -Url $SiteURL -UseWebLogin
     
    #Try to Get File
    $File = Get-PnPFile -Url $FileRelativeURL -ErrorAction SilentlyContinue
    If($File)
    {
        #Delete the File
        Remove-PnPFile -ServerRelativeUrl $FileRelativeURL -Force
        Write-Host -f Green "File $FileRelativeURL deleted successfully!"
    }
    Else
    {
        Write-Host -f Yellow "Could not Find File at $FileRelativeURL"
    }
}
catch {
    write-host "Error: $($_.Exception.Message)" -foregroundcolor Red
}


