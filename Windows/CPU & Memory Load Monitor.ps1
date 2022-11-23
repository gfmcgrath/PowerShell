# CPU Load & Available Memory Monitor
# v0.1
# 2020-04-23
# Monitors real time usage of CPU resource use and available memory on the machine on which it is run. Adapted from code block submitted by NoOne on this threa: https://stackoverflow.com/questions/6298941/how-do-i-find-the-cpu-and-ram-usage-using-powershell

$totalRam = (Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property capacity -Sum).Sum
$hostname = (Get-CimInstance Win32_OperatingSystem).CSName

Write-Host 'Monitoring CPU & Memory for: '$hostname

while($true) {
    $date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $cpuTime = (Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples.CookedValue
    $availMem = (Get-Counter '\Memory\Available MBytes').CounterSamples.CookedValue
    $hostname + ' | ' + $date + ' | CPU Load: ' + $cpuTime.ToString("#,0.000") + '% | Available Memory: ' + $availMem.ToString("N0") + 'MB (' + (104857600 * $availMem / $totalRam).ToString("#,0.0") + '%)'
    Start-Sleep -s 2
}
