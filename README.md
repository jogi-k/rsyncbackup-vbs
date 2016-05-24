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

## Installation

Your USB-Stick/Backup-Medium should now look like:  
    Drive -\  
           |   
           |- AutoBackup  
           |   
           |- Install - \  
                        |   
                        | install-rsync-backup.bat  
                    | prepare_vbs_ini.bat  
                    | README.md  
                    | rsyncbackup_part1.vbs  
                    | rsyncbackup_part2.vbs  
                    | rsyncbackup_part3.vbs  
                    | rsyncbackup_target.vbs  
                    | USBDLM_part1.ini  
                    | USBDLM_part2.ini  
                    | AutorunSettings.exe  
					|  
					| - RsyncBackup - \  
					                  | all contents from USBDLM  
						          | all contents from RemoveDrive  
							  | all contents from rsyncbackup, apart the script itself  
									  

Plug the USB-Stick on the Computer you want to install the Backup-Tool.
Double-Click/Call   prepare_vbs_ini.bat
This will detect current settings in system:
- A free drive-letter for future use with the backup-medium, starting at Z:
- The Serial Volume of the backup-medium
- The Users Home-Directory

With these three infromations the prepare-script will generate the 
USBDLM.ini, for the USBDLM-Tool
rsyncbackup.vbs, the main-script.

You should review the two files as there is currently no error-handling in the two batch-scripts...
If you are happy with its contents, you should call
 install-rsync-backup.bat
as Administrator, otherwise it will fail.
This will 
- install everything into one directory named RsysncBackup in the Program-Files directory.
- copy the generated two config-files also into the directory
- Register USBDLM as Service
- Finally call AutorunSettings so that you can disable Autorun for the appropriate drive.

After that, eject the backup-medium and unplug it.

## Usage
Plug in the backup-medium
A Message-Box will ask to start
If you confirm, your data will be backed up. 
  At the end of the backup you will be asked if you want to autremove the disk/memory-stick
  
