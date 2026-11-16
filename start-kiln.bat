@echo off
title Kiln - Hot Backend
cd /d "%~dp0"

echo.
echo  ========================================
echo   KILN - Starting the fire...
echo  ========================================
echo.

if not exist ".venv" (
    echo Creating virtual environment...
    python -m venv .venv
)

call .venv\Scripts\activate.bat

echo Checking dependencies...
pip install -r requirements.txt --quiet

if not exist "kiln.db" (
    echo Creating database...
    python -m app.db.init_db
)

echo.
echo  Kiln is live.
echo  Open: http://localhost:8000/docs
echo.
echo  Press Ctrl+C to stop.
echo.

uvicorn app.main:app --reload --host 0.0.0.0 --port 8000

pause
