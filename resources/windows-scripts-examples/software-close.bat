REM SCRIPT TO CLOSE UNUSEFUL APPS
@echo off

REM Amazon Drive
tasklist | find "AmazonDrive.exe" /C /i > nul
if NOT ERRORLEVEL 1 taskkill /IM AmazonDrive.exe /F

REM Google Drive
tasklist | find "googledrivesync.exe" /C /i > nul 
if NOT ERRORLEVEL 1 taskkill /IM googledrivesync.exe /F

REM Mega
tasklist | find "MEGAsync.exe" /C /i > nul 
if NOT ERRORLEVEL 1 taskkill /IM MEGAsync.exe /F

REM Evernote
tasklist | find "Evernote.exe" /C /i > nul 
if NOT ERRORLEVEL 1 taskkill /IM Evernote.exe /F