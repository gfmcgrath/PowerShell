$computer = Read-Host -Prompt 'Enter Hostname'

$objSession = New-CimSession -ComputerName $computer

Write-Host 'Gathering installed software information...'

$objSession | Get-CimInstance -Namespace root/CIMV2 -ClassName Win32_InstalledWin32Program | Select-Object Name,Vendor,Version | Sort-Object Name | Format-Table -AutoSize
