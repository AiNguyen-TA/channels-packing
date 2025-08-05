@echo off
echo ========================================
echo Channel Packer - Setup Script
echo ========================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Python is not installed or not in PATH
    echo Please install Python from https://python.org
    echo Make sure to check "Add Python to PATH" during installation
    pause
    exit /b 1
)

echo Python found: 
python --version
echo.

REM Check if virtual environment already exists
if exist "venv" (
    echo Virtual environment already exists.
    echo.
) else (
    echo Creating virtual environment...
    python -m venv venv
    if %errorlevel% neq 0 (
        echo ERROR: Failed to create virtual environment
        echo Make sure you have the venv module installed
        pause
        exit /b 1
    )
    echo Virtual environment created successfully!
    echo.
)

REM Activate virtual environment
echo Activating virtual environment...
call venv\Scripts\activate.bat
if %errorlevel% neq 0 (
    echo ERROR: Failed to activate virtual environment
    pause
    exit /b 1
)

echo Virtual environment activated!
echo.

REM Upgrade pip
echo Upgrading pip...
python -m pip install --upgrade pip

REM Install requirements
echo Installing requirements...
echo.
if exist "requirements.txt" (
    pip install -r requirements.txt
    if %errorlevel% neq 0 (
        echo ERROR: Failed to install some requirements
        echo Please check the error messages above
        pause
        exit /b 1
    )
) else (
    echo requirements.txt not found, installing packages individually...
    pip install Pillow>=10.0.0 numpy>=1.24.0 tkinterdnd2>=0.3.0
)

echo.
echo ========================================
echo Setup completed successfully!
echo ========================================
echo.
echo Your virtual environment is now active and ready to use.
echo.
echo To run the Channel Packer GUI:
echo   Double-click run_gui_venv.bat
echo   OR run: python channel_packer_gui.py
echo.
echo To run the command line version:
echo   python channel_packer.py [options]
echo.
echo To run the example:
echo   python example.py
echo.
echo To manually activate the environment later:
echo   Double-click activate_venv.bat
echo   OR run: venv\Scripts\activate.bat
echo.
echo ========================================
echo Setup complete! You can now close this window.
echo ========================================
echo.
pause
