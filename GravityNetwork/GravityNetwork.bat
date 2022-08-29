:: Resources-
:: https://www.howtogeek.com/103190/change-your-ip-address-from-the-command-prompt/
:: https://www.tutorialspoint.com/batch_script/index.htm
:: https://github.com/naveenb2004/HotspotMaker

@Echo off
goto VARGET

:: ============================================================================================

:VARGET
:: Window and buffer size
powershell -command "&{$w=(get-host).ui.rawui;$w.buffersize=@{width=80;height=500};$w.windowsize=@{width=80;height=35};}"
:: window title
title Gravity Explore 2022
:: font color
color 0A
:: set decorations
SET VARGET5= ##### ##### ##### #   # ##### ##### #   #      # ##### #####
SET VARGET4= #     #   # #   # #   #   #     #   #   #            #     #
SET VARGET3= #  ## ##### ##### #   #   #     #    # #   ##    ##### #####
SET VARGET2= #   # #  #  #   #  # #    #     #     #          #     #
SET VARGET1= ##### #   # #   #   #   #####   #     #          ##### #####
:: for STARTSCAN tab
set dirset=HOME
goto STARTSCAN

:: ============================================================================================

:STARTSCAN
echo Scanning hosted network status...
echo.
:: this is the ip that should be set to hosted network
:: if hosted network started but ip is not set,
:: returen value will 'FALSE' (errorlevel 1)
:: if there is no problem, errorlevel must be 0
ping 192.168.8.100
If %ERRORLEVEL%==0 (set onoff=True) else (set onoff=False)
goto %dirset%

:: ============================================================================================

:HOME
cls
echo.
echo %VARGET5%&echo %VARGET4%&echo %VARGET3%&echo %VARGET2%&echo %VARGET1%
echo.
:: tab title
echo [ Gravity Exploration Camp 2022 - Wireless Network Setup Wizard ]
echo.
:: hosted network status print
echo =====================================
echo Hosted network running status : %onoff%
echo =====================================
echo.
echo.
:: simple validation for fast users
if %onoff%==True (echo A. Stop Network) else (echo A. Start Network)
echo B. Status
echo C. Details
echo D. Exit
echo.
set/p "homecho=>"
if %homecho%==A goto STARTSTOP
if %homecho%==a goto STARTSTOP
if %homecho%==B goto NETSTATUS
if %homecho%==b goto NETSTATUS
if %homecho%==C goto DETAILS
if %homecho%==c goto DETAILS
if %homecho%==D goto EXIT
if %homecho%==d goto EXIT
echo invalid choice... Try again...
%timeout% 5
goto HOME

:: ============================================================================================

:STARTSTOP
cls
echo.
echo %VARGET5%&echo %VARGET4%&echo %VARGET3%&echo %VARGET2%&echo %VARGET1%
echo.
echo [ Network Start and Stop ]
echo.
:: simple validations for tab calling
if %onoff%==True (goto NETOFF) else (goto NETON)

:: ============================================================================================

:NETON
echo Starting process...
echo Setting ssid and password...
echo Generating password...
:: password will auto generate
:: for network and database protection
set psw=%random%%random%
:: host the network
netsh wlan set hosted network mode=allow ssid=GravityExplore key=%psw%
echo.
echo Starting hosted network...
netsh wlan start hostednetwork
echo Setting IP address...
:: for IPSETUP validations
set areano=0
goto IPSETUP

:: ============================================================================================

:IPSETUP
:: this will repeat
:: because the Local Area Connection* () is a defalt for each computer
:: this will validate it and set ip and subnet mask
netsh interface ipv4 set address name="Local Area Connection* %areano%" static 192.168.10.100 255.255.255.0
If not %ERRORLEVEL%==0 (
   set/a areano=%areano%+1
   goto IPSETUP
) else (goto IPSETOK)

:: ============================================================================================

:IPSETOK
echo Success!
echo.
echo.
:: print ssid psw and host ip set
echo ==================================================
echo SSID - GravityExplore
echo Password - %psw%
echo Host IP - 192.168.10.100
echo ==================================================
echo.
echo.
echo A. Back
echo B. Exit
echo.
set/p "netoncho=>"
if %netoncho%==A goto HOME
if %netoncho%==a goto HOME
if %netoncho%==B goto EXIT
if %netoncho%==b goto EXIT
echo invalid choice... Try again...
%timeout% 5
goto HOME

:: ============================================================================================

:NETOFF
echo Starting process...
echo Re-setting IP to defaults...
echo (this may take a while)
:: reset ip address for defaults
:: this is a optional method
:: but we manually set a ip
:: so this will reset it to defalt values
:: and this will reset all network interfaces and renew
ipconfig /release
ipconfig /renew
echo Success!
echo Stopping hosted network...
netsh wlan stop hostednetwork
echo Success!
echo.
echo A. Back
echo B. Exit
echo.
set/p "netoffcho=>"
if %netoffcho%==A goto HOME
if %netoffcho%==a goto HOME
if %netoffcho%==B goto EXIT
if %netoffcho%==b goto EXIT
echo invalid choice... Try again...
%timeout% 5
goto HOME

:: ============================================================================================

:NETSTATUS
cls
echo.
echo %VARGET5%&echo %VARGET4%&echo %VARGET3%&echo %VARGET2%&echo %VARGET1%
echo.
echo [ Network Status ]
echo.
:: for STARTSCAN validations
set dirset=NETSTATUSRE
goto STARTSCAN

:: ============================================================================================

:NETSTATUSRE
echo.
:: network status print
echo ============================
echo Network Alive Status : %onoff%
echo ============================
echo.
echo A. Refresh
echo B. Back
echo C. Exit
echo.
set/p "netstatuscho=>"
if %netstatuscho%==A goto NETSTATUS
if %netstatuscho%==a goto NETSTATUS
if %netstatuscho%==B goto HOME
if %netstatuscho%==b goto HOME
if %netstatuscho%==C goto EXIT
if %netstatuscho%==c goto EXIT
echo invalid choice... Try again...
%timeout% 5
goto HOME

:: ============================================================================================

:DETAILS
cls
echo.
echo %VARGET5%&echo %VARGET4%&echo %VARGET3%&echo %VARGET2%&echo %VARGET1%
echo.
echo [ Details ]
echo.
:: heh!
echo ================================================
echo  Powered By:
echo     - Astronomical Society of CCBC
echo     - "Gravity" Tech Team
echo     - naveenb2004
echo ================================================
echo.
echo.
:: host pc name
echo Working on : %hostname%
echo.
:: network status for all interfaces
netsh interface ipv4 show config
:: network status for hosted network
netsh wlan show hostednetwork
netsh wlan show hostednetwork setting=security
:: ipconfiguration for all network interfaces
ipconfig /all
echo.
echo A. Back
echo B. Exit
echo.
set/p "netstatuscho=>"
if %netstatuscho%==A goto HOME
if %netstatuscho%==a goto HOME
if %netstatuscho%==B goto EXIT
if %netstatuscho%==b goto EXIT
echo invalid choice... Try again...
%timeout% 5
goto HOME

:: ============================================================================================

:EXIT
exit

:: ============================================================================================