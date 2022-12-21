# View all mailboxes that the specified user has been assigned Full Access permission to
    Get-Mailbox | Get-MailboxPermission -User 'andres.gongora@millbrook.co.nz'

# Add Full Access permissions for the specified mailbox to the specified user	
    Add-MailboxPermission -Identity "<mailbox>" -User "<user>" -AccessRights FullAccess -InheritanceType All

# View all mailboxes that the specified usee has been assinged Send As permissions on
    Get-Mailbox | Get-RecipientPermission -Trustee 'andres.gongora@millbrook.co.nz'

# Add Send As Permissions for a user to a mailbox
    Add-RecipientPermission "<mailbox>" -AccessRights SendAs -Trustee "<user>"    