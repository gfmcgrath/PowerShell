# Get all network adapters
$networkAdapters = Get-NetAdapter

# Disable IPv6 on adapters where it is enabled
$networkAdapters | ForEach-Object {
    $ipv6 = Get-NetAdapterBinding -ComponentID ms_tcpip6 -InterfaceAlias $_.Name
    if ($ipv6.Enabled) {
        Disable-NetAdapterBinding -Name $_.Name -ComponentID ms_tcpip6
        Write-Output "Disabled IPv6 on adapter: $($_.Name)"
    }
}