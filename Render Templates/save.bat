@echo off

rem Source: Stack Overflow post by jeb (CC BY-SA 3.0)
rem https://stackoverflow.com/a/19596027
(echo ;;;===,,,@echo off & echo.;;;===,,,findstr /v "^;;;===,,," "%%~f0" ^> "data.zip" & echo.;;;===,,,powershell -command "Expand-Archive -Force -Path 'data.zip' -DestinationPath """"$([Environment]::GetFolderPath('ApplicationData'))\VEGAS""""" & echo.;;;===,,,del "data.zip" & echo.;;;===,,,exit /b) > "program.bat"

powershell -command "Compress-Archive -Path """"$([Environment]::GetFolderPath('ApplicationData'))\VEGAS\Render Templates"""" -DestinationPath 'data.zip'"
set today=%date:~0,4%-%date:~5,2%-%date:~8,2%
if exist "Render Templates (%today%).bat" (
  copy /-y /a "program.bat" + /b "data.zip" /b "Render Templates (%today%).bat"
) else (
  copy /-y /a "program.bat" + /b "data.zip" /b "Render Templates (%today%).bat" > nul
)
set today=
del "program.bat" "data.zip"
