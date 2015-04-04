@echo off
mode con cols=100 lines=25
title LuxRender Slave
echo.
echo Local IP addresses:
for /F "delims=: tokens=1,2" %%a in ('ipconfig') do for /F "tokens=1" %%c in ("%%a") do for /F "delims=v tokens=1,2" %%d in ("%%c") do if "%%d%%e"=="IP4" for /F "delims=. tokens=1-4" %%f in ("%%b") do if not "%%i"=="" echo 			%%f.%%g.%%h.%%i
echo.
echo.
if "%LUXRENDER_ROOT%"=="" set LUXRENDER_ROOT=%CD%
if not exist "%TEMP%\LuxRender" mkdir "%TEMP%\LuxRender"
cd "%TEMP%\LuxRender"
start /b /low cmd.exe /c ""%LUXRENDER_ROOT%\luxconsole.exe"" -s