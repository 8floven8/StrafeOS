@echo off
:: NOT TESTED YET

:: CHECK FOR ADMIN PRIVILEGES
dism >nul 2>&1 || (echo This script must be Run as Administrator. && pause && exit /b 1)

IF EXIST "C:\Users\Daniil\AppData\Local\Discord" ( goto DEBLOAT ) 
ELSE (

:: DOWNLOADING DISCORD INSTALLER
powershell -Command "Invoke-WebRequest https://discord.com/api/downloads/distributions/app/installers/latest?channel=stable&platform=win&arch=x86 -OutFile %temp%/discord.exe"

:: INSTALLING DISCORD AND KILLING DISCORD
%temp%/discord.exe -s
taskkill discord.exe /f /t

goto DEBLOAT
)

:: VERSION app-1.0.9002
:DEBLOAT 
cls
taskkill Discord.exe /f /t

echo Debloating useless languages...
move "%userprofile%\AppData\Local\Discord\app-1.0.9002\locales\ru.pak" "%userprofile%\AppData\Local\Discord\app-1.0.9002\ru.pak"
move "%userprofile%\AppData\Local\Discord\app-1.0.9002\locales\en-US.pak" "%userprofile%\AppData\Local\Discord\app-1.0.9002\en-US.pak"

del "%userprofile%\AppData\Local\Discord\app-1.0.9002\locales\*.*" /q

move "%userprofile%\AppData\Local\Discord\app-1.0.9002\ru.pak" "%userprofile%\AppData\Local\Discord\app-1.0.9002\locales\ru.pak" 
move "%userprofile%\AppData\Local\Discord\app-1.0.9002\en-US.pak" "%userprofile%\AppData\Local\Discord\app-1.0.9002\locales\en-US.pak" 
cls

rd "%userprofile%\AppData\Local\Discord\app-1.0.9002\modules\discord_spellcheck-1" /s /q

CHOICE /M "Delete Discord In-Game Overlay? [Y/N]"
IF ERRORLEVEL 1 rd "%userprofile%\AppData\Local\Discord\app-1.0.9002\modules\discord_overlay2-1" /s /q

CHOICE /M "Delete KRISP Voice Enchantments? [Y/N]"
IF ERRORLEVEL 1 rd "%userprofile%\AppData\Local\Discord\app-1.0.9002\modules\discord_krisp-1" /s /q

CHOICE /M "Delete Game Utils (Discord Invites etc.)? [Y/N]"
IF ERRORLEVEL 1 rd "%userprofile%\AppData\Local\Discord\app-1.0.9002\modules\discord_game_utils-1" /s /q

cls

echo Done.
del "%temp%\discord.exe" /q
exit