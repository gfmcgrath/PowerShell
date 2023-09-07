# Enable Remote Assistance Connecitons
Write-Output "Enabling Remote Assistance (MRSA) Connections..."
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Remote Assistance' -name 'fAllowToGetHelp' -value 1
Set-NetFirewallRule -DisplayGroup "Remote Assistance" -Profile 'Domain,Private' -Enabled True