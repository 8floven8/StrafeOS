@echo off
setlocal

:: Downloading AIO

echo Downloading...
powershell -Command "Invoke-WebRequest https://de1-dl.techpowerup.com/files/xsvhQ67-hZSPLZ5RkMyZAg/1629232117/Visual-C-Runtimes-All-in-One-Jul-2021.zip -OutFile %temp%/C++.zip"
cls
cd /d %~dp0
Call :UnZipFile "%temp%\c++\" "%temp%\C++.zip"

start /wait %temp%\c++\install_all.bat /b
exit 



:UnZipFile <ExtractTo> <newzipfile>
set vbs="%temp%\_.vbs"
if exist %vbs% del /f /q %vbs%
>%vbs%  echo Set fso = CreateObject("Scripting.FileSystemObject")
>>%vbs% echo If NOT fso.FolderExists(%1) Then
>>%vbs% echo fso.CreateFolder(%1)
>>%vbs% echo End If
>>%vbs% echo set objShell = CreateObject("Shell.Application")
>>%vbs% echo set FilesInZip=objShell.NameSpace(%2).items
>>%vbs% echo objShell.NameSpace(%1).CopyHere(FilesInZip)
>>%vbs% echo Set fso = Nothing
>>%vbs% echo Set objShell = Nothing
cscript //nologo %vbs%
if exist %vbs% del /f /q %vbs%