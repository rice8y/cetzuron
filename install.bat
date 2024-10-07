@echo off

set "TOML_FILE=typst.toml"

where typst >nul 2>nul
if errorlevel 1 (
    echo Error: typst is not installed. Please install it and try again.
    exit /b 1
)

for /f "tokens=2 delims== " %%a in ('findstr /C:"name =" "%TOML_FILE%"') do set "PACKAGE_NAME=%%~a"
for /f "tokens=2 delims== " %%a in ('findstr /C:"version =" "%TOML_FILE%"') do set "PACKAGE_VERSION=%%~a"

set "PACKAGE_NAME=%PACKAGE_NAME:"=%"
set "PACKAGE_VERSION=%PACKAGE_VERSION:"=%"

if "%OS%"=="Windows_NT" (
    set "LOCAL_PACKAGE_DIR=%APPDATA%\typst\packages"
) else (
    echo Unsupported OS
    exit /b 1
)

set "TARGET_DIR=%LOCAL_PACKAGE_DIR%\local\%PACKAGE_NAME%\%PACKAGE_VERSION%"

mkdir "%TARGET_DIR%"
xcopy /E /I * "%TARGET_DIR%"

echo Package %PACKAGE_NAME% version %PACKAGE_VERSION% has been installed to %TARGET_DIR%
