@echo off
title System Maintenance Script
echo ===========================
echo   System Maintenance Script
echo ===========================
echo.

:: Membersihkan File Temporary
echo Cleaning Temporary Files ...
del /q /f /s "%TEMP%\*"
del /q /f /s "%systemroot%\Temp\*"
echo Done.
echo.

:: Membersihkan Prefetch
echo Cleaning Prefetch Files ...
del /q /f /s "%systemroot%\Prefetch\*"
echo Done.
echo.

:: Menghapus Log Windows Error Reporting
echo Cleaning Windows Error Reporting Logs ...
del /q /f /s "%LOCALAPPDATA%\Microsoft\Windows\WER\ReportQueue\*"
del /q /f /s "%LOCALAPPDATA%\Microsoft\Windows\WER\ReportArchive\*"
echo Done.
echo.

:: Membersihkan Cache Browser (Microsoft Edge)
echo Cleaning Microsoft Edge Cache ...
rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache"
echo Done.
echo.

:: Membersihkan Cache Windows Store
echo Cleaning Windows Store Cache ...
wsreset.exe
echo Done.
echo.

:: Membersihkan Cache Font
echo Cleaning Font Cache ...
net stop fontcache
del /q /f /s "%systemroot%\ServiceProfiles\LocalService\AppData\Local\FontCache\*"
net start fontcache
echo Done.
echo.

:: Menghapus File Update Windows Sebelumnya
echo Deleting Previous Windows Update Files ...
dism /online /cleanup-image /startcomponentcleanup
echo Done.
echo.

:: Membersihkan Disk Menggunakan Disk Cleanup (dengan antarmuka manual)
echo Running Disk Cleanup ...
cleanmgr
echo Done.
echo.

:: Menghapus Cache DNS
echo Flushing DNS Cache ...
ipconfig /flushdns
echo Done.
echo.

:: Memeriksa Koneksi Jaringan
echo Displaying Network Configuration ...
ipconfig /all
echo Done.
echo.

:: Menampilkan Informasi Sistem
echo Displaying System Information ...
systeminfo
echo Done.
echo.

:: Menampilkan Daftar Proses yang Sedang Berjalan
echo Displaying Running Processes ...
tasklist
echo Done.
echo.

:: Menampilkan Informasi Waktu Booting
echo Displaying Boot Time ...
systeminfo | findstr /C:"Boot Time"
echo Done.
echo.

:: Memperbaiki File Sistem
echo Scanning and Repairing System Files ...
sfc /scannow
echo Done.
echo.

:: Memeriksa dan Memperbaiki Image Sistem
echo Checking and Repairing System Image ...
dism /online /cleanup-image /restorehealth
echo Done.
echo.

:: Memeriksa dan Memperbaiki Disk C:
echo Checking and Repairing Disk C: ...
chkdsk C: /scan
echo Done.
echo.

:: Defragmentasi Drive C:
echo Defragmenting Drive C: ...
defrag C:
echo Done.
echo.

:: Mengoptimalkan Registry
echo Optimizing Windows Registry ...
regedit /e "%USERPROFILE%\Desktop\backup.reg"
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /f
echo Done.
echo.

echo ===========================
echo     Maintenance Complete
echo ===========================
shutdown /r /t 0
