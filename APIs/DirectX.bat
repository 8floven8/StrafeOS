@echo off


powershell -Command "Invoke-WebRequest https://download.microsoft.com/download/1/7/1/1718CCC4-6315-4D8E-9543-8E28A4E18C4C/dxwebsetup.exe -OutFile %temp%/dx.exe"

%temp%\dx.exe /q

exit