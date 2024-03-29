# PowerShell Scripts
A collection of useful (and some perhaps not so useful) PowerShell scripts.

## Contents

1. [PowerShell Versions](#powershell-versions)
    1. [Windows PowerShell](#windows-powershell)
    2. [PowerShell (Core)](#powershell-formerly-powershell-core)
2. [PowerShell Modules](#powershell-modules)
    1. [Active Directory](#active-directory)
    2. [AzureAD](#azure-ad)
    3. [Exchange Online](#exchange-online)
    4. [SharePoint Online](#sharepoint-online)
        1. [SharePoint Online Management Shell](#sharepoint-online-management-shell)
        2. [SharePoint PnP](#sharepoint-pnp)
    5. [Microsoft Teams](#microsoft-teams)



## PowerShell Versions
There are 2 versions of PowerShell currently available.

Some modules only work with **Windows PowerShell** - these are noted in their relevant sections.

### Windows PowerShell
This is the version of PowerShell that is pre-installed on all Windows based systems from Windows 10 onwards, and on Windows Server systems. The most recent release version if 5.1. 

This is no longer under active development and has been deprecated in favour of the newer, cross-platform PowerShell Core. However there are some cmdlets and modules which will only work in Windows PowerShell, so it is common to have both versions installed at the same time as the two can co-exist.

### PowerShell (formerly PowerShell Core)
This is designed to be the replacement for Windows PowerShell. It is cross-platform and includes updated and new cmdlets not available in Windows PowerShell. It is actively developed under an Open Source license. The current release version is 7.

**Installation Guide:** https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.3



## PowerShell Modules
The below sections detail the modules required to run the scripts included in this repository. They are organised according to the product they relate to. It is necessary to have these modules installed and loaded into your sessions for the scripts to run.


### Active Directory
To run the Active Directory scripts, the following are required:

1. Remote Server Administration Tools (RSAT) installed on the PC you are running them from.
2. Appropriate domain level permissions to perform the commands (e.g. Domain Administrator).
3. Have connectivity to a Domain Controller.

To install the RSAT Tools, in Windows go to **Settings -> Apps -> Manage Optional Features -> Add a feature** and add the required features.

At a minimum you should add **RSAT: Active Directory Domain Services and Lightweight Directory Services Tools**


### Azure AD
At time of writing, there are now 3 different ways of interacting with AzureAD via PowerShell:

1. MSOnline Module
2. AzureAD Module
3. MS Graph

The MSONline Module is now deprecated. AzureAD is being phased out in favour using MS Graph API, however these scripts are still built using the AzureAD module so this is the one you should install:

`Install-Module -Name AzureAD`

This module is only compatible with Windows PowerShell 5.1, NOT PowerShell 7.

**Reference:** https://learn.microsoft.com/en-us/powershell/module/azuread


### Exchange Online
The current release version of Exchange Online Management module is v3. This works with PowerShell 7 and should be the one used:

`Install-Module -Name ExchangeOnlineManagement`

**Reference:** https://learn.microsoft.com/en-us/powershell/exchange/exchange-online-powershell?view=exchange-ps


### SharePoint Online
#### SharePoint Online Management Shell
The SharePoint Online Management Shell provides PowerShell access to items available in the SharePoint Online administration centre. This does not provide direct access to control things such as List Items - they are instead handled via other modules such as SharePoint PnP.

`Install-Module -Name Microsoft.Online.SharePoint.PowerShell`

**Reference:** https://learn.microsoft.com/en-us/powershell/sharepoint/sharepoint-online/

#### SharePoint PnP
This gives more access to directly interact with Lists, etc.

`Install-Module -Name PnP.PowerShell`

You will also be required to register an Azure AD application in your tenant in order to be able to authenticate to use the commands in this module. This is a one-time setup that applies to the entire tenant:

`Register-PnPManagementShellAccess`

Refer to the guide for further instructions on registering the AzureAD application: https://pnp.github.io/powershell/articles/authentication.html

**Reference:** https://pnp.github.io/powershell/index.html


### Microsoft Teams
`Install-Module -Name MicrosoftTeams`

The Microsoft Teams PowerShell module is only compatible in Windows PowerShell 5.1.

**Reference:** https://learn.microsoft.com/en-us/powershell/teams