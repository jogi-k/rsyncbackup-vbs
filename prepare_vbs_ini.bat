@echo off

REM Detect free letter to assign for future to USB-Drive, starting from Z: 
REM derived from and thanks to: http://wiki.uniformserver.com/index.php/Batch_files:_First_Free_Drive
REM after these lines the variable "freedrive" contains the Drive-Number
for %%a in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do CD %%a: 1>> nul 2>&1 & if errorlevel 1 set freedrive=%%a

REM Find Volume of USB-Stick, set it to volserial
for /f "tokens=2 delims= " %%a in ('vol %~d0 ^| Find "Volume"') do ( set volserial=%%a) 

REM Now create new rsyncbackup.vbs from "templates" and current found settings
type rsyncbackup_part1.vbs > rsyncbackup.vbs
echo sourceFolders = Array("%userprofile%") >> rsyncbackup.vbs
type rsyncbackup_part2.vbs >> rsyncbackup.vbs 
echo const DESTINATION="%freedrive%:\AutoBackup" >> rsyncbackup.vbs
echo const USB_DRIVE="%freedrive%:" >> rsyncbackup.vbs
type rsyncbackup_part3.vbs >> rsyncbackup.vbs 

REM Now create new USBDLM.ini from "templates" and current found settings
type USBDLM_part1.ini > USBDLM.ini
echo VolumeSerial=%volserial% >> USBDLM.ini
echo Letter1=%freedrive% >> USBDLM.ini
type USBDLM_part2.ini >> USBDLM.ini
echo VolumeSerial=%volserial% >> USBDLM.ini
echo open="%ProgramFiles%\RsyncBackup\rsyncstart.bat" >> USBDLM.ini
echo.  >> USBDLM.ini

REM Now create the intall-batch from the template and from the found settings
REM Reason for doing it like this: %ProgramFiles% different for normal user and Administrator!
echo set installdir="%ProgramFiles%\RsyncBackup"> install-rsync-backup.bat
type install-rsync-backup.tpl >>  install-rsync-backup.bat


REM Now copy my patched version of rsyncStart.bat over the Heise-Version
copy rsyncStart.bat RsyncBackup\.


echo Generated three files in this folder, please review :
echo. 
echo   USBDLM.INI 
echo   rsyncbackup.vbs 
echo   install-rsync-backup.bat
echo. 
echo Using drive %freedrive%: in future for this USB-Stick, please note down, 
echo you will be requested to enter this letter in the next step
echo Installation will be done into %ProgramFiles%
echo. 
echo After having reviewed the files please install the backup with calling 
echo     install-rsync-backup.bat 
echo as Administrator 
pause


