# Security & Fairness Policy: TalentRec AI Recruitment Engine

Fairness guardrails, demographic bias mitigations, threat modeling, and data privacy protocols.

---

## 1. Demographic Fairness & DPDP Act 2025 Compliance
- **Anonymization by Default**: When `blind=true`, the system sanitizes candidate records, replacing `full_name`, `email`, and `phone` with anonymous codes (`CAND-001`).
- **No Protected Attributes**: The parser actively ignores gender, race, religion, nationality, and marital status. These attributes never enter the scoring formula.
- **Explainability**: Every candidate evaluation itemizes matched skills, missing requirements, and objective experience duration to ensure hiring decisions remain auditable by humans.

---

## 2. Threat Modeling & Safeguards
- **Prompt Injection Defense**: Resume and job description text is treated as untrusted user input and sanitized before LLM analysis.
- **SQL Injection Prevention**: All queries use parameterized statements (`sqlite3` parameterized queries).
- **File Ingestion Restrictions**: Ingestion is restricted to PDF, DOCX, and TXT files under 10 MB.
- **Data Lifecycle**: Complete deletion endpoints (`DELETE /candidates/{id}`, `DELETE /jobs/{id}`, `DELETE /jobs`) ensure candidate data can be permanently erased upon request in accordance with the Right to be Forgotten.

