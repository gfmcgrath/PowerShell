# Find-MgGraphCommand -Command 'Get-MgDirectoryRole' | Select-Object -First 1 -ExpandProperty Permissions
# Find-MgGraphCommand -Command 'Get-MgDirectoryRoleMember' | Select-Object -First 1 -ExpandProperty Permissions

Connect-MgGraph -Scopes 'Directory.Read.All','RoleManagement.Read.Directory'

Get-MgDirectoryRole | Format-Table Id,DisplayName,Description


$Name | ForEach-Object -ThrottleLimit 5 -Parallel {
    $testC = Test-Connection -ComputerName $_ -Count 1 -ErrorAction SilentlyContinue -Quiet
}
