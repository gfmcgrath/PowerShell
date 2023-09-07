# FIND AD USER BY SAMACCOUNTNAME
Get-AdUser -Identity "user" | Select-Object Name,Enabled

# FIND AD USER BY DISPLAY NAME
Get-AdUser -Filter {Name -like '*username*'} | Select-Object Name,sAMAccountName

# FIND AD USER USING PROPERTY FILTERING
Get-AdUser -Properties * -Filter {'Property' -like "*string*"}

# LIST GROUP MEMBERSHIPS
Get-ADPrincipalGroupMembership "user" | Select-Object Name | Sort-Object Name

# LIST USERS _NOT_ IN A GROUP
$dn = (Get-ADGroup 'AD_Group_Name').DistinguishedName
Get-ADUser -Filter "-not memberof -RecursiveMatch '$dn'" | Select-Object Name | Sort-Object Name | Format-Table

# COUNT ACTIVE AD USER ACCOUNTS
(Get-ADUser -Filter 'enabled -eq "true"').count

# GET LAST LOGGED-IN USER OF DOMAIN COMPUTER
Get-ChildItem \\WORKSTATION_NAME\c$\Users | Sort-Object LastWriteTime | Select-Object -Last 1