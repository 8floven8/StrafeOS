@echo off

:: DOWNLOADING REQUIRED FILES (INSTALLER, XML ,SKIN)

powershell -Command "Invoke-WebRequest https://github.com/Open-Shell/Open-Shell-Menu/releases/download/v4.4.160/OpenShellSetup_4_4_160.exe -OutFile %temp%/openshell.exe"
powershell -Command "Invoke-WebRequest https://raw.githubusercontent.com/iidanL/StrafeOS/main/Programs/OpenShell/Menu_Settings.xml -OutFile %temp%/openshell.xml"
powershell -Command "Invoke-WebRequest https://github.com/iidanL/StrafeOS/raw/main/Programs/OpenShell/Dark.skin7 -OutFile %temp%/dark.skin7"

:: INSTALLING OPENSHELL
%temp%/openshell.exe /qn ADDLOCAL=StartMenu 

:: MOVING SKIN
move "%temp%/dark.skin7" "C:\Program Files\Open-Shell\Skins\dark.skin7"

:: APPLYING XML
"C:\Program Files\Open-Shell\startmenu.exe" -xml %temp%/openshell.xml

:: DELETING TEMP FILES
del "%temp%/openshell.exe"
del "%temp%/openshell.xml"

exit