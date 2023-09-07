# List Room Mailboxes
Get-Mailbox -ResultSize Unlimited -RecipientTypeDetails RoomMailbox | Select-Object DisplayName,Office,ResourceCapacity | Sort-Object Office | FT

# View all Room Mailboxes Calendar and Regional Settings
Get-Mailbox -ResultSize unlimited -Filter{(RecipientTypeDetails -eq 'RoomMailbox')} | Get-MailboxCalendarConfiguration -WarningAction:SilentlyContinue
Get-Mailbox -ResultSize unlimited -Filter{(RecipientTypeDetails -eq 'RoomMailbox')} | Get-MailboxRegionalConfiguration -WarningAction:SilentlyContinue

# Update Room Mailbox Settings
Set-MailboxCalendarConfiguration -Identity 'mail' -WorkingHoursTimeZone "New Zealand Standard Time"
Set-MailboxRegionalConfiguration -Identity 'mail' -Language en-NZ -DateFormat d/MM/yyyy -TimeFormat 'h:mm tt' -TimeZone 'New Zealand Standard Time'