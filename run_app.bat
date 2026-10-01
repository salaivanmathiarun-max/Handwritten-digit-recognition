@echo off
title MNIST VGG-16 Transfer Learning Studio
color 0B

echo ===============================================================================
echo                MNIST VGG-16 TRANSFER LEARNING STUDIO
echo ===============================================================================
echo [1/3] Verifying Python Environment...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Python was not found in your system PATH!
    echo Please install Python 3.10+ and make sure to check "Add Python to PATH".
    pause
    exit /b 1
)

echo [2/3] Checking and installing required packages...
python -m pip install -r backend\requirements.txt --quiet --disable-pip-version-check
if %errorlevel% neq 0 (
    echo [WARNING] Pip encountered a warning or non-zero status. Proceeding to launch...
)

echo [3/3] Starting Backend Server and Web Interface...
echo.
echo Server running at: http://localhost:8000
echo Press Ctrl+C in this terminal to stop the server at any time.
echo.

:: Launch browser in parallel after 2 seconds
start "" timeout /t 2 /nobreak >nul & start http://localhost:8000

:: Start FastAPI backend
python backend\main.py

pause
