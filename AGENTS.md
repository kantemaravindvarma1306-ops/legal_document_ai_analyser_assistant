# Agent Architecture & Roles: TalentRec AI Recruitment Engine

Specification of AI agent roles, prompt definitions, and skills for autonomous and semi-autonomous recruitment workflows.

---

## 1. Agent Roles

### A. Resume Parser & Entity Extractor Agent
- **Role**: Extracts structured candidate entities (education, verified technical skills, work history, projects, certifications, and tenure) from raw PDF, DOCX, and TXT resumes.
- **Output Schema**: Pydantic `CandidateProfile` model with strictly validated data types.

### B. Job Requisition & JD Generator Agent
- **Role**: Assists recruiters in drafting industry-standard job descriptions from brief role titles and departments, distinguishing mandatory from preferred skills.
- **Output Schema**: `GenerateJDResponse` with role overview, requirements, and responsibilities.

### C. Technical Interview & Gap Probe Agent
- **Role**: Analyzes the gap between a candidate's verified skills and the job requirements to generate 5 targeted technical interview questions probing system design, edge cases, and missing skills.
- **Output Schema**: `InterviewQuestionsResponse`.

### D. Career Coaching & Resume Improvement Agent
- **Role**: Provides constructive candidate feedback using Google XYZ bullet formatting (`Accomplished [X] as measured by [Y] by doing [Z]`) and identifies key action items.
- **Output Schema**: `ResumeFeedbackResponse`.

### E. HR Outreach & Email Drafting Agent
- **Role**: Generates contextual, personalized correspondence for candidates based on their review status (Interview Invitation, Application Update, Constructive Rejection).
- **Output Schema**: `EmailDraftResponse`.

