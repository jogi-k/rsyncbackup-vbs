'......................................................................................
'... rsyncBackup.vbs 1.06p1.................. Autor: Karsten Violka kav@ctmagazin.de ...
'... c't 9/06 .......................................patched by jogi@kuenstner.de..................................
'......................................................................................
'
'--------------------------------------------------------------------------------------
' Bekannte Probleme:
'   -- rsync kopiert keine ge�ffneten Dateien
'   -- rsync kopiert keine NTFS-Spezialit�ten (Junctions, Streams, Sparse Files)

' Skript mit niedriger Priorit�t starten: 
' 	start /min /belownormal cscript.exe rsyncBackup.vbs
'--------------------------------------------------------------------------------------

Option Explicit
'--------------------------------------------------------------------------------------
'----- Konfiguration ------------------------------------------------------------------
'--------------------------------------------------------------------------------------
Dim sourceFolders
' Quellverzeichnisse
' Wichtig: Geben Sie bei den Quellpfaden keinen abschlie�enden Backslash an, damit
'   rsync im Backup-Ziel f�r jede Quelle einen separatenUnterordner erstellt. 
'Beispiel:
'sourceFolders = Array("e:\text", "c:\Dokumente und Einstellungen\Karsten")
