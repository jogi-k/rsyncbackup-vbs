REM Create Program-Directory
mkdir "%ProgramFiles%\RsyncBackup"

REM copy all necessary files from prepared directory to C:
copy %~dp0\RsyncBackup\*.* "%ProgramFiles%\RsyncBackup\."

REM copy created  USBDLM.INI-File
copy %~dp0\USBDLM.ini "%ProgramFiles%\RsyncBackup\."

REM register USBDLM as service
call "%ProgramFiles%\RsyncBackup\_service_register.cmd"

REM copy just created vbs to its new home 
copy %~dp0\rsyncbackup.vbs "%ProgramFiles%\RsyncBackup\."

REM extend the path for the new tool
setx path "%path%;%ProgramFiles%\RsyncBackup"

REM No Autorun for Drive X
pause "Please in the next step (After Press Enter) disable Autorun for Drive X: "
%~dp0\AutoRunSettings.exe

Pause "Installation done, please eject the USB-Stick, unplug it and replug it. First Backup should start"
