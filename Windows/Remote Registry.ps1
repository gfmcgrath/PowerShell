#Enable
Get-Service -ComputerName <Remote Computer> -Name RemoteRegistry | Set-Service -StartupType Manual -PassThru| Start-Service

#Disable
Get-Service -ComputerName <Remote Computer> -Name RemoteRegistry | Set-Service -StartupType Disabled -PassThru| Stop-Service