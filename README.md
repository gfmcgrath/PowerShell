# PowerShell Scripts
A collection of useful (and some perhaps not so useful) PowerShell scripts.

## PowerShell Versions
There are 2 versions of PowerShell currently available:

### Windows PowerShell
This is the version of PowerShell that is pre-installed on all Windows based systems from Windows 10 onwards, and on Windows Server systems. The most recent release version if 5.1. 

This is no longer under active development and has been deprecated in favour of the newer, cross-platform PowerShell Core. However there are some cmdlets and modules which will only work in Windows PowerShell, so it is common to have both versions installed at the same time as the two can co-exist.

### PowerShell (formerly PowerShell Core)
This is designed to be the replacement for Windows PowerShell. It is cross-platform and includes updated and new cmdlets not available in Windows PowerShell. It is actively developed under an Open Source license. The current release version is 7.

Some modules only work with **Windows PowerShell** - these are noted below.

## PowerShell Modules
The below sections detail the modules required to run the scripts included in this repository. They are organised according to the product they relate to. It is necessary to have these modules installed and loaded into your sessions for the scripts to run.

### Active Directory
To run the Active Directory scripts, the following are required:

1. Remote Server Administration Tools (RSAT) installed on the PC you are running them from.
2. Appropriate domain level permissions to perform the commands (e.g. Domain Administrator).
3. Have connectivity to a Domain Controller.

To install the RSAT Tools, in Windows go to **Settings -> Apps -> Manage Optional Features -> Add a feature** and add the required features. At a minimum you should add **RSAT: Active Directory Domain Services and Lightweight Directory Services Tools**

### Azure AD
To use Azure AD related scripts you will require the AzureAD PowerShell module.

At time of writing, there are now 3 different ways of interacting with AzureAD via PowerShell:

1. MSOnline Module
2. AzureAD Module
3. MS Graph

The MSONline Module is now deprecated. AzureAD is being phased out in favour using MS Graph API, however these scripts are still built using the AzureAD module. To install this, run the following in an Admin PowerShell window:

`Install-Module AzureAD`

This module is only compatible with Windows PowerShell 5.1, NOT PowerShell 7.

### Exchange Online
The current release version of Exchange Online Management is v3. This works with PowerShell 7.

#### Install
`Install-Module -Name ExchangeOnlineManagement`

#### Documentation
https://learn.microsoft.com/en-us/powershell/exchange/exchange-online-powershell?view=exchange-ps

| --- | --- |
| Install | `Install-Module -Name ExchangeOnlineManagement` |
| Documentation | https://learn.microsoft.com/en-us/powershell/exchange/exchange-online-powershell?view=exchange-ps