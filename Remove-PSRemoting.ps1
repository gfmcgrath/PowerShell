# https://4sysops.com/wiki/disable-powershell-remoting-disable-psremoting-winrm-listener-firewall-and-localaccounttokenfilterpolicy/

psexec.exe \\computername -h -s powershell.exe

Disable-PSRemoting -Force
Stop-Service WinRM -PassThru
Set-Service WinRM -StartupType Disabled -PassThru
Remove-Item -Path WSMan:\Localhost\listener\listener* -Recurse
Set-NetFirewallRule -DisplayName 'Windows Remote Management (HTTP-In)' -Enabled False -PassThru | Select-Object -Property DisplayName, Profile, Enabled