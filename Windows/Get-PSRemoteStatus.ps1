function Get-PSRemoteStatus {

<#
    .SYNOPSIS
        Returns the ability for the list of computers to accept remote PowerShell connections.
    
    .DESCRIPTION
        Get-PSRemoteStatus checks against a user supplied list of computers to see if they are online and capable of accepting remote PowerShell connections. This is done by checking whether the WinRM service is enabled on the endpoint, and whether the endpoint succesfully executes a remote command. This is useful to see machines in which PowerShell remoting is enabled.
    
    .PARAMETER Name
        The DNS name of the remote computer(s) to check the status of the WinRM services on.
    
    .EXAMPLE
         Get-WinRMStatus -Name 'Server1', 'Server2'
    
    .INPUTS
        String
    
    .OUTPUTS
        PSCustomObject
    
    .NOTES
        Author:  Gary McGrath
#>
    
    [CmdletBinding()]
        param (
            [Parameter(Mandatory,ValueFromPipelineByPropertyName)]
            [string[]]$Name
        )
        
    process {
    
         $Name | ForEach-Object -ThrottleLimit 5 -Parallel {
            $testC = Test-Connection -ComputerName $_ -Count 1 -ErrorAction SilentlyContinue -Quiet
    
            If (!($testC)) {
                $connectionStatus = 'Offline'
            }

            Else {                   
                $connectionStatus = 'Online'
                $winrmStatus = [bool](Test-WSMan -ComputerName $_ -ErrorAction SilentlyContinue)
                $psremoteStatus = Invoke-Command -ComputerName $_ {1} -ErrorAction SilentlyContinue                   
            }
            
            [PSCustomObject]@{
                'Computer Name'          =   $_             
                'Connection Status'     =   $connectionStatus
                'WinRM Service State'   =   If ($winrmStatus -eq "True") {"Enabled"}
                'PS Remote Check'       =   If ($psremoteStatus -eq "1") {"Pass"}
            }           

        } #ForEach Loop

    } #Process Block

} #Function