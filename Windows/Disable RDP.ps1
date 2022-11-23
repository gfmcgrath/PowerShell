Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server'-name "fDenyTSConnections" -Value   1
Disable-NetFirewallRule -DisplayGroup "Remote Desktop" 
