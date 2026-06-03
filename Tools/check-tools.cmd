@echo off
rem project: EduManager 2026
rem created: 2026-06-03 (Data)
rem changed: 2026-06-03 (Data)

setlocal
set "POWERSHELL=%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe"

"%POWERSHELL%" -NoProfile -ExecutionPolicy Bypass -File "%~dp0check-tools.ps1" %*
exit /b %ERRORLEVEL%
