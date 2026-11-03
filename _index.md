# Recruitment Recommendation Engine - Documentation Index

This index provides a structured directory of all functional, technical, architecture, and governance documentation for the Recruitment Recommendation Engine project. All paths are relative to the project root (`recruitment_system/`).

---

## 1. Functional Specifications (`docs/artefacts/functional/`)

| Relative Path | Title & Description |
| :--- | :--- |
| `docs/artefacts/functional/01-job-creation-and-requirements.md` | **Job Posting Creation & Requirement Categorization**: Job creation workflows, AI job description generation, role presets, requirement taxonomies, and job position deletion (`DELETE /job-postings/{id}`). |
| `docs/artefacts/functional/02-resume-ingestion-and-multiformat.md` | **Resume Ingestion & Multiformat Parsing**: Multi-format resume ingestion (PDF, DOCX, TXT), profile extraction, raw resume viewer modal, and bulk candidate reset. |
| `docs/artefacts/functional/03-demographic-bias-blinding.md` | **Demographic Bias Blinding & Fairness Mode**: Redaction of candidate names, emails, phones, photographs, and gender markers to ensure compliance with DPDP Act 2025 and ethical hiring. |
| `docs/artefacts/functional/04-deterministic-5d-scoring.md` | **Deterministic 5-Dimension Scoring & Ranking**: Transparent multi-dimensional scoring (Skills 40%, Experience 25%, Quals 15%, Projects 15%, Domain 5%), mandatory penalty gate (-30%), and NLP semantic synonym expansion (`git` $\leftrightarrow$ `github`, `react` $\leftrightarrow$ `reactjs`). |
| `docs/artefacts/functional/05-recruiter-triage-and-notes.md` | **Recruiter Triage Workflow & Notes**: Candidate triage actions (`needs_review`, `shortlisted`, `rejected`), recruiter notes, and deletion controls (individual candidate delete, Delete All Resumes). |
| `docs/artefacts/functional/06-interactive-guide-and-hr-decoder.md` | **Interactive Steps Guide & Recruitment AI Decoder**: 5-step evaluation pipeline walkthrough, MCDM scoring decoder, and 1-click pre-bundled candidate demos (*Alex Chen*, *Priya Sharma*, *Marcus Vance*). |
| `docs/artefacts/functional/07-ai-interview-and-coaching-assistant.md` | **AI Interview & Coaching Assistant & LangChain Dossier**: Dynamic interview question generation based on candidate skill gaps, and LangChain Candidate Deep Dossier powered by `gpt-oss:120b`. |
| `docs/artefacts/functional/08-candidate-comparison-and-analytics.md` | **Candidate Comparison & Head-to-Head AI Debate**: Side-by-side dimensional comparisons, skill radar analytics, and LangChain Head-to-Head Comparative AI Debate declaring decisive hiring recommendations. |

---

## 2. Technical Specifications (`docs/artefacts/technical/`)

| Relative Path | Title & Description |
| :--- | :--- |
| `docs/artefacts/technical/01-system-architecture-and-pipeline.md` | **System Architecture & Data Pipeline**: End-to-end multi-layer architecture, data ingestion pipelines, LangChain LCEL orchestration, deletion lifecycles, and Hackathon Dark Theme specifications. |
| `docs/artefacts/technical/02-mathematical-scoring-algorithm.md` | **Mathematical Scoring Algorithm & MCDM Formulation**: Multi-Criteria Decision Model (MCDM) utility formulations, non-linear mandatory penalty gates, and semantic synonym expansion matching logic. |
| `docs/artefacts/technical/03-nlp-parsing-and-lexicon-matching.md` | **NLP Parsing, Lexicon Matching & Synonym Expansion**: Candidate entity extraction, synonym dictionary mapping (`git` $\leftrightarrow$ `github`, `k8s` $\leftrightarrow$ `kubernetes`), and LangChain semantic verification. |
| `docs/artefacts/technical/04-multi-provider-llm-router.md` | **Multi-Provider LLM Router & LangChain LCEL Provider**: Dynamic router failover hierarchy (Gemini $\to$ NVIDIA NIM $\to$ Ollama Cloud API) and LangChain resilient provider (`gpt-oss:120b` $\to$ `nemotron-3-super` $\to$ `gpt-oss:20b`). |
| `docs/artefacts/technical/05-sqlite-schema-and-persistence.md` | **SQLite Persistence, Schema & Foreign Key Cascades**: Database DDL, indexing strategies, `candidate_ai_artifacts` table, and cascading deletion handling across all endpoints. |
| `docs/artefacts/technical/06-rest-api-contracts.md` | **REST API Specifications & Contracts**: Complete OpenAPI endpoint contracts, request/response JSON schemas, and curl examples for candidates, jobs, dossiers, comparisons, and deletion routes. |
| `docs/artefacts/technical/07-frontend-resilient-discovery.md` | **Frontend Architecture & Resilient Discovery**: Next.js 14 client state hierarchy, candidate port auto-probing with application isolation handshake, deletion controls, LangChain triggers, and screen copilot. |
| `docs/artefacts/technical/08-recruitment-ai-artifacts-and-analytics-api.md` | **AI Artifacts & Analytics Specifications**: Schemas for structured candidate artifacts, LangChain candidate dossiers, and comparative debate transcript models. |
| `docs/artefacts/technical/09-ui-design-and-hackathon-scorecard.md` | **UI Design System & Hackathon Scorecard**: Dark palette standard (`#22333B`, `#EFF3F1`, `#5E8B7E`, `#C7A17A`), responsive layout specifications, and hackathon scorecard alignment. |

---

## 3. Architecture Decisions & Governance (`docs/`)

| Relative Path | Title & Description |
| :--- | :--- |
| `docs/requirements.md` | **System Requirements**: Functional scope, technical constraints, scoring algorithms, and data privacy mandates. |
| `docs/product-brief.md` | **Product Brief & Vision**: Core problem statements, value propositions, and recruitment persona definitions. |
| `docs/roadmap.md` | **Project Roadmap**: Completed Phase 1 deliverables (5D scoring, blinding, LangChain dossier/debate, deletion controls) and Phase 2 enterprise expansion. |
| `docs/testing-strategy.md` | **Testing Strategy & Suites**: Detailed breakdown of the 15 automated pytest test cases covering router, parser, scoring engine, synonym mapper, API, and LangChain chains. |
| `docs/evaluation-strategy.md` | **Fairness & Quality Evaluation**: Demographic bias testing, scoring reproducibility, and DPDP compliance auditing. |
| `docs/privacy.md` | **Privacy & DPDP Compliance**: Data anonymization guidelines, personal demographic redaction, and local storage guarantees. |
| `docs/threat-model.md` | **Threat Model**: Candidate data protection, prompt injection defense, and input sanitization. |
| `docs/decisions/ADR-0001-technology-stack.md` | **ADR-0001**: Choice of Next.js 14, FastAPI, SQLite WAL, and deterministic python scoring. |
| `docs/decisions/ADR-0002-llm-routing-provider.md` | **ADR-0002**: Multi-provider LLM router and LangChain LCEL resilient cloud model fallback architecture. |
| `docs/runbooks/development.md` | **Developer Runbook**: Environment initialization, virtualenv setup, Next.js dev server execution, and port configurations. |

