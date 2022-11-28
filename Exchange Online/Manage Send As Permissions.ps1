# View all mailboxes that the specified usee has been assinged Send As permissions on

Get-Mailbox | Get-RecipientPermission -Trustee 'gary.mcgrath@millbrook.co.nz'


# Add Send As Permissions for a user to a mailbox

Add-RecipientPermission "<mailbox>" -AccessRights SendAs -Trustee "<user>"