# GET COUNT OF ACTIVE AD USER ACCOUNTS
(Get-ADUser -filter 'enabled -eq "true"').count 

# GET LIST OF WINDOWS BUILDS FOR ALL AD COMPUTER OBJECTS BASED ON OS FILTER
Get-AdComputer -filter {OperatingSystem -like "Windows 10*"} -Properties OperatingSystemVersion | Select-Object name,OperatingSystemVersionP