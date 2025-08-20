@echo off
:: ==============================================
:: IT Support Toolkit Script - Windows
:: Author: Your Name
:: ==============================================
echo IT Support Toolkit - Windows
echo ==============================================
echo.

:: Step 1 - Show system information
echo Collecting system information...
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type" > report.txt
echo ------------------------------------------ >> report.txt
echo Network Information: >> report.txt
ipconfig >> report.txt
echo System information saved to report.txt
echo.

:: Step 2 - Clean temporary files
echo Cleaning Temporary Files...
del /q /f /s %TEMP%\* >nul 2>&1
echo Temp files cleaned! >> report.txt
echo Temp files cleaned successfully.
echo.

:: Step 3 - Show disk space
echo Disk Space Report: >> report.txt
wmic logicaldisk get size,freespace,caption >> report.txt
echo Disk space report added to report.txt
echo.

:: Step 4 - Check internet connectivity
echo Checking internet connection...
ping -n 2 8.8.8.8 >nul
if %errorlevel%==0 (
    echo Internet is working ✅ >> report.txt
    echo Internet is working ✅
) else (
    echo Internet is NOT working ❌ >> report.txt
    echo Internet is NOT working ❌
)
echo.

:: Step 5 - Flush DNS cache
echo Flushing DNS cache...
ipconfig /flushdns >nul
echo DNS cache flushed. >> report.txt
echo.

:: Step 6 - Check Windows services (example: Windows Update)
echo Checking Windows Update service status...
sc query wuauserv | findstr STATE >> report.txt
echo Windows Update service status saved to report.txt
echo.

:: Final Step
echo ==============================================
echo All tasks completed! Full report saved as report.txt
echo.
echo Press any key to exit...
pause >nul
