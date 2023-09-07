# Disable Firewall on Domain and Private Profiles
Write-Output "Disabling the Windows Firewall for Domain and Private Profiles..."
Set-NetFirewallProfile -Profile Domain,Private -Enabled False