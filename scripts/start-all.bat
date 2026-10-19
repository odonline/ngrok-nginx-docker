@echo off
setlocal

REM ==============================================================================
REM Quick Start Script: Docker Compose + Ngrok (Windows)
REM ==============================================================================

cd /d "%~dp0.."

echo [1/2] Starting Nginx Switcher container via Docker Compose...
docker compose up -d

if %errorlevel% neq 0 (
    echo [ERROR] Failed to start Docker container. Please check if Docker is running.
    pause
    exit /b %errorlevel%
)

echo.
echo [2/2] Launching Ngrok tunnel in a new terminal window...
start "Ngrok Switcher Tunnel" cmd /c "%~dp0start-ngrok.bat"

echo.
echo ==============================================================================
echo Switcher environment started!
echo Check the opened Ngrok window for your active public URLs.
echo Docker container is running in the background. Run 'docker compose down' to stop.
echo ==============================================================================
pause
