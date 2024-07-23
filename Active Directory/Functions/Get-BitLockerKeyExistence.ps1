# Get-BitLockerKeyExistence
# v1.0
# 2024-07-23
# Gary McGrath
# A.I Assisted
# Queries Active Directory for a text file supplied list of computers and verifies if a Bitlocker key value has been stored in Active Directory.

# Import the required module
Import-Module ActiveDirectory

function Get-BitlockerKeyExistence {
    param (
        [Parameter(Mandatory=$true)]
        [string]$FilePath
    )

    # Define an array to hold the results
    $results = @()

    # Read the computer names from a text file
    $computerNames = Get-Content -Path $FilePath

    foreach ($computerName in $computerNames) {
        try {
            # Get the computer object in AD
            $computer = Get-ADComputer -Identity $computerName -ErrorAction Stop

            # Get the BitLocker Recovery Key
            $bitlockerKey = Get-ADObject -Filter {ObjectClass -eq 'msFVE-RecoveryInformation'} -SearchBase $computer.DistinguishedName -Properties 'msFVE-RecoveryPassword' -ErrorAction Stop

            # Create a custom object for the result
            $result = New-Object PSObject
            $result | Add-Member -MemberType NoteProperty -Name "ComputerName" -Value $computer.Name

            # Check if the BitLocker Key exists and add the result to the custom object
            if ($bitlockerKey) {
                $result | Add-Member -MemberType NoteProperty -Name "BitLockerKeyBackedUp" -Value $true
            } else {
                $result | Add-Member -MemberType NoteProperty -Name "BitLockerKeyBackedUp" -Value $false
            }

            # Add the result to the results array
            $results += $result
        }
        catch {
            Write-Host "Error occurred while processing: $computerName $_"
        }
    }

    # Output the results in a table format
    $results | Format-Table
}
