# View Anti-Malware Policies
Get-MalwareFilterPolicy

# View Blockes File Types
Get-MalwareFilterPolicy | Where-Object {$_.AdminDisplayName -eq 'Millbrook Standard Policy'} | Select-Object -ExpandProperty FileTypes