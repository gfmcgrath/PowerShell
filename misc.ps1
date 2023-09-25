# Misc. PowerShell cmdlets that may be useful

# Get a list of ID's / object, and then return a result based on a lookup of that object. For example, in Graph PowerShell modules the Get-MgGroupMember will only return the GUID, use this to match to a human readable name.
Get-MgGroupMember -GroupId 'the object ID of the Research group' -All | ForEach {Get-MgUser -UserId $_.Id}
