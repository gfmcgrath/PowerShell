# GET LIST OF WINDOWS BUILDS FOR ALL AD COMPUTER OBJECTS BASED ON OS FILTER
Get-AdComputer -filter {OperatingSystem -like "Windows 10*"} -Properties OperatingSystemVersion | Select-Object Name,OperatingSystemVersion

# LIST WORKSTATIONS BASED ON NAME FILTER AND DISPLAY OU
Get-AdComputer -Properties * -Filter "Name -like '*string*'" | Select-Object Name,Description,IPv4Address,@{label='OU';expression={$_.DistinguishedName.Split(',')[1].Split('=')[1]}} | FT