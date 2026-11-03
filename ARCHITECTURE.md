# Architecture & System Topology: TalentRec AI Recruitment Engine

High-level architecture, data flow, scoring mathematical pipeline, and technology integration patterns for the Recruitment Recommendation Engine.

---

## 1. System Topology Diagram

```mermaid
flowchart TD
    subgraph Client ["Frontend (Next.js 14 / TypeScript / Tailwind CSS)"]
        UI[Recruiter & Candidate Web Dashboard - Port 3001]
        RS[Role Mode Switcher: Recruiter vs Candidate]
        CHAT[Ask AI Recruiter Chatbot]
    end

    subgraph Server ["Backend API (FastAPI / Python 3.14) - Port 8003"]
        API[FastAPI Router - /api/v1]
        PARSER[Resume & Job Parser Engine]
        SCORING[Deterministic 5D MCDM Scoring Engine]
        ANALYTICS[Talent Pipeline Analytics Service]
        LLM[Multi-Provider LLM Router]
    end

    subgraph LLM_Providers ["LLM Providers with Automatic Failover"]
        GEMINI[Google Gemini 2.0 Flash]
        NVIDIA[NVIDIA NIM LLaMA-3.3 70B]
        OLLAMA[Ollama Cloud gpt-oss:20b / Local Fallback]
    end

    subgraph Storage ["Persistent Storage (SQLite WAL)"]
        DB[(recruitment_engine.db)]
        JOBS[job_postings & job_requirements]
        CANDS[candidates & candidate_rankings]
        ARTS[candidate_ai_artifacts]
    end

    UI -->|REST API / HTTP| API
    CHAT -->|Contextual Prompting + NLP| API
    API --> PARSER
    API --> SCORING
    API --> ANALYTICS
    PARSER --> LLM
    SCORING --> DB
    API --> DB
    LLM --> GEMINI
    LLM -. Failover .-> NVIDIA
    LLM -. Failover .-> OLLAMA
```

---

## 2. Deterministic 5-Dimension Scoring Formula (MCDM)

Rather than asking an LLM to generate an unexplained arbitrary ranking, the engine calculates deterministic scores in Python:

$$\text{FinalScore} = \left( 0.40 \times S_{\text{skills}} + 0.25 \times S_{\text{exp}} + 0.15 \times S_{\text{qual}} + 0.15 \times S_{\text{proj}} + 0.05 \times S_{\text{domain}} \right) - P_{\text{mandatory}}$$

* **Mandatory Penalty Gate ($P_{\text{mandatory}}$)**: If a mandatory skill is missing, $P_{\text{mandatory}} = 30$, preventing unqualified profiles from outranking candidates who satisfy critical core prerequisites.
* **Demographic Blinding**: Pre-review sanitization strips candidate full name, phone number, and email, replacing them with anonymous codes (`CAND-001`, `CAND-002`) to comply with the DPDP Act 2025.

