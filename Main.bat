@ECHO OFF
:Menu
CLS
ECHO 1.Desliga o firewall
ECHO 2.Liga o firewall
ECHO 3.Encerra
ECHO.

CHOICE /C 123 /M "Oq vc deseja fazer?:"

:: Note - list ERRORLEVELS in decreasing order
IF ERRORLEVEL 3 GOTO Encerra
IF ERRORLEVEL 2 GOTO LG
IF ERRORLEVEL 1 GOTO DLG

:DLG
CLS
ECHO Desliga o firewall
netsh advfirewall set allprofiles state off
wmic path win32_networkadapter where NetConnectionID="Ethernet" call disable
GOTO Menu

:LG
CLS
ECHO Liga o firewall
netsh advfirewall set allprofiles state on
wmic path win32_networkadapter where NetConnectionID="Ethernet" call enable
GOTO Menu

:Encerra
CLS
ECHO Desligando..

:End