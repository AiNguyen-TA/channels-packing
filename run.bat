@echo off
echo Starting Channel Packer GUI...
echo.

REM Check if virtual environment exists
if not exist "venv" (
    echo Virtual environment not found!
    echo Please run setup.bat first to set up the environment.
    pause
    exit /b 1
)

REM Activate virtual environment
call venv\Scripts\activate.bat

REM Run the GUI
python channel_packer_gui.py

REM Keep window open if there's an error
if %errorlevel% neq 0 (
    echo.
    echo An error occurred. Check the messages above.
    pause
)
