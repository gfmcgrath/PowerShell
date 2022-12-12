# Get Message Trace for specified date range - 10 days is the maximum possible range, will need to use web GUI / Content Discovery for longer searches

Get-MessageTrace -StartDate (Get-Date).Adddays(-10) -EndDate (Get-Date) -RecipientAddress

Get-MessageTrace -StartDate (Get-Date).AddDays(-1) -EndDate (Get-Date) | Select-Object -First 25

# View specifically Distribution Group acitivity for specified date range (maximum 10 days) this uses the Expanded status property to identify DstGrps

Get-MessageTrace -StartDate (Get-Date).Adddays(-10) -EndDate (Get-Date) -Status Expanded | Group-Object -Property RecipientAddress | Select-Object Name,Count | Sort-Object Name