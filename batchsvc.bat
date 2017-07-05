@echo off
if not "%1"=="" goto %1
rem Start batch system services
for /f "usebackq tokens=1-3 skip=4" %%f in (`reg query HKLM\SOFTWARE\batchsvc\system`) do startreg.bat %%f\imagepath
rem Start local service controller
start /b psexec /accepteula -u "NT AUTHORITY\LOCALSERVICE" %0 local >%SYSTEMROOT%\LOGS\psexec-localservice.txt
