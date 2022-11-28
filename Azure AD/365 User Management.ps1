# Search for Users by Type (Member / Guest)
Get-AzureAdUser -All $true | Where-Object {$_.UserType -Eq 'Member'}