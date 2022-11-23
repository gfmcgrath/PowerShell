$computers = Get-Content .\computers2.txt

foreach ($computer in $computers2) {
    Get-ADComputer -Identity $computer -Properties OperatingSystemVersion | Select-Object name,OperatingSystemVersion
}
