# View Anti-Malware Policies
Connect-ExchangeOnline
Get-MalwareFilterPolicy

# View Blockes File Types
Connect-ExchangeOnline
Get-MalwareFilterPolicy | Where-Object {$_.AdminDisplayName -eq 'Millbrook Standard Policy'} | Select-Object -ExpandProperty FileTypes