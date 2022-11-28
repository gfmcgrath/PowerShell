# Shows the distribution groups that a particular user belongs to.

Connect-ExchangeOnline

Get-DistributionGroup | Where-Object { (Get-DistributionGroupMember $_.Name | ForEach-Object {$_.PrimarySmtpAddress}) -contains "f&bsupervisordstgrp@millbrook.co.nz"}