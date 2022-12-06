# Get all users, computers, and service accounts that are disabled
Search-ADAccount -AccountDisabled | Select-Object Name,ObjectClass | Sort-Object ObjectClass | Format-Table -AutoSize

# Users Only
Search-ADAccount -AccountDisabled -UsersOnly | Select-Object Name,ObjectClass | Sort-Object ObjectClass | Format-Table -AutoSize

# Get all expired accounts
Search-ADAccount -PasswordExpired | Select-Object Name,ObjectClass | Sort-Object ObjectClass | Format-Table -AutoSize

#Get all locked out accounts
Search-ADAccount -LockedOut | Select-Object Name,ObjectClass | Sort-Object ObjectClass | Format-Table -AutoSize