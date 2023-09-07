$userName = Read-Host "Username"
$todaysDate = Get-Date -Format "yyyyMMdd"

Get-ADUser -Identity $userName -Properties * | Export-CSV "$todaysDate-$userName.csv"