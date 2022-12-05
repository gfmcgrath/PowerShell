# View Local Profiles on a machine
Get-CimInstance -Class Win32_UserProfile | Where-Object {$_.Special -ne "True"} | Select-Object LastUseTime,LocalPath | Format-Table

# Remove a specified local profile
Get-CimInstance -Class Win32_UserProfile | Where-Object { $_.LocalPath.split('\')[-1] -eq 'UserA' } | Remove-CimInstance