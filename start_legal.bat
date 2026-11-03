@echo off
echo Starting Legal Document Review Assistant (Backend + Frontend)...
start "Legal Backend (8002)" cmd /k "cd /d "%~dp0legal_system\backend" && .\.venv\Scripts\uvicorn.exe app.main:app --host 127.0.0.1 --port 8002 --reload"
start "Legal Frontend (3000)" cmd /k "cd /d "%~dp0legal_system\frontend" && set "PATH=%LOCALAPPDATA%\Programs\nodejs;%PATH%" && npm run dev -- -p 3000"
echo Both services launched in separate windows!
echo Backend:  http://127.0.0.1:8002
echo Frontend: http://localhost:3000

