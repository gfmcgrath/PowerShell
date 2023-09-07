# Grab details from the user to copy from

$copyUsername = 'username'

$copyUser = Get-AdUser -Identity $copyUsername -Properties * 

$userOU = ($copyUser.DistinguishedName -split ",",2)[1]

$groups = Get-ADPrincipalGroupMembership $copyUsername

#$outObject = [PSCustomObject]@{
#    OU = $userOU
#    Groups = $groups | Select-Object Name
#}

$userOU
$groups | Select-Object Name