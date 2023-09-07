# LIST ALL LOCKED OUT USER ACCOUNTS
Search-ADAccount -LockedOut | Select-Object Name,SamAccountName,PasswordExpired | Sort-Object Name | Format-Table -AutoSize

# LOCKED OUT STATUS PER USER
Get-ADUser -Identity 'username' -Properties * | Select-Object sAMAccountName,GivenName,LastName,LockedOut,AccountLockoutTime,badPwdCount