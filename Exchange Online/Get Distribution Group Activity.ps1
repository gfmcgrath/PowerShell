Connect-ExchangeOnline

Get-MessageTrace -StartDate (Get-Date).Adddays(-10) -EndDate (Get-Date) -Status Expanded | Group-Object -Property RecipientAddress | Select-Object Name,Count | Sort-Object Name