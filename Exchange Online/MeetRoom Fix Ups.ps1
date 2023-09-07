$roomList = Import-Csv -Path '.\meet.csv'

foreach ($i in $roomList) {Get-Mailbox -Identity $i | Select-Object DisplayName,UserPrincipalName}



Get-Mailbox -ResultSize unlimited -Filter{(RecipientTypeDetails -eq 'RoomMailbox')} | Get-MailboxCalendarConfiguration -WarningAction:SilentlyContinue
Get-Mailbox -ResultSize unlimited -Filter{(RecipientTypeDetails -eq 'RoomMailbox')} | Get-MailboxRegionalConfiguration -WarningAction:SilentlyContinue


Set-MailboxCalendarConfiguration -Identity 'mail' -WorkingHoursTimeZone "New Zealand Standard Time"

Set-MailboxRegionalConfiguration -Identity 'mail' -Language en-NZ -DateFormat d/MM/yyyy -TimeFormat 'h:mm tt' -TimeZone 'New Zealand Standard Time'