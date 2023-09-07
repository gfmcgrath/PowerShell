# Uptime Checker v0.1
# G.McGrath 2020-04-23
# Checks for the uptime of a specified system.

# $machine = Read-Host -Prompt 'Enter hostname of system to check'

Write-Host 'Your system uptime is:'

# (Get-Date) - (Get-CimInstance Win32_OperatingSystem -ComputerName $machine).LastBootupTime | Select-Object Days,Hours,Minutes,Seconds | Format-Table

(Get-Date) - (Get-CimInstance Win32_OperatingSystem).LastBootupTime | Select-Object Days,Hours,Minutes,Seconds | Format-Table
