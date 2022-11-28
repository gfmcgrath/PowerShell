# View all mailboxes that the specified user has been assigned Full Access permission to

Get-Mailbox | Get-MailboxPermission -User 'gary.mcgrath@millbrook.co.nz'



# Add Full Access permissions for the specified mailbox to the specified user
	
Add-MailboxPermission -Identity "<mailbox>" -User "<user>" -AccessRights FullAccess -InheritanceType All