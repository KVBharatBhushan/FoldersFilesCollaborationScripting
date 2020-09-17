#Variables
$CSVPath  ="D:\Bharat\users.csv"
 
#Get data from CSV
$CSVData = Import-Csv $CSVPath
 
#Iterate through each row in CSV
ForEach($Row in $CSVData)
{
    Try {
        #Connect to SharePoint Online Site
        Write-host "Connecting to Site: "$Row.SiteURL
        Connect-PnPOnline -Url $Row.SiteURL -UseWebLogin
  
        #Get the group
        $Group = Get-PnPGroup -Identity $Row.GroupName
  
        #Add Each user to the Group
        Add-PnPUserToGroup -LoginName $Row.UserAccount -Identity $Group
        Write-host -f Green "`tAdded User $($Row.UserAccount) to $($Group.Title)"
        DisConnect-PnPOnline
    }
    Catch {
        write-host -f Red "Error Adding User to Group:" $_.Exception.Message
    }
}

