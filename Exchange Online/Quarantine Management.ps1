# View Quarantine For Specified Mailbox
Get-QuarantineMessage -PageSize 1000 -RecipientAddress "gary.mcgrath@millbrook.co.nz" | Where-Object {$_.ReleaseStatus -eq "NOTRELEASED"} | Select-Object -Property ReceivedTime,Type,Direction,SenderAddress,Subject,MessageId | Format-Table -AutoSize