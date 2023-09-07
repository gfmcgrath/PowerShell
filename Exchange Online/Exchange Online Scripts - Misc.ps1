# View all mailboxes that have automatic replies enabled
Connect-ExchangeOnline
(Get-Mailbox -ResultSize unlimited | Where-Object {$_.RecipientType -eq 'UserMailbox'}) | Get-MailboxAutoReplyConfiguration | Where-Object {$_.AutoReplyState -ne "Disabled"} | Select-Object Identity,AutoReplyState,StartTime,EndTime,ExternalAudience | Format-Table

#Check external senders enabled
Connect-ExchangeOnline -UserPrincipalName 'user@domain.com'
Get-DistributionGroup | Select-Object DisplayName,PrimarySMTPAddress,RequireSenderAuthenticationEnabled
Disconnect-ExchangeOnline -Confirm:$false -InformationAction Ignore -ErrorAction SilentlyContinue

# Searches for all mailboxes that have MessageCopy enabled - this is used on Shared Mailboxes to copy sent items from delegates mailbox to the shared mailbox. At QLDC we have GPO that also acheives the same thing, so turning this on in EXO will cause diplicate sent items.
Get-Mailbox -ResultSize Unlimited | Where-Object {($_.MessageCopyForSentAsEnabled -eq $True) -and ($_.MessageCopyForSendOnBehalfEnabled -eq $True)} | Select-Object Name,PrimarySmtpAddress,MessageCopyForSentAsEnabled,MessageCopyForSendOnBehalfEnabled

# Check existence of an address - includes secondary smtp addresses.
Get-Gailbox -ANR user@domain.com