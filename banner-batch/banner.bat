@echo off

for /f "tokens=2 delims=:" %%a in ('chcp') do set "orig_cp=%%a"
set "orig_cp=%orig_cp: =%"
chcp 65001 >nul

rem --- Save current color ---
for /f "tokens=2 delims=: " %%a in ('color') do set "orig_color=%%a"
color 02

rem --- Print the banner file ---
type banner.txt
rem --- Set dark green (02) or bright green (0A) ---
color 02

rem --- Restore original color ---
color %orig_color%

echo.
rem restore original code page
chcp %orig_cp% >nul

pause
