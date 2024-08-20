@echo off
title Enhanced Virus Scan Script
echo ===========================
echo   Enhanced Virus Scan Script
echo ===========================
echo.

:: Menjalankan Pemindaian Cepat
echo Running Quick Scan ...
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 1
echo Quick Scan Done.
echo.

:: Menjalankan Pemindaian Penuh
echo Running Full Scan ...
"%ProgramFiles%\Windows Defender\MpCmdRun.exe" -Scan -ScanType 2
echo Full Scan Done.
echo.

:: Menjalankan Pembersihan File Sementara
echo Cleaning Temporary Files ...
del /q /f /s %TEMP%\*
del /q /f /s %systemroot%\Temp\*
echo Done.
echo.

:: Menghapus Cache DNS
echo Flushing DNS Cache ...
ipconfig /flushdns
echo Done.
echo.

:: Menampilkan Informasi Sistem
echo Displaying System Information ...
systeminfo
echo Done.
echo.

:: Mengunduh dan Menginstal Pembaruan Terbaru
echo Checking and Installing Windows Updates ...
powershell.exe -Command "Install-Module -Name PSWindowsUpdate -Force -Scope CurrentUser; Get-WindowsUpdate -AcceptAll -Install -AutoReboot"
echo Done.
echo.

echo ===========================
echo     Enhanced Virus Scan Complete
echo ===========================
pause
