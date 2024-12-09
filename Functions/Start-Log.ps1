function Write-Log {
    <#
    .SYNOPSIS
    Initialises a log file that can be written to with use of Write-Log.

    .DESCRIPTION
    Detailed description of what the function does.

    .PARAMETER LogFilePath
    The full path to where the log file should be created.

    .EXAMPLE
    Start-Log -LogFilePath C:\logs\foo.log

    .OUTPUTS
    Type of output returned (if any).

    .NOTES
    Additional information or author notes.
    #>

    [CmdletBinding()]
    param (
        [string]$Message,
        [ValidateSet("Information", "Warning", "Error", "Debug")]
        [string]$Level = "Information",
        [string]$AppName = "application",  # Default if no name provided
        [string]$LogDirectory = "$($env:ProgramData)\Logs"  # Default log path

    )

    begin {
        # Construct the log file path
        $date = (Get-Date -Format "yyyyMMdd")
        $LogFilePath = Join-Path $LogDirectory "$date`_$AppName.log"

        # Ensure the log directory exists
        if (-not (Test-Path $LogDirectory)) {
            New-Item -Path $LogDirectory -ItemType Directory -Force | Out-Null
        }

        # Create the log file if it doesn't exist
        if (-not (Test-Path $LogFilePath)) {
            New-Item -Path $LogFilePath -ItemType File -Force | Out-Null
            $initMessage = "[{0}] [Information] Log file created: $LogFilePath" -f (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
            Add-Content -Path $LogFilePath -Value $initMessage
            Write-Output $initMessage
        }
    }

    process {
        # Create the log entry
        $timestamp = (Get-Date -Format "yyyy-MM-dd HH:mm:ss")
        $logEntry = "[{0}] [{1}] {2}" -f $timestamp, $Level, $Message

        # Write to console and log file
        Write-Output $logEntry
        Add-Content -Path $LogFilePath -Value $logEntry
    }

    end {
        # Final cleanup code (if needed)
    }
}