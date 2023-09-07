# VIEW PERMISSIONS
###################################

# View permissions for the specified MAILBOX
Get-Mailbox -Identity 'user@qldc.govt.nz' | Get-MailboxPermission           #FullAccess
Get-Mailbox -Identity 'user@qldc.govt.nz' | Get-RecipientPermission         #SendAs

# View permissions for the specified USER (queries ALL mailboxes in domain, can take long time to run)
Get-Mailbox -ResultSize Unlimited | Get-MailboxPermission -User 'user@domain.com'
Get-Mailbox -ResultSize Unlimited | Get-RecipientPermission -Trustee 'user@domain.com'



# ASSIGN PERMISSIONS
###################################
# Add Full Access permissions	
Add-MailboxPermission -Identity "mailbox-to-give-permissions-to@qldc.govt.nz" -User "user-to-receive-permissions@domain.com" -AccessRights FullAccess -InheritanceType All

# Add Send As Permissions
Add-RecipientPermission "mailbox-to-give-permissions-to@qldc.govt.nz" -AccessRights SendAs -Trustee "user-to-receive-permissions@domain.com" 