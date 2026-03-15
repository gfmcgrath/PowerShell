# Detect-App
# v1.0
# 2024-07-23
# Gary McGrath
# A.I Assisted
# Detection script for use in Intune application deployments. Queries the registry for the existence of an MSI string for a given application name, this can be more reliable than using a detection method against the MSI string directly as this will include versions that have changed as part of an auto-update in the install process.

$appName = "Application Name"
$appVersion = "1.00.0000.0000"
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall", "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall"

$apps = Get-ChildItem -Path $regPath

$test = foreach ($app in $apps) {
    $app | Get-ItemProperty | Where-Object {($_.DisplayName -like "$appName")} | select-object *
}

if ($test.displayversion -ge "$appVersion") {
    Write-Host "Installed - $($test.DisplayVersion)"
    exit 0
} else {
    Write-Host "Not installed"
    exit 1
}
