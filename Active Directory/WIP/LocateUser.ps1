# Work in progress script to search based on an AD username, find their last logged into Domain Computer and display IP Address and location based on hash table lookup.

# Hash Table of locations - populate these values based on your DHCP scopes
$locations = @{
    '10.0.0'    =   'Location A'
    '10.0.1'    =   'Location B'    
   
}

$targetUsername = 'username'

# Get last logged into computer based on description field - N.B. this is only useful if you have an environmnet in which the AD Computer Description field gets updated with the username on logon. You will need to script and run that seperately in your environment.
$lastComputer = Get-AdComputer -Filter "Description -like '*$targetUsername*'" -Properties lastLogonTimestamp | Sort-Object LastLogonTimestamp -Descending | Select-Object -First 1

$hostName = $lastComputer.Name

$ipAddress = (Resolve-DnsName $hostName | Where-Object {$_.Type -eq 'A'}).IPAddress
$trimmedIP = ($ipAddress -split "\.") -join "."
$trimmedIP = $trimmedIP.Substring(0, $trimmedIP.LastIndexOf("."))

$passwordExpires = (Get-ADUser -Identity $targetUsername -Properties "DisplayName", "msDS-UserPasswordExpiryTimeComputed" | Select-Object -Property "Displayname",@{Name="ExpiryDate";Expression={[datetime]::FromFileTime($_."msDS-UserPasswordExpiryTimeComputed")}}).ExpiryDate

$lockedOut = (Get-ADUser -Identity $targetUsername -Properties * | Select-Object sAMAccountName,GivenName,LastName,LockedOut,AccountLockoutTime,badPwdCount).LockedOut

$myHashtable = [ordered]@{
    Username                    =   $targetUsername
    'Last Computer Logged Into' =   $hostName
    'IP Address'                =   $ipAddress
    Location                    =   $locations[$trimmedIP]
    'Password Expires On'       =   $passwordExpires 
    'Locked Out'                =   $lockedOut
}

$myObject = [pscustomobject]$myHashtable

$myObject