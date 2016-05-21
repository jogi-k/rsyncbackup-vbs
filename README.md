# rsyncbackup-vbs
An improved version of the rsyncbackup.vbs from heise.de

The idea of this modified version is to have a USB-Drive or a USB-Stick which is the Backup-Medium.
The backup will start automatically on plugin in of the Drive/Stick.
Therefore instead of having the backup-media connected all the time and doing the backups via scheduler this tool-set needs some USB-plug 
detection. For that purpose I have choosen some of the wonderful tools of Uwe Sieber: http://www.uwe-sieber.de 

I am using this mainly to ease the backup at the PCs which I am administrating (Parents, Parents-in-law etc) I usually work like this:
- buy a fitting backup-medium (e.g. as birthday-present)
- prepare the backup-medium at home, 
- copy all the necessary tools onto a folder on the backup-medium 
- visit then the "patient" with the prepared backup-medium
- install there the tooling from the prepared backup-medium 

## Preconditions

I will - at some later point in time - include the preconditions into the installation, but as of today it is a pure documentation...

- Format the Medium with NTFS (that is essential, as it provides the necessary hard-links)
- Create a folder "AutoBackup" on the Backup-Medium
- Create a folder "Install" on the Backup-Medium
- Create a folder "RsyncBackup" as subfolder in the Install-Folder


- Get and unzip the "rsyncBackup.vbs 1.06" from the heise.de -site into the "RsyncBackup"-Subfolder
- Get and unzip "RemoveDrive" from Uwe Siebers Homepage : http://www.uwe-sieber.de/files/removedrive.zip into the "RsyncBackup"-Subfolder
- Get and unzip "USBDLM" from Uwe Siebers Homepage : http://www.uwe-sieber.de/files/usbdlm.zip "RsyncBackup"-Subfolder
- Get and unzip "AutoRun Settings" from Uwe Siebers Homepage : http://www.uwe-sieber.de/files/autorunsettings.zip into the "Install"-Folder

Download the files from this repository into the "Install"-Folder.
As the VBS-Script rsyncbackup.vbs from here will replace the one from the heise.de-Site during the installation you should delete the 
heise-de-Version inside "RsyncBackup"-Subfolder.

As I am going to do my necessary modifications here, you can see the diff between the original Heise-Version 1.06 and my changes.


