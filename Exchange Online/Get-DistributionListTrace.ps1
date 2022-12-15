function Get-DistributionListTrace {
    params (
        [string]$StartDate,
        [string]$EndDate
    )

    Connect-ExchangeOnline

    Get-MessageTrace -StartDate $StartDate -EndDate $EndDate -Status Expanded | Group-Object -Property RecipientAddress | Select-Object -Property Name,Count | Sort-Object -Property Name
}