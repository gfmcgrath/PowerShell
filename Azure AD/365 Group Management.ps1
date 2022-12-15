# List Microsoft 365 Groups
Connect-AzureAD
Get-AzureADGroup -SearchString "group name"

# View membership of Microsoft 365 Groups
Connect-AzureAD
Get-AzureADGroupMember -ObjectID "ID String"