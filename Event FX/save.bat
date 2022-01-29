@echo off

set today=%date:~0,4%-%date:~5,2%-%date:~8,2%
if exist "%~dp0FX Packages (%today%).reg" (
  reg export HKEY_CURRENT_USER\SOFTWARE\DirectShow\Presets "%~dp0FX Packages (%today%).reg"
) else (
  reg export HKEY_CURRENT_USER\SOFTWARE\DirectShow\Presets "%~dp0FX Packages (%today%).reg" > nul
)
set today=
