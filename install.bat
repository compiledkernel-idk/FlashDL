@echo off
setlocal

echo Installing FlashDL...

:: Define installation directory
set "INSTALL_DIR=%LOCALAPPDATA%\FlashDL"
set "BINARY_NAME=flashdl.exe"

:: Check if binary exists in current directory
if not exist "%BINARY_NAME%" (
    echo Error: %BINARY_NAME% not found in current directory.
    echo Please download the Windows package, extract it, and run this script from the extracted folder.
    pause
    exit /b 1
)

:: Create install directory
if not exist "%INSTALL_DIR%" mkdir "%INSTALL_DIR%"

:: Copy binary
copy /Y "%BINARY_NAME%" "%INSTALL_DIR%\"

:: Add to PATH (User)
echo Adding to PATH...
setx PATH "%PATH%;%INSTALL_DIR%"

echo.
echo Success! FlashDL installed to %INSTALL_DIR%
echo You may need to restart your command prompt for changes to take effect.
pause
