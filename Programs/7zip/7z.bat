@echo off

:: DOWNLOADING 7ZIP INSTALLER
powershell -Command "Invoke-WebRequest https://www.7-zip.org/a/7z1900-x64.exe -OutFile %temp%/7z.exe"

:: INSTALLING 7ZIP
start /wait %temp%/7z.exe /S

:: DOWNLOADING 7ZIP REG 
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/iidanL/StrafeOS/main/Programs/7zip/7z.reg -OutFile %temp%/7z.reg"

:: APPLYING 7ZIP REG
regedit.exe /S %temp%/7z.reg

:: DELETING TEMP FILES
del "%temp%/7z.exe" /q
del "%temp%/7z.reg" /q

exit