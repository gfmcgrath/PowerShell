# PowerShell Scripts
A collection of useful (and some perhaps not so useful) PowerShell scripts.

## Active Directory
To run the Active Directory scripts, the following are required:

1. Remote Server Administration Tools (RSAT) installed on the PC you are running them from.
2. Appropriate domain level permissions to perform the commands (e.g. Domain Administrator).
3. Have connectivity to a Domain Controller.

To install the RSAT Tools, in Windows go to **Settings -> Apps -> Manage Optional Features -> Add a feature** and add the required features. At a minimum you should add **RSAT: Active Directory Domain Services and Lightweight Directory Services Tools**

## Azure AD
To use Azure AD related scripts you will require the AzureAD PowerShell module.

At time of writing, there are now 3 different ways of interacting with AzureAD via PowerShell:

1. MSOnline Module
2. AzureAD Module
3. MS Graph

The MSONline Module is now deprecated. AzureAD is being phased out in favour using MS Graph API, however these scripts are still built using the AzureAD module. To install this, run the following in an Admin PowerShell window:

`Install-Module AzureAD`