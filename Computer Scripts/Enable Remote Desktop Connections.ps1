Write-Output "Enabling Remote Desktop Connections (MSTC/RDP)..."
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0
Set-NetFirewallRule -DisplayGroup "Remote Desktop" -Profile 'Domain,Private' -Enabled True