# Searches for all mailboxes that have MessageCopy enabled - this is used on Shared Mailboxes to copy sent items from delegates mailbox to the shared mailbox. At QLDC we have GPO that also acheives the same thing, so turning this on in EXO will cause diplicate sent items.

Get-Mailbox -ResultSize Unlimited | Where-Object {($_.MessageCopyForSentAsEnabled -eq $True) -and ($_.MessageCopyForSendOnBehalfEnabled -eq $True)} | Select-Object Name,PrimarySmtpAddress,MessageCopyForSentAsEnabled,MessageCopyForSendOnBehalfEnabled


get-mailbox -ANR user@domain