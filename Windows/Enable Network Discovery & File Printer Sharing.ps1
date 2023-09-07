# Turn on Network Discovery & File And Printer Sharing for Domain Profile
Write-Output "Enabling File & Printer Sharing and Network Discovery..."
Get-NetFirewallRule -DisplayGroup 'File and Printer Sharing' | Set-NetFirewallRule -Profile 'Domain' -Enabled True
Get-NetFirewallRule -DisplayGroup 'Network Discovery' | Set-NetFirewallRule -Profile 'Domain' -Enabled True