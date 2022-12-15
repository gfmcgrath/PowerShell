$siteURL = "https://millbrookqt.sharepoint.com/sites/stores"
$listName = "Stores Daily Package Tracker"

Connect-PnPOnline -Url $siteURL -Interactive

Get-PnPField -List $listName