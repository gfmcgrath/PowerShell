# First, we find the GUID of the Power Plan by searching for its Display Name and then using RegEx to extract the GUID only
powercfg /list | Where-Object {$_ -match "string"} | ForEach-Object {$guid = $_ -replace '.*GUID:\s*([-a-f0-9]+).*', '$1'}

# Next, set the selected power plan as the active
powercfg /setactive $guid