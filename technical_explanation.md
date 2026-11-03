# Technical Explanation & Engineering Architecture: Recruitment Recommendation Engine

This document provides a comprehensive technical breakdown of the entire technology stack, every algorithm implemented, every library and framework used, and the direct mapping to the **Spec-Driven AI Engineering** curriculum stations.

---

## 1. Executive Architecture Overview

The **Recruitment Recommendation Engine** is an ethical, explainable, and deterministic candidate ranking and talent intelligence platform. It ingests multi-format candidate resumes, enforces demographic bias blinding (DPDP Act 2025 compliance), computes reproducible 5-dimension scores using Multi-Criteria Decision Making (MCDM) with NLP semantic synonym expansion, generates deep candidate dossiers via high-capacity LangChain cloud models, and enables head-to-head comparative AI debates.

```
┌────────────────────────────────────────────────────────────────────────┐
│               Next.js 14 Frontend (Port 3001)                          │
│  - Locked Hackathon Dark Palette (#22333B, #EFF3F1, #5E8B7E, #C7A17A)  │
│  - Demographic Blinding Toggle (CAND-001 vs Revealed Profile)          │
│  - Recruiter Deletion Controls (Delete All Resumes, Individual, Job)   │
│  - Raw Original Resume Viewer Modal with in-document search & copy     │
│  - Head-to-Head Comparative AI Debate Modal                            │
│  - Screen Context Capture Copilot ("Capture Context" -> DOM Snapshot)  │
└─────────────────────────────────┬──────────────────────────────────────┘
                                  │ HTTP / JSON / SSE (REST API)
┌─────────────────────────────────▼──────────────────────────────────────┐
│               FastAPI Backend Service (Port 8003)                      │
│  - Python 3.14 + Uvicorn + Pydantic v2                                 │
│  - SQLite 3 (WAL Mode + Foreign Key Cascades)                          │
├────────────────────────────────────────────────────────────────────────┤
│ Deterministic Scoring & NLP Engine:                                    │
│  1. 5D MCDM Scoring: Skills 40%, Exp 25%, Quals 15%, Proj 15%, Dom 5%  │
│  2. Continuous Experience Saturation Curve (min(E/E_req, 1.2))         │
│  3. Non-Linear Mandatory Constraint Penalty Gate (-30% score penalty)  │
│  4. NLP Semantic Synonym Expansion Mapper (git <-> github, etc.)       │
│  5. Demographic Bias Masking & Pronoun Neutralizer                     │
├────────────────────────────────────────────────────────────────────────┤
│ AI Orchestration & Model Tiers:                                        │
│  - Fast Router: Gemini 2.0 Flash -> NVIDIA NIM -> Ollama Cloud 20B     │
│  - LangChain LCEL: gpt-oss:120b -> NVIDIA nemotron-3-super -> 20B      │
└────────────────────────────────────────────────────────────────────────┘
```

---

## 2. Complete Technology Stack & Library Inventory

### A. Backend Core & API Layer
* **Python 3.14**: High-performance Python execution runtime.
* **FastAPI (`v0.115+`)**: Async API framework with Pydantic type validation and automatic OpenAPI contract documentation.
* **Uvicorn (`v0.34+`)**: Asynchronous ASGI server for production API hosting.
* **Pydantic (`v2.10+`)**: Data validation schemas enforcing strict types across candidate profiles, job requirements, rankings, and AI artifacts.
* **HTTPX (`v0.28+`)**: Async client powering outbound inference calls.
* **PyYAML (`v6.0+`)**: Dynamic configuration parser for `config.yaml`.

### B. Storage & Relational Persistence
* **SQLite 3**: Embedded database operating under **Write-Ahead Logging (WAL)**.
* **Foreign Key Cascade Engine**: Enforced relational integrity via `PRAGMA foreign_keys = ON;`, cleanly cascading candidate deletions to rankings and AI artifacts.

### C. Resume Parsing, Multiformat Extraction & NLP
* **`pypdf` (`v5.3+`)**: Text extraction from PDF resumes with verbatim coordinate mapping.
* **`python-docx` (`v1.1+`)**: Paragraph and table extraction from Microsoft Word `.docx` documents.
* **`docx2txt` (`v0.8+`)**: Robust text extraction fallback for non-standard Word XML archives.
* **Python Regular Expressions (`re`)**: Pattern matching for email, phone number, and address redaction, years-of-experience extraction, degree normalization, and skill tokenization.

### D. AI & LangChain Orchestration
* **`langchain` (`v0.3+`)**: Framework for chained multi-model candidate evaluation.
* **`langchain-core`**: Core pipeline primitives (`ChatPromptTemplate`, `StrOutputParser`).
* **`langchain-openai`**: Client connecting to Ollama Cloud API (`https://ollama.com/v1`) with native `.with_fallbacks()` resilience.
* **Cloud Reasoning Models**:
  * **`gpt-oss:120b`**: Dense 120-billion parameter reasoning model on Ollama Cloud.
  * **`nemotron-3-super`**: NVIDIA's 230-billion parameter MoE reasoning model on Ollama Cloud.
  * **`gpt-oss:20b`**: Rapid-inference fallback model on Ollama Cloud.
  * **`gemini-2.0-flash`**: Google Gemini API for fast JD generation and profile decomposition.
  * **`meta/llama-3.3-70b-instruct`**: NVIDIA NIM cloud inference integration.

### E. Frontend UI / UX Layer
* **Next.js 14 (`v14.2+`)**: React App Router framework with server and client components.
* **React 18 (`v18.3+`)**: Interactive UI state management, context copilot streaming, and modals.
* **TypeScript (`v5.5+`)**: Strict static typing with zero errors (`tsc --noEmit`).
* **Tailwind CSS (`v3.4+`)**: Utility styling conforming to the Hackathon Dark Palette (`#22333B` canvas, `#EFF3F1` text, `#5E8B7E` sage teal accent, `#C7A17A` warm gold secondary).
* **Lucide React (`v0.475+`)**: Clean functional icons with sparkle icons and logos removed.

### F. Testing & Quality Assurance
* **Pytest (`v9.2+`)**: Test runner executing 15 backend unit, integration, scoring, and LangChain tests.
* **Pytest-Asyncio (`v1.4+`)**: Async test support for FastAPI endpoints and LCEL chains.

---

## 3. Detailed Algorithmic Inventory

### 1. Multi-Criteria Decision Making (MCDM) Scoring Algorithm
* **Location**: [`app/services/scoring_engine.py`](file:///mnt/5d9f5ec4-97b1-4495-8630-aafd5bd9fb5d/Projects/hackathon/recruitment_system/backend/app/services/scoring_engine.py)
* **Formulation**: Framed as a Multi-Attribute Utility Function evaluating five orthogonal feature vectors:
  $$\mathbf{X} = \{S_{\text{skills}}, S_{\text{exp}}, S_{\text{quals}}, S_{\text{proj}}, S_{\text{domain}}\}$$
  With normalized recruiter-configurable weights:
  $$\mathbf{W} = \{w_s = 0.40, w_e = 0.25, w_q = 0.15, w_p = 0.15, w_d = 0.05\} \quad (\sum w_i = 1.0)$$
  $$\text{Raw Total} = \mathbf{W} \cdot \mathbf{X}$$

### 2. Continuous Experience Saturation Curve
* **Location**: [`app/services/scoring_engine.py`](file:///mnt/5d9f5ec4-97b1-4495-8630-aafd5bd9fb5d/Projects/hackathon/recruitment_system/backend/app/services/scoring_engine.py)
* **Equation**:
  $$S_{\text{exp}} = \min\left( \frac{E_{\text{cand}}}{E_{\text{req}}}, 1.2 \right) \times 100$$
* **Behavior**: Meeting baseline yields $100\%$; candidates exceeding requirements receive up to a $120\%$ seniority bonus.

### 3. Non-Linear Mandatory Constraint Penalty Gate
* **Location**: [`app/services/scoring_engine.py`](file:///mnt/5d9f5ec4-97b1-4495-8630-aafd5bd9fb5d/Projects/hackathon/recruitment_system/backend/app/services/scoring_engine.py)
* **Mechanism**: If any mandatory requirement $m \in M$ is missing from candidate competencies:
  $$\text{Total Score} = \text{Raw Total} \times (1.0 - 0.30)$$
  Applies an immediate $-30\%$ penalty and surfaces an explicit visual warning chip: `⚠ Missing mandatory skill: <name>`.

### 4. NLP Semantic Synonym Expansion & Tooling Equivalence
* **Location**: [`app/services/scoring_engine.py`](file:///mnt/5d9f5ec4-97b1-4495-8630-aafd5bd9fb5d/Projects/hackathon/recruitment_system/backend/app/services/scoring_engine.py)
* **Algorithm**:
  $$\text{Match}(r, C_s) = \begin{cases} 1 & \text{if } r \in C_s \lor (\text{Syn}(r) \cap C_s \neq \emptyset) \\ 0 & \text{otherwise} \end{cases}$$
* **Mappings**: Canonical dictionary bridging tooling equivalences:
  * `git` $\longleftrightarrow$ `github`, `gitlab`, `bitbucket`, `version control`
  * `react` $\longleftrightarrow$ `reactjs`, `react.js`
  * `k8s` $\longleftrightarrow$ `kubernetes`
  * `aws` $\longleftrightarrow$ `amazon web services`
  * `golang` $\longleftrightarrow$ `go`
  * `ci/cd` $\longleftrightarrow$ `cicd`, `github actions`, `jenkins`

### 5. Demographic Bias Masking & Pronoun Neutralization
* **Location**: [`app/services/resume_parser.py`](file:///mnt/5d9f5ec4-97b1-4495-8630-aafd5bd9fb5d/Projects/hackathon/recruitment_system/backend/app/services/resume_parser.py)
* **Mechanism**:
  * Strips applicant names, emails, phone numbers, and graduation years.
  * Replaces gendered pronouns (*he/she/his/hers*) with gender-neutral *they/them/their*.
  * Generates anonymous codes (`Candidate [CAND-001]`) for bias-free meritocratic evaluation under the DPDP Act 2025.

### 6. LangChain Candidate Deep Dossier LCEL Chain
* **Location**: [`app/chains/evaluation_chain.py`](file:///mnt/5d9f5ec4-97b1-4495-8630-aafd5bd9fb5d/Projects/hackathon/recruitment_system/backend/app/chains/evaluation_chain.py)
* **Architecture**: `PromptTemplate | resilient_llm | StrOutputParser`
* **Resilience**: `.with_fallbacks([nemotron-3-super, gpt-oss:20b])` on `gpt-oss:120b`.
* **Output**: Architectural scale assessment, leadership indicators, red flags, career trajectory, and 5 targeted behavioral interview questions.

### 7. LangChain Head-to-Head Comparative AI Debate LCEL Chain
* **Location**: [`app/chains/comparison_chain.py`](file:///mnt/5d9f5ec4-97b1-4495-8630-aafd5bd9fb5d/Projects/hackathon/recruitment_system/backend/app/chains/comparison_chain.py)
* **Mechanism**: Executes a dialectic comparative evaluation between two shortlisted candidate finalists across technical velocity, architecture depth, and domain fit, declaring a decisive winner with hiring rationale.

### 8. Cascading Deletion & Referential Integrity Lifecycle
* **Location**: [`app/api/v1/candidates.py`](file:///mnt/5d9f5ec4-97b1-4495-8630-aafd5bd9fb5d/Projects/hackathon/recruitment_system/backend/app/api/v1/candidates.py) & [`app/api/v1/jobs.py`](file:///mnt/5d9f5ec4-97b1-4495-8630-aafd5bd9fb5d/Projects/hackathon/recruitment_system/backend/app/api/v1/jobs.py)
* **Mechanism**:
  * Individual candidate deletion (`DELETE /candidates/{id}`): Cascades to delete `candidate_ai_artifacts`, `candidate_rankings`, and `candidates`.
  * Bulk resume reset (`DELETE /candidates`): Wipes all candidate tables while preserving job requisitions.
  * Position deletion (`DELETE /job-postings/{id}`): Cascades to wipe requirements, rankings, artifacts, and applicants for that requisition.

### 9. Screen Context Capture & Copilot DOM State Injection
* **Location**: [`frontend/app/page.tsx`](file:///mnt/5d9f5ec4-97b1-4495-8630-aafd5bd9fb5d/Projects/hackathon/recruitment_system/frontend/app/page.tsx)
* **Mechanism**: Serializes candidate rankings, 5D score breakdowns, or job specs into markdown via the "Capture Context" button, delivering instant situational context to `POST /api/v1/chat`.

### 10. Resilient Port Auto-Discovery & Application Isolation Handshake
* **Location**: [`frontend/app/page.tsx`](file:///mnt/5d9f5ec4-97b1-4495-8630-aafd5bd9fb5d/Projects/hackathon/recruitment_system/frontend/app/page.tsx)
* **Algorithm**: Loops candidate ports (`8003`, `8001`, `8000`) and asserts `data.app_name === "Recruitment Recommendation Engine"` to prevent cross-service collision with the legal assistant.

---

## 4. Alignment with Spec-Driven AI Engineering

| Station | Curriculum Requirement | Implementation in Recruitment Recommendation Engine |
| :--- | :--- | :--- |
| **Station 1** | Documentation Constitution & Specification-First | Full `docs/artefacts/` hierarchy, functional specs, REST contracts, and `index.md`. |
| **Station 2** | Verifiable Grounding & Anti-Hallucination | Mathematical MCDM scoring computed in code with verbatim resume sentence provenance. |
| **Station 3** | Resilient Multi-Provider Routing | `LLMRouter` with Gemini Free $\to$ NVIDIA NIM $\to$ Ollama Cloud API failover. |
| **Station 4** | Local-First Embedded Persistence | SQLite 3 WAL mode with explicit foreign-key cascade lifecycles. |
| **Station 5** | LangChain Expression Language (LCEL) | Declarative LCEL chain pipelines with `StrOutputParser` and unified error handling. |
| **Station 6** | High-Capacity Reasoning Cloud Models | Direct integration with `gpt-oss:120b` and NVIDIA `nemotron-3-super` on Ollama Cloud. |
| **Station 7** | Context-Aware Screen Copilot | Active view DOM capture via "Capture Context" button streaming in the background. |
| **Station 8** | Comprehensive Automated Test Pyramid | 15/15 automated pytest tests passing (`./scripts/test.sh`) covering all layers. |

