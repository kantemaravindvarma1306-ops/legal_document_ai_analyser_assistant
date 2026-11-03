@echo off
echo Starting Recruitment Recommendation Engine (Backend + Frontend)...
start "Recruitment Backend (8003)" cmd /k "cd /d "%~dp0recruitment_system\backend" && .\.venv\Scripts\uvicorn.exe app.main:app --host 127.0.0.1 --port 8003 --reload"
start "Recruitment Frontend (3001)" cmd /k "cd /d "%~dp0recruitment_system\frontend" && set "PATH=%LOCALAPPDATA%\Programs\nodejs;%PATH%" && npm run dev -- -p 3001"
echo Both services launched in separate windows!
echo Backend:  http://127.0.0.1:8003
echo Frontend: http://localhost:3001

