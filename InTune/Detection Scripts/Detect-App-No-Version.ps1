# Detect-App-No-Version
# v1.0
# 2026-03-16
# Gary McGrath
# A.I Assisted
# Detection script for use in Intune application deployments. Queries the registry for the existence of an MSI string for a given application name, this can be more reliable than using a detection method against the MSI string directly as this will include versions that have changed as part of an auto-update in the install process.


$appName = "Application Name"
$regPath = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall", "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall"

$apps = Get-ChildItem -Path $RegPath

$Test = foreach ($app in $apps) {
    $app | Get-ItemProperty | Where-Object {($_.DisplayName -like "$appName")} | select-object *
}
if ($Test) {
    Write-Host "Installed - $($test.DisplayName) $($test.DisplayVersion)"
    exit 0
} else {
    Write-Host "Not installed"
    exit 1
}
