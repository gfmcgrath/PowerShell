function Write-PSLog {
    <#
    .SYNOPSIS
    Writes conent to a log file to be used as part of PowerShell scripts.

    .DESCRIPTION
    Initializes a log file at the specified directory, and writes content when called in a script. Supports log level paremter for troubleshooting.

    .PARAMETER Message
    The message to be written into the log file.

    .PARAMETER Level
    The level of log message. Supported values are Information, Warning, and Error. If no level is specified then it will default to Information.

    .PARAMETER LogName
    Name of the log directory and file.

    .PARAMETER LogDirectory
    Optionally specify the root log folder. The default is C:\PSLogs.

    .EXAMPLE
    Write-PSLog -Message "This is a message." -Level Information -LogName TestLog

    .OUTPUTS
    None.

    .NOTES
    Author:         Gary McGrath
    Version:        0.1
    Last Updated:   2024-12-10
    #>

    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$Message,

        [ValidateSet("Information", "Warning", "Error")]
        [string]$Level = "Information",                                     # Default if no level proivided                                

        [string]$LogName = "Log",                                           # Default if no name provided

        [string]$LogDirectory = "$($env:SystemDrive)\PSLogs\$LogName"       # Default log path
    )

    begin {
        # Construct the log file path
        $date = (Get-Date -Format "yyyyMMdd")
        $logFilePath = Join-Path $LogDirectory "$date`_$LogName.log"

        # Ensure the log directory exists
        if (-not (Test-Path $LogDirectory)) {
            New-Item -Path $LogDirectory -ItemType Directory -Force | Out-Null
        }

        # Create the log file if it doesn't exist
        if (-not (Test-Path $logFilePath)) {
            New-Item -Path $logFilePath -ItemType File -Force | Out-Null
            $initMessage = "[{0}] [Information] Log file created: $logFilePath" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
            Add-Content -Path $logFilePath -Value $initMessage
            Write-Output $initMessage
        }
    }

    process {
        # Create the log entry
        $timestamp = (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
        $logEntry = "[{0}] [{1}] {2}" -f $timestamp, $Level, $Message

        # Write to console and log file
        Write-Output $logEntry
        Add-Content -Path $logFilePath -Value $logEntry
    }

    end {
        # Final cleanup code (if needed)
    }
}