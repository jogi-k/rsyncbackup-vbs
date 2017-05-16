REM Create Program-Directory
mkdir %installdir%

REM copy all necessary files from prepared directory to C:
copy %~dp0\RsyncBackup\*.* %installdir%\.

REM copy created  USBDLM.INI-File
copy %~dp0\USBDLM.ini %installdir%\.

REM register USBDLM as service
call %installdir%\_service_register.cmd

REM copy just created vbs to its new home 
copy %~dp0\rsyncbackup.vbs %installdir%\.

REM extend the path for the new tool
setx path "%path%;%installdir%

REM No Autorun for Drive XXXX
pause "Please in the next step (After Press Enter) disable Autorun for the Drive-Letter which you noted down in the previous step"
%~dp0\AutoRunSettings.exe

Pause "Installation done, please eject the USB-Stick, unplug it and replug it. First Backup should start"
