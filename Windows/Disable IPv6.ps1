# DisableIPv6
Write-Output "Disabling IPv6 For ALl Network Adapters..."
Disable-NetAdapterBinding -Name "*" -ComponentID ms_tcpip6