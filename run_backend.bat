@echo off
cd /d "%~dp0backend"
echo Starting Recruitment Recommendation Engine Backend on http://127.0.0.1:8003 ...
call .\.venv\Scripts\uvicorn.exe app.main:app --host 127.0.0.1 --port 8003 --reload
pause

