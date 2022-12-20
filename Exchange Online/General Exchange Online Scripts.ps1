# View all mailboxes that have automatic replies enabled
Connect-ExchangeOnline
(Get-Mailbox -ResultSize unlimited | Where-Object {$_.RecipientType -eq 'UserMailbox'}) | Get-MailboxAutoReplyConfiguration | Where-Object {$_.AutoReplyState -ne "Disabled"} | Select-Object Identity,AutoReplyState,StartTime,EndTime,ExternalAudience | Format-Table

#Check external senders enabled
Connect-ExchangeOnline -UserPrincipalName 'gary.mcgrath@millbrook.co.nz'
Get-DistributionGroup | Select-Object DisplayName,PrimarySMTPAddress,RequireSenderAuthenticationEnabled
Disconnect-ExchangeOnline -Confirm:$false -InformationAction Ignore -ErrorAction SilentlyContinue