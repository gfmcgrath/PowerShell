function Set-Shortcut {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        [string]$Target,

        [Parameter(Mandatory=$false)]
        [int]$Link
    )

    begin {
        # Initialization code goes here
    }

    process {
        # Code to process each item goes here
        $targetFile = "$Target"
        $ShortcutFile = "$Link"
        $WScriptShell = New-Object -ComObject WScript.Shell
        $Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
        $Shortcut.TargetPath = $TargetFile
        $Shortcut.Arguments = ""
        $Shortcut.Save()
    }

    end {
        # Cleanup code goes here
    }    
}
