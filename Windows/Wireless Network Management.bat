REM Add a WiFi Profile
	netsh wlan profile add filename="file.xml" user=all

REM Show WiFi Profiles
	netsh wlan show profiles
	
REM Show Interfaces
	netsh wlan show interfaces
	
REM Delete a profile
	netsh wlan delete profile name="profile" interface="interface"
	
REM Export a profile
	netsh wlan export profile name="profile"
	
    REM To keep key in plaintext use key=clear string this will auto connect but PW is visible in the XML