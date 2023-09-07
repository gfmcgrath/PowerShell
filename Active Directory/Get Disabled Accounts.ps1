# Get all users, computers, and service accounts that are disabled
Search-ADAccount -AccountDisabled | Select-Object Name,ObjectClass | Sort-Object ObjectClass | Format-Table -AutoSize

# Get only disabled user accounts
Search-ADAccount -AccountDisabled -UsersOnly | Select-Object Name,ObjectClass | Sort-Object ObjectClass | Format-Table -AutoSize