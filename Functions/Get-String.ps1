# Get-String
# v 1.0
# Gary McGrath

# Extracts a string from a text file based on a known text string that preceeds the value you wish to extract.
# Developed with the aid of ChatGPT, a large language model trained by OpenAI, based on the GPT-3.5 architecture.

# Define a function that extracts the corresponding string from a text file
function Get-String {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true)]
        [string]$TextFilePath,
        [Parameter(Mandatory = $true)]
        [string]$KnownTextString
    )
    
    # Read the text file
    $textFile = Get-Content $TextFilePath

    # Loop through each line of the text file
    for ($i = 0; $i -lt $textFile.Length; $i++) {
        $line = $textFile[$i]
        # Check if the known text string exists in the line
        if ($line.Contains($KnownTextString)) {
            # If it does, extract the corresponding string
            $j = $i + 1
            $extractedString = ""
            while ($j -lt $textFile.Length -and (-not $textFile[$j].Contains($KnownTextString))) {
                $extractedString += $textFile[$j].Trim() + " "
                $j++
            }
            $extractedString = $extractedString.TrimEnd()
            # Output the extracted string
            Write-Host "Extracted string: $extractedString"
        }
    }
}
