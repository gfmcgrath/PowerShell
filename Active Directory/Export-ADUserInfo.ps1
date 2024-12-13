function Export-ADUserInfo {
    <#
    .SYNOPSIS
    Exports AD user information.

    .DESCRIPTION
    Exports Active Directory user fields for the specified user account to a text file. Expands group memberships and direct reports and appends these to the text file. Useful for creating a snapshot of a user before change or deletion in case you wish to refer back.

    .PARAMETER UserName
    Username of the Active Directory user to export information for.

    .PARAMETER OutPath
    Provide file path to where the export file should be created.

    .EXAMPLE
    Get-ADUserInfo -UserName johns -OutPath C:\temp

    .OUTPUTS
    None.

    .NOTES
    Author:     Gary McGrath
    Version:    1.0
    Date:       2024-12-13
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string]$UserName,
        
        [Parameter()]
        [string]$OutPath = "Include your preferred default path here."
    )

    begin {
        # Initialization code
        $todaysDate = Get-Date -Format "yyyy-MM-dd"
        $exportFile = "$OutPath\$todaysDate`_$userName.txt"
    }

    process {
        # Main function code
        Get-ADUser -Identity $userName -Properties * | Out-File $exportFile
        $groupMembership = Get-ADPrincipalGroupMembership $userName | Select-Object Name | Sort-Object Name
        $directReports = Get-AdUser -Identity $userName -Properties * | Select-Object -ExpandProperty directReports
        Add-Content -Path $exportFile -Value $groupMembership
        Add-Content -Path $exportFile -Value $directReports
    }

    end {
        # Final cleanup code (if needed)
    }
}
