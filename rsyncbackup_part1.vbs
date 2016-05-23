'......................................................................................
'... rsyncBackup.vbs 1.06p1.................. Autor: Karsten Violka kav@ctmagazin.de ...
'... c't 9/06 .......................................patched by jogi@kuenstner.de..................................
'......................................................................................
'
'--------------------------------------------------------------------------------------
' Bekannte Probleme:
'   -- rsync kopiert keine geöffneten Dateien
'   -- rsync kopiert keine NTFS-Spezialitäten (Junctions, Streams, Sparse Files)

' Skript mit niedriger Priorität starten: 
' 	start /min /belownormal cscript.exe rsyncBackup.vbs
'--------------------------------------------------------------------------------------

Option Explicit
'--------------------------------------------------------------------------------------
'----- Konfiguration ------------------------------------------------------------------
'--------------------------------------------------------------------------------------
Dim sourceFolders
' Quellverzeichnisse
' Wichtig: Geben Sie bei den Quellpfaden keinen abschließenden Backslash an, damit
'   rsync im Backup-Ziel für jede Quelle einen separatenUnterordner erstellt. 
'Beispiel:
'sourceFolders = Array("e:\text", "c:\Dokumente und Einstellungen\Karsten")
