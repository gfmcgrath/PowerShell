# Get Directory Size
# v1.0
# Gary McGrath
# Returns a sunnary of the size of all directories within the target directory in GB
# Adapted from http://woshub.com/powershell-get-folder-sizes/

$targetfolder='C:\Users\garym'
$dataColl = @()
Get-ChildItem -force $targetfolder -ErrorAction SilentlyContinue | Where-Object { $_ -is [io.directoryinfo] } | ForEach-Object {
$len = 0
Get-ChildItem -recurse -force $_.fullname -ErrorAction SilentlyContinue | ForEach-Object { $len += $_.length }
$foldername = $_.fullname
$foldersize= '{0:N2}' -f ($len / 1Gb)
$dataObject = New-Object PSObject
Add-Member -inputObject $dataObject -memberType NoteProperty -name “foldername” -value $foldername
Add-Member -inputObject $dataObject -memberType NoteProperty -name “foldersizeGb” -value $foldersize
$dataColl += $dataObject
}
$dataColl | Write-Output | Sort-Object foldersizeGb -Descending
