REM SCRIPT DE LANCEMENT DES LOGICIELS
@echo off

REM Amazon Drive
:task0
tasklist | find "AmazonDrive.exe" /C /i > nul 
if NOT ERRORLEVEL 1 goto task1
start %SystemRoot%\explorer.exe  "C:\Users\{Username}\AppData\Local\Amazon Drive\AmazonDrive.exe
echo "Lancement Fenetre AmazonDrive..."

REM Google Drive
:task1
tasklist | find "googledrivesync.exe" /C /i > nul 
if NOT ERRORLEVEL 1 goto task2
start %SystemRoot%\explorer.exe  "C:\Program Files (x86)\Google\Drive\googledrivesync.exe"
echo "Lancement Fenetre googledrivesync..."

REM Mega
:task2
tasklist | find "MEGAsync.exe" /C /i > nul 
if NOT ERRORLEVEL 1 goto task3
start %SystemRoot%\explorer.exe  "C:\ProgramData\MEGAsync\MEGAsync.exe"
echo "Lancement Fenetre MEGAsync..."


REM AUTRE TACHE
:task3
goto end

REM FIN DE L'EXECUTION : FERMETURE
:end
close
