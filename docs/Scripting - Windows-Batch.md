# Windows Batch


> :warning: Not up to date


<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [Script examples](#script-examples)
- [Scripts examples](#scripts-examples)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Script examples

Check [Here](../resources/windows-scripts-examples)

## Scripts examples

```
REM SCRIPT DE LANCEMENT DES LOGICIELS
@echo off

REM FIREFOX
:task0
tasklist | find "Firefox.exe" /C /i > nul 
if NOT ERRORLEVEL 1 goto task1
start %SystemRoot%\explorer.exe "C:\Program Files (x86)\Mozilla Firefox\Firefox.exe"
echo "Lancement Firefox..."

REM PHPStorm
:task1
tasklist | find "PhpStorm64.exe" /C /i > nul 
if NOT ERRORLEVEL 1 goto task2
start %SystemRoot%\explorer.exe "C:\Program Files (x86)\JetBrains\PhpStorm 10.0.3\bin\PhpStorm64.exe"
echo "Lancement PHPStorm..."

REM tasklist | find "netbeans64.exe" /C /i > nul 
REM if NOT ERRORLEVEL 1 goto task2
REM start %SystemRoot%\explorer.exe "C:\Program Files\NetBeans 8.0.1\bin\netbeans64.exe"
REM echo "Lancement Netbeans..."

REM THUNDERBIRD
:task2
tasklist | find "thunderbird.exe" /C /i > nul 
if NOT ERRORLEVEL 1 goto task3
start %SystemRoot%\explorer.exe "C:\Program Files (x86)\Mozilla Thunderbird\thunderbird.exe"
echo "Lancement Thunderbird..."

REM CLOVER
:task3
tasklist | find "clover.exe" /C /i > nul 
if NOT ERRORLEVEL 1 goto task4
start %SystemRoot%\explorer.exe  "C:\Program Files (x86)\Clover\clover.exe"
echo "Lancement Fenetre Clover..."

REM CHROME
:task4
tasklist | find "chrome.exe" /C /i > nul 
if NOT ERRORLEVEL 1 goto task5
start "" "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" --profile-directory="Default"
echo "Lancement Chrome..."

REM SLACK
:task5
tasklist | find "slack.exe" /C /i > nul 
if NOT ERRORLEVEL 1 goto task6
start "" "C:\Users\fdu.PCFX-ACTI-LYON\AppData\Local\slack\Update.exe"  --processStart slack.exe
echo "Lancement Slack..."

REM SPOTIFY
:task6
tasklist | find "spotify.exe" /C /i > nul 
if NOT ERRORLEVEL 1 goto task7
start %SystemRoot%\explorer.exe  "C:\Users\fdu.PCFX-ACTI-LYON\AppData\Roaming\Spotify\spotify.exe"
echo "Lancement Spotify..."

REM WAMPSERVER
:task7
tasklist | find "wampmanager.exe" /C /i > nul 
if NOT ERRORLEVEL 1 goto task8
start %SystemRoot%\explorer.exe  "C:\wamp\wampmanager.exe"
echo "Lancement Wamp server..."

REM EVERNOTE
:task8
tasklist | find "evernote.exe" /C /i > nul 
if NOT ERRORLEVEL 1 goto task9
start %SystemRoot%\explorer.exe  "C:\Program Files (x86)\Evernote\Evernote\Evernote.exe"
echo "Lancement evernote..."

REM AUTRE TACHE
:task9
goto end

REM FIN DE L'EXECUTION : FERMETURE
:end
close
```
