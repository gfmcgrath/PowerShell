# Search for Users by Type (Member / Guest)
Connect-AzureAD
Get-AzureAdUser -All $true | Where-Object {$_.UserType -Eq 'Member'}