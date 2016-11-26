@echo off
set 1=port#
rem -- open port (first argument passed to batch script)
netsh advfirewall firewall add rule name="Open Port %1" dir=in action=allow protocol=TCP localport=%1
pause > NUL