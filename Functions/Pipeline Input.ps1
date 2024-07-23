Function Get-Something {

    [CmdletBinding()]

    Param(
        [Parameter(ValueFromPipelineByPropertyName)]$Name
    )

    process {    
        Write-Host "You passed the parameter $item into the function"
    }
}
