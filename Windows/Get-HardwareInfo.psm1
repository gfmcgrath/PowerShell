function Get-HardwareInfo {
    (Get-CimInstance -ClassName Win32_PhysicalMemory | Measure-Object -Property capacity -Sum).sum /1mb
    (Get-CimInstance -Namespace root/CIMV2 -ClassName Win32_Processor -ComputerName $computer).Name
}

Get-HardwareInfo | Format-Table


# $computer = Read-Host -Prompt 'Enter hostname'
# Write-Host 'Gathering Hardware Information...'

# $totalmemory = Get-CimInstance -Namespace root/CIMV2 -ClassName Win32_PhysicalMemory -ComputerName $computer | Measure-Object -Property capacity -Sum | Foreach {"{0:N2}" -f ([math]::round(($_.Sum / 1GB),2))}

# $totalmemory = (Get-CimInstance -ClassName Win32_PhysicalMemory | Measure-Object -Property capacity -Sum).sum /1mb
# $cpuinfo = (Get-CimInstance -Namespace root/CIMV2 -ClassName Win32_Processor -ComputerName $computer).Name


# Write-Host ' '
# Write-Host 'CPU:' $cpuinfo
# Write-Host 'Installed Memory (MB):' $totalmemory


# $objSession | Get-CimInstance -Namespace root/CIMV2 -ClassName Win32_Processor | select Name | Format-List
