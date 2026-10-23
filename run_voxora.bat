@echo off
title Voxora - Local Launcher
color 0B
cls
echo ========================================================
echo   VOXORA - AI Voice Interview & Viva Platform
echo   Practice Out Loud. Perform with Confidence.
echo ========================================================
echo.
echo Starting backend server on http://127.0.0.1:8000 ...
start "Voxora Backend" cmd /k "cd /d %~dp0 && set PYTHONPATH=%~dp0backend && .\venv\Scripts\python -m uvicorn app.main:app --port 8000"

timeout /t 2 >nul

echo Starting frontend dev server on http://localhost:5173 ...
start "Voxora Frontend" cmd /k "cd /d %~dp0frontend && npm run dev -- --port 5173"

timeout /t 3 >nul

echo Opening Voxora in your default browser...
start http://localhost:5173

echo.
echo ========================================================
echo   Voxora is now running!
echo   Frontend : http://localhost:5173
echo   Backend  : http://127.0.0.1:8000
echo   API Docs : http://127.0.0.1:8000/docs
echo ========================================================
echo Keep the server windows open while practicing.
pause
