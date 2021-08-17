@echo off

:: DOWNLOADING POWERPLAN
powershell -Command "Invoke-WebRequest https://github.com/iidanL/StrafeOS/raw/main/Power/Strafe%20PowerPlan.pow -OutFile %temp%/StrafeOS.pow"

:: IMPORTING AND ACTIVATING POWERPLAN
powercfg -import "%temp%/StrafeOS.pow" 1cb49325-2b45-46e6-9feb-66828648df9e
powercfg -setactive "1cb49325-2b45-46e6-9feb-66828648df9e"

:: CLEANING USELESS POWERPLANS
powercfg -delete "8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c"
powercfg -delete "381b4222-f694-41f0-9685-ff5bb260df2e"
powercfg -delete "a1841308-3541-4fab-bc81-f71556f20b4a"

:: DELETING TEMP FILES
del "%temp%\StrafeOS.pow"

exit