# VIEW PERMISSIONS
###################################

# View permissions for the specified MAILBOX
Get-Mailbox -Identity 'user@domain.com' | Get-MailboxPermission           #FullAccess
Get-Mailbox -Identity 'user@domain.com' | Get-RecipientPermission         #SendAs

# View permissions for the specified USER
Get-Mailbox -ResultSize Unlimited | Get-MailboxPermission -User 'user@domain.com'
Get-Mailbox -ResultSize Unlimited | Get-RecipientPermission -Trustee 'user@domain.com'



# ASSIGN PERMISSIONS
###################################

# Add Full Access permissions	
Add-MailboxPermission -Identity "mailbox-to-give-permissions-to@domain.com" -User "user-to-receive-permissions@domain.com" -AccessRights FullAccess -InheritanceType All

# Add Send As Permissions
Add-RecipientPermission "mailbox-to-give-permissions-to@domain.com" -AccessRights SendAs -Trustee "user-to-receive-permissions@domain.com" 