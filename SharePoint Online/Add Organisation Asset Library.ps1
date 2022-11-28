Add-SPOOrgAssetsLibrary -LibraryUrl "https://millbrookqt.sharepoint.com/sites/AssetsLibrary/Millbrook Images/" -ThumbnailURL "https://millbrookqt.sharepoint.com/sites/AssetsLibrary/Millbrook Images/Summer WEB (71).jpg"

Add-SPOOrgAssetsLibrary -LibraryUrl "https://millbrookqt.sharepoint.com/sites/AssetsLibrary/Millbrook Templates/" [-OrgAssetType OfficeTemplateLibrary>] -CdnType Private



# Use the following PowerShell cmdlt, replacing the library URL and thumbnail URL with the values you desire.
# I have found that the cmdlet does not like URL's with spaces in the name, even if using the %20 break character or putting into quotation marks. It is usually easier to use a variable to declare the site and thumbnail and then use those as the parameters.
$library = "https://millbrookqt.sharepoint.com/sites/AssetsLibrary/Millbrook Images/"
$thumbnail = "https://millbrookqt.sharepoint.com/sites/AssetsLibrary/Millbrook Images/Summer WEB (71).jpg"
Add-SPOOrgAssetsLibrary -LibraryUrl $library -ThumbnailURL $thumbnail