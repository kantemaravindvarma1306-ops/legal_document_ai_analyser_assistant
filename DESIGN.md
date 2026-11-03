# Design System: TalentRec AI Recruitment Recommendation Engine

Design specifications, visual tokens, and UI layout conventions for the Next.js frontend, conforming to the `google-labs-code/design.md` standard.

---

## 1. Design Principles
- **Explainability First**: Hiring metrics must never feel like an opaque "black-box score". Visual progress bars for the 5 MCDM dimensions clearly explain the score breakdown.
- **Fairness & Focus**: Demographics are blinded by default (DPDP Act compliance). The UI prioritizes demonstrated technical competency and verified project evidence over personal markers.
- **Role-Based Clarity**: Instant segmented navbar toggle cleanly isolates candidate/student career coaching from confidential internal HR triage actions and email drafting.
- **Permanent High-Contrast Dark Mode**: Built for low eye strain with deep slate `#020617` and `#0f172a` surfaces with crisp typography (`Inter`, `system-ui`).

---

## 2. Color Palette & Semantic Tokens

| Token | Hex / Class | Semantic Usage |
|---|---|---|
| **Tier Strong Match** | `#10B981` (`text-emerald-400`, `bg-emerald-500/10`) | Total score >= 85% with verified mandatory skills |
| **Tier Good Match** | `#3B82F6` (`text-blue-400`, `bg-blue-500/10`) | Total score 75-84% with solid alignment |
| **Tier Potential Match** | `#F59E0B` (`text-amber-400`, `bg-amber-500/10`) | Total score 65-74% with minor gaps |
| **Tier Partial Match** | `#EF4444` (`text-rose-400`, `bg-rose-500/10`) | Total score < 65% or missing mandatory requirements |
| **Mandatory Penalty Gate** | `#F43F5E` (`text-rose-500`) | Non-negotiable mandatory skill missing (-30 pt penalty) |
| **Background / Canvas** | `#020617` (`bg-slate-950`) | Main application dark canvas |
| **Surface Cards** | `#0F172A` (`bg-slate-900`, `border-slate-800`) | Requisition panels and candidate ranking cards |

---

## 3. Key Layout Components
1. **Header Bar**: Features Requisition selector, "Candidate View" vs "Recruiter View" segmented toggle, DPDP Blind Evaluation switch, active LLM status indicator, and UI Zoom controls.
2. **Tabbed Navigation Strip**:
   - *Recruiter View*: Shows all 5 tabs (*Candidate Ranking & Evaluation*, *Requisitions & Analytics*, *Candidate Compare*, *5D MCDM Matrix*, *Recruiter Guide*).
   - *Candidate View*: Shows candidate-focused tabs (*My Job Match & Resume Analysis*, *5D MCDM Matrix*, *Candidate Guide*).
3. **Candidate Cards**: Expandable cards displaying 5D MCDM score bars, matched skills badges, missing requirements, AI recommendations, action loaders for interview questions and coaching advice, and recruiter review dropdowns.

