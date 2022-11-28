#Source: https://microsoftgeek.com/?p=1869
#
#Exchange uses Display Name to set mail rules, such as delivery control / delegation, etc.
#
#If you encounter the error message “there are multiple recipients matching the identity x …..” when attempting to change these it means there is another AzureAD Object / User with the same display name.
#
#You will need to resolve the conflict. Exchange may take a long time to allow you to use if after you have solved the conflict, if you want to do it the fast way add the user via their SMTP address and not display name. You can only do this via PowerShell. Use this cmdlet with the Exchange-Online module loaded:

Set-DistributionGroup "GROUPNAME" -AcceptMessagesOnlyFrom((Get-DistributionGroup "GROUPNAME").AcceptMessagesOnlyFrom + "SMTP-NEW-SENDER")
