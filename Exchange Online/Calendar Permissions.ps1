# Sources: http://theitbros.com/add-calendar-permissions-in-office-365-via-powershell/

# View Calendar permissions for nominated mailbox
Get-MailboxFolderPermission -Identity 'user@domain.com:\calendar'

# Add a permission to a new user
Add-MailboxFolderPermission -Identity 'address_of_user:\calendar' -User 'address_of_user_to_gain_access' -AccessRights [Owner|PublishingEditor|Editor|PublishingAuthor|Author|NonEditingAuthor|Reviewer|Contributor|AvailabilityOnly|LimitedDetails|None]

# Update a users permissions
Set-MailboxFolderPermision -Identity 'address_of_user:\calendar' -User 'address_of_user_to_gain_access' -AccessRights [Owner|PublishingEditor|Editor|PublishingAuthor|Author|NonEditingAuthor|Reviewer|Contributor|AvailabilityOnly|LimitedDetails|None]

# List Default Calendar Permissiosn for all Users
Get-Mailbox -ResultSize Unlimited -RecipientTypeDetails UserMailbox | ForEach {Get-MailboxFolderPermission -Identity "$($_.PrimarySMTPAddress):\Calendar" -User Default} | Select-Object Identity,User,AccessRights