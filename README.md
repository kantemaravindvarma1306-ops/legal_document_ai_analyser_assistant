# TalentRec AI — Recruitment Recommendation Engine

> **Deterministic, explainable candidate ranking and career coaching platform with demographic blinding, 5D MCDM scoring, and multi-provider LLM failover.**

Part of the **CJIT College Hackathon AI Suite** built adhering to **Spec-Driven AI Engineering** standards.

---

## 🌟 Key Features

1. **Job Description Analyzer & AI Generator**:
   - 1-click automatic JD generation from title & department.
   - Extracts mandatory vs preferred skills, experience tenure, and degree requirements.
2. **Multi-Format Resume Ingestion**:
   - Parses PDF, DOCX, and TXT files, extracting skills, experience, and project evidence.
3. **Deterministic 5D MCDM Scoring**:
   - Skills (40%), Experience (25%), Qualifications (15%), Projects (15%), Domain (5%).
   - Strict Mandatory Penalty Gate (-30 pts for missing critical core requirements).
4. **Demographic Bias Blinding**:
   - DPDP Act 2025 compliant anonymization (`CAND-001`, `CAND-002`) to prevent unconscious bias.
5. **Dual Mode View Segmentation**:
   - **Recruiter View**: Triage candidates, generate HR outreach emails, delete candidates.
   - **Candidate View**: Read-only match ratings, prominent "Resume Improvement Advice" coaching.
6. **AI Interview & Resume Coaching Assistant**:
   - Generates 5 tailored technical interview questions with scoring signals.
   - Actionable resume coaching using Google XYZ bullet rewrites.
7. **Multi-Provider LLM Router with Resilient Failover**:
   - Priority: Google Gemini 2.0 Flash -> NVIDIA NIM LLaMA-3.3 70B -> Ollama Cloud `gpt-oss:20b` -> Local Fallback.

---

## 🚀 Quickstart

### Backend (FastAPI / Port 8003)
```bash
cd recruitment_system/backend
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
uvicorn app.main:app --port 8003 --reload
```

### Frontend (Next.js 14 / Port 3001)
```bash
cd recruitment_system/frontend
npm install
npm run dev -- -p 3001
```

Visit the dashboard at [http://localhost:3001](http://localhost:3001).

