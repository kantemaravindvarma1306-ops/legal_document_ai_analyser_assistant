# How to Run: CJIT AI Hackathon Suite

This guide provides all the exact commands to run, test, and evaluate both the **Legal Document Review Assistant** and the **Recruitment Recommendation Engine** on Windows (PowerShell / CMD) and Linux / macOS (Bash).

---

## 1. Port & Service Summary

| Service | Component | Port / URL | Description |
| :--- | :--- | :--- | :--- |
| **Legal Document Review** | Backend (FastAPI) | `http://127.0.0.1:8002` | Contract parsing, grounding verifier, FTS5 search, LangChain redliner |
| **Legal Document Review** | Frontend (Next.js) | `http://localhost:3000` | Reviewer workspace, 7 tabs, screen copilot, raw doc viewer |
| **Recruitment Engine** | Backend (FastAPI) | `http://127.0.0.1:8003` | Resume parser, 5D MCDM scoring, LangChain dossier & debate |
| **Recruitment Engine** | Frontend (Next.js) | `http://localhost:3001` | Recruiter workspace, demographic blinding, head-to-head debate |

*(Note: Both frontends feature resilient auto-discovery with an Application Isolation Handshake. If port 8000 or 8001 is already taken by another service, each frontend automatically detects its matching backend.)*

---

## 2. Running the Applications

### A. Legal Document Review Assistant

#### Terminal 1 — Backend (FastAPI)

**Windows (PowerShell / Command Prompt):**
```powershell
cd legal_system\backend
.\.venv\Scripts\activate
uvicorn app.main:app --host 127.0.0.1 --port 8002 --reload
```

**macOS / Linux (Bash):**
```bash
cd legal_system/backend
source .venv/bin/activate
uvicorn app.main:app --host 127.0.0.1 --port 8002 --reload
```

*Health Check*: Open `http://127.0.0.1:8002/api/v1/health` or `http://127.0.0.1:8002/docs` for the interactive Swagger UI.

#### Terminal 2 — Frontend (Next.js 14)

**Windows & macOS / Linux:**
```bash
cd legal_system/frontend
npm run dev -- -p 3000
```
*Access in Browser*: `http://localhost:3000`

---

### B. Recruitment Recommendation Engine

#### Terminal 3 — Backend (FastAPI)

**Windows (PowerShell / Command Prompt):**
```powershell
cd recruitment_system\backend
.\.venv\Scripts\activate
uvicorn app.main:app --host 127.0.0.1 --port 8003 --reload
```

**macOS / Linux (Bash):**
```bash
cd recruitment_system/backend
source .venv/bin/activate
uvicorn app.main:app --host 127.0.0.1 --port 8003 --reload
```

*Health Check*: Open `http://127.0.0.1:8003/api/v1/health` or `http://127.0.0.1:8003/docs` for the interactive Swagger UI.

#### Terminal 4 — Frontend (Next.js 14)

**Windows & macOS / Linux:**
```bash
cd recruitment_system/frontend
npm run dev -- -p 3001
```
*Access in Browser*: `http://localhost:3001`

---

## 3. Running All Automated Tests (37/37 Passing)

To run the unified test harness across both projects in a single command:

**Windows (Command Prompt / PowerShell):**
```cmd
.\scripts\test.bat
```
*(Or in PowerShell: `powershell -ExecutionPolicy Bypass -File .\scripts\test.ps1`)*

**macOS / Linux (Bash):**
```bash
./scripts/test.sh
```

### Running Test Suites Individually:

#### Legal System Tests (22 Tests)
```bash
# Windows
cd legal_system\backend
.\.venv\Scripts\pytest.exe tests -v

# Linux / macOS
cd legal_system/backend
.venv/bin/pytest tests/ -v
```

#### Recruitment System Tests (15 Tests)
```bash
# Windows
cd recruitment_system\backend
.\.venv\Scripts\pytest.exe tests -v

# Linux / macOS
cd recruitment_system/backend
.venv/bin/pytest tests/ -v
```

---

## 4. Frontend Type & Build Verification

To verify that TypeScript compiles with zero errors:

```bash
# Verify Legal Frontend
cd legal_system/frontend
npx tsc --noEmit

# Verify Recruitment Frontend
cd recruitment_system/frontend
npx tsc --noEmit
```

To run production builds:
```bash
cd legal_system/frontend && npm run build
cd recruitment_system/frontend && npm run build
```

---

## 5. Running the Evaluation Benchmarks

To check the offline evaluation benchmarks for grounding accuracy, citation verification, and MCDM ranking:

**Windows:**
```cmd
.\scripts\evaluate.bat
```

**Linux / macOS:**
```bash
./scripts/evaluate.sh
```

---

## 6. Environment & API Key Configuration (Optional)

Both projects run immediately out-of-the-box using the pre-configured **Ollama Cloud API** key (supporting `gpt-oss:20b`), as well as offline deterministic fallbacks.

If you wish to use your own cloud API keys, you can set them in your environment or in `legal_system/config.yaml` and `recruitment_system/config.yaml`:

```bash
# Optional: Google Gemini Free API Key
export GEMINI_API_KEY="your-gemini-api-key"

# Optional: NVIDIA NIM API Key
export NVIDIA_API_KEY="your-nvidia-nim-key"

# Optional: Custom Ollama Cloud API Key
export OLLAMA_API_KEY="your-ollama-api-key"
```
