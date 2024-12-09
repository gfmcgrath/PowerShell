# Get all network adapters
$networkAdapters = Get-NetAdapter

# Check each adapter for IPv6
$ipv6Enabled = $networkAdapters | ForEach-Object {
    $ipv6 = Get-NetAdapterBinding -ComponentID ms_tcpip6 -InterfaceAlias $_.Name
    if ($ipv6.Enabled) {
        return $true
    }
}

# Return true if any adapter has IPv6 enabled
if ($ipv6Enabled -contains $true) {
    Write-Output $true
    Exit 1
} else {
    Write-Output $false
    Exit 0
}