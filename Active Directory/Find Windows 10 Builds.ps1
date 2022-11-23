Get-AdComputer -filter {OperatingSystem -like "Windows 10*"} -Properties OperatingSystemVersion | Select-Object name,OperatingSystemVersion
