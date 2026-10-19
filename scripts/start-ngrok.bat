@echo off
setlocal enabledelayedexpansion

REM ==============================================================================
REM Ngrok Runner Script (Windows)
REM ==============================================================================

set ENDPOINT_NAME=my-switcher-endpoint

REM 1. Check if argument was passed
if not "%~1"=="" (
    set ENDPOINT_NAME=%~1
) else (
    REM 2. Read from .env if present
    if exist "%~dp0..\.env" (
        for /f "tokens=1,2 delims==" %%A in ('type "%~dp0..\.env"') do (
            if "%%A"=="NGROK_ENDPOINT_NAME" set ENDPOINT_NAME=%%B
        )
    )
)

echo ==============================================================================
echo Starting Ngrok endpoint: !ENDPOINT_NAME!
echo ==============================================================================

where ngrok >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] 'ngrok' command was not found in your system PATH.
    echo Please make sure Ngrok is installed and added to PATH,
    echo or specify the full path to your ngrok.exe executable.
    pause
    exit /b 1
)

ngrok start !ENDPOINT_NAME!

pause
