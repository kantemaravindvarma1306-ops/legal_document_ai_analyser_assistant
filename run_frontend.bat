@echo off
cd /d "%~dp0frontend"
set "PATH=%LOCALAPPDATA%\Programs\nodejs;%PATH%"
echo Starting Recruitment Recommendation Engine Frontend on http://localhost:3001 ...
call npm run dev -- -p 3001
pause

