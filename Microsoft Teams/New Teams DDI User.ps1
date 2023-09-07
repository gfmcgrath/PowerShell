$UPN='user@domain.com'
$tel='+64xxxxxxxx'

Connect-MicrosoftTeams

Set-CsPhoneNumberAssignment -Identity $UPN -PhoneNumber $tel -PhoneNumberType DirectRouting
Get-CsOnlineUser -identity $UPN | Grant-CsTenantDialPlan -PolicyName 'PolicyName'
Get-CsOnlineUser -identity $UPN | Grant-CsOnlineVoiceRoutingPolicy -PolicyName 'PolicyName'
# Get-CsOnlineUser -identity $UPN | Grant-CsTeamsCallingPolicy -PolicyName "AllowCalling"
Grant-CsTeamsCallingPolicy -Identity $UPN -PolicyName "AllowCalling"