function My-FunctionName {
    <#
    .SYNOPSIS
    Brief description of what the function does.

    .DESCRIPTION
    Detailed description of what the function does.

    .PARAMETER ParameterName
    Description of the parameter.

    .EXAMPLE
    Example of how to use the function.

    .OUTPUTS
    Type of output returned (if any).

    .NOTES
    Additional information or author notes.
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string]$ParameterName
    )

    begin {
        # Initialization code
    }

    process {
        # Main function code
    }

    end {
        # Final cleanup code (if needed)
    }
}