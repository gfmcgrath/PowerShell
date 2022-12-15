# Get all users, computers, and service accounts that are disabled
Search-ADAccount -AccountDisabled | Select-Object Name,ObjectClass | Sort-Object ObjectClass | Format-Table -AutoSize

# Get only disabled user accounts
Search-ADAccount -AccountDisabled -UsersOnly | Select-Object Name,ObjectClass | Sort-Object ObjectClass | Format-Table -AutoSize

# Get all locked out accounts
Search-ADAccount -LockedOut | Select-Object Name,ObjectClass | Sort-Object ObjectClass | Format-Table -AutoSize

# View expiry date for all user accounts
Get-ADUser -Filter {Enabled -eq $True -and PasswordNeverExpires -eq $False} -Properties "DisplayName", "msDS-UserPasswordExpiryTimeComputed" | Select-Object -Property "Displayname",@{Name="ExpiryDate";Expression={[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")}} | Sort-Object ExpiryDate

# View expiry date for a specific user
Get-ADUser -Filter 'Name -like "<USERNAME>"' -Properties "DisplayName", "msDS-UserPasswordExpiryTimeComputed" | Select-Object -Property "Displayname",@{Name="ExpiryDate";Expression={[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")}}

# Get Count of Active AD User Accounts
(Get-ADUser -filter 'enabled -eq "true"').count