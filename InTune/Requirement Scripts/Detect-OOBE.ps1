# https://oofhours.com/2023/09/15/detecting-when-you-are-in-oobe/

# Detects if you are currently running in OOBE, useful as a requirement script in Intune application deployments where you may want the app to install only during Autopilot, or only if not in Autopilot.

$TypeDef = @" 
using System;
using System.Text;
using System.Collections.Generic;
using System.Runtime.InteropServices;
 
namespace Api
{
 public class Kernel32
 {
   [DllImport("kernel32.dll", CharSet = CharSet.Auto, SetLastError = true)]
   public static extern int OOBEComplete(ref int bIsOOBEComplete);
 }
}
"@
 
Add-Type -TypeDefinition $TypeDef -Language CSharp
 
$IsOOBEComplete = $false
$hr = [Api.Kernel32]::OOBEComplete([ref] $IsOOBEComplete)
 
#$IsOOBEComplete

if ($IsOOBEComplete -eq 1) {
    return $true
}
else {
   return $false
}
