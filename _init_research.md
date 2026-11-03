# CJIT Hackathon: Building the Legal Review Assistant and Recruitment Recommendation Engine

The key is to build two working AI products that demonstrate the engineering practices highlighted in your Spec-Driven AI Engineering presentation, rather than simply building two chatbots.

I've identified the requirements in your hackathon PDF and the development methodology in your PowerPoint. I'll separate what the organizers explicitly require from recommended technologies and additional features that could make your submissions stronger.

## 1. What the hackathon organizers actually want

The CJIT Hackathon PDF describes five possible projects on pages 3–4. Your two selected projects have these requirements:

## Project A — Legal Document Review Assistant

It must use AI/NLP to analyze legal documents, identify important clauses and obligations, detect risks and inconsistencies, and highlight areas that need legal attention. The goal is to reduce manual review effort.&#x20;

CJIt  Hackathon .pdf



## Project B — Recruitment Recommendation Engine

It must analyze job descriptions and candidate profiles, identify suitable candidates, and provide ranked recommendations based on skills, experience, qualifications, and job requirements.&#x20;

CJIt  Hackathon .pdf



An important distinction: the PDF does not prescribe a mandatory programming language, LLM provider, framework, database, or deployment platform for these two assignments. We should not present any particular stack as an official requirement unless another organizer source confirms it.

Your second document, Spec-Driven AI Engineering, provides the additional clue: its material highlights the difference between vibe coding and specification-driven development, reusable agent skills, GitHub Spec Kit, design specifications, and structured AI-assisted engineering practices.&#x20;

Spec-Driven_AI_Engineering (1).pptx



That suggests a strong strategy: make the products functional, but also make their requirements, architecture, tests, AI safety controls, and engineering process demonstrable.

## 2. What your Spec-Driven AI Engineering presentation tells us

The second document is important because it describes how to engineer the products, not just which products to build.

[The Journey from Vision to Coding with AI](https://images.openai.com/static-rsc-4/zTw2flbM-f1ycE-K8W3wyIXAfRQX-k9nPuZAC4PHd4R7P5Gh-_3N2ZGD3x0hx1zZhWDEVL6A9ACvtgIB6_Q5-frYcoXkTGhgty-2tIGv4aaMnNwqkMuk9kAZputsdJEZPwomfMhhguaUQEq0aSIOnnUpUiRze8Pz043h3ocu8WI?purpose=inline)

A. Specification-driven development (SDD)

Slides 3–5 contrast open-ended vibe coding with a structured process: define intent, design the solution, implement it, and document the result. The presentation names GitHub Spec Kit and related tools.&#x20;

Spec-Driven_AI_Engineering (1).pptx



[What are Agent Skills and How Agents Use Them?](https://images.openai.com/static-rsc-4/ZrHod0cZ4g_ViV8r7OLo1Z1cMG1BlTJPxzWdUfhAgY2XE1qCWiJaEYOUkSHGSNSvu1T6QaMdQ5tf1jLVeNE76TkXRnfqYVCkFkRn1Ep665gwGZxap9nZdpVrzTuWzxq2mHQPIRP5QH_UNxdPvejCEx_aTue7z1PJSDksiAx9Ixw?purpose=inline)

B. Agent skills

Slide 6 describes reusable bundles of instructions, reference material, and scripts that an AI coding agent loads when needed. You can create focused development instructions for implementing and testing each product, rather than relying on one enormous prompt.&#x20;

Spec-Driven_AI_Engineering (1).pptx



[Building Our Own LLM Assistant — Development Seed](https://images.openai.com/static-rsc-4/E4x9FUgDDvuq4Z5I_xNVxifp15pkpwjY0V-W-wg9P9pEGP4FLuRxo5gV_oalaTjuI_pwmhMFytxTbzbei28UAQlhA3S_y0pxkzo0NHvEHNh4hqPrhmmfB_JyOypwFD2FdsDGK_CJscnOq8KX3apkxvTbqS05B9DpS83MZowGe9A?purpose=inline)

C. From AI foundations to deployment

Slides 7–8 cover Python, AI and NLP, LLM architecture, data representation, framework integration, context control, MCP and multi-agent protocols, and production deployment. Slides 9–10 list learning resources and engineering repositories, including Microsoft's AI Agent resources and GitHub Spec Kit.&#x20;

Spec-Driven_AI_Engineering (1).pptx



My interpretation is that the strongest submission should demonstrate the entire engineering lifecycle: requirements, implementation, evidence of correctness, and a deployed application. That is a recommendation based on the two documents—not an additional official scoring rule.

## 3. The technology stack I recommend

Use a shared engineering foundation for the two products, with separate business logic. This reduces duplicated work while keeping each application independently demonstrable.

Frontend — Next.js, TypeScript, Tailwind CSS and shadcn/ui

File uploads, dashboards, document previews, ranked candidate tables, evidence panels, filters and reports.

Backend — Python, FastAPI and Pydantic

Document-processing APIs, AI workflows, validated structured outputs, ranking logic and evaluation endpoints.

Document processing — Docling

Extract content from PDFs, Word documents, tables and scanned material, preserving relevant document structure. Add OCR handling where required.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://docling.ai\&sz=32)

Docling



LLM — Gemini API as a starting choice

Use structured output schemas to make document findings and extracted candidate profiles predictable. Gemini supports PDF understanding and structured output. OpenAI's structured-output API is an alternative if you prefer it.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://ai.google.dev\&sz=32)

Google AI for Developers+2



Database — PostgreSQL with pgvector

Store users, documents, extracted fields, review results and candidate profiles. Add vector similarity search for semantic retrieval across clauses and resumes.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://github.com\&sz=32)

GitHub



Deployment — Docker and one cloud platform

Package reproducibly, then deploy to AWS, Azure or Google Cloud. Use a simple managed container service instead of introducing Kubernetes without a demonstrated need.

### Why this stack fits the documents

Your hackathon PDF's career-track guidance describes AI engineering in terms of end-to-end AI applications, semantic search, safety guardrails, and cloud deployment using Docker and potentially Kubernetes. It also recommends highlighting deployed applications and cloud experience when preparing for recruitment.&#x20;

CJIt  Hackathon .pdf



The technology stack above covers those engineering concerns without making the project unnecessarily complicated.

Two important choices:

- Use an LLM provider abstraction in the backend, so the rest of your application does not depend directly on a single provider's API.
- Do not add an agent framework, a vector database, MCP, multi-agent orchestration and Kubernetes just to include more technologies. Add each only where it delivers a concrete feature. For these projects, reliable extraction, evidence-backed results and clear evaluation are more valuable than a long technology list.

## 4. Project A — Legal Document Review Assistant

Goal: identify important clauses, obligations, risks and inconsistencies, with evidence that a human reviewer can verify.

### Recommended user workflow

1\. Upload a contract

PDF or DOCX, with a document-type selection

2\. Extract and index the document

Preserve text, pages, sections and source locations

3\. Analyze clauses and obligations

LLM extraction + deterministic checks + optional semantic retrieval

4\. Review an evidence-backed report

Risk severity, exact source passages, explanations and human review

### Features to implement

First priority: clause extraction. Extract clause type, a concise summary, obligations, responsible party, deadlines, amounts, renewal periods and termination conditions.

Second priority: risk identification. Start with a configurable checklist for issues such as:

| Category                 | What the assistant should flag                                            |
| ------------------------ | ------------------------------------------------------------------------- |
| Liability and indemnity  | Broad indemnification, unclear liability limits or conflicting provisions |
| Termination and renewal  | Automatic renewal, notice periods or contradictory termination terms      |
| Payments                 | Inconsistent amounts, payment schedules or late-payment provisions        |
| Confidentiality and data | Broad obligations, unclear exceptions or data-handling concerns           |
| Intellectual property    | Ambiguous ownership or licensing obligations                              |
| Governing terms          | Missing, unclear or conflicting jurisdiction and dispute provisions       |

These are proposed review categories, not claims that every clause is legally defective.

Third priority: inconsistency detection. Compare related provisions. For example, a renewal section might specify a 30-day cancellation notice, while another clause appears to require 60 days. Flag the discrepancy and show both passages instead of silently deciding which clause governs.

### The feature that can distinguish your submission

Make every flagged issue traceable to its original source.

Each issue should contain:

- Clause category and severity.
- A summary of the potential concern.
- The exact supporting passage and page or section.
- The reason the passage was flagged.
- Potential implications or questions to raise with a qualified legal professional.
- A review status, such as Needs review, Confirmed or Dismissed.

The backend should store source locations during document extraction. The model should refer to known evidence segments, and the backend should validate the quoted text against those segments. Do not trust the model to invent a correct page number or quotation.

For an optional follow-up feature, add a question-and-answer panel that answers questions about the uploaded contract using retrieved passages. The answer must cite those passages rather than rely on unsupported general knowledge.

### Suggested API and output schema

A first implementation could expose these endpoints:

```
POST /api/legal/documents
GET  /api/legal/documents/{document_id}
POST /api/legal/documents/{document_id}/review
GET  /api/legal/documents/{document_id}/findings
PATCH /api/legal/findings/{finding_id}
```

An individual finding could be represented as:

```
{
  "issue_type": "termination_notice",
  "severity": "medium",
  "summary": "Potential inconsistency in notice periods",
  "evidence_ids": ["segment_12", "segment_29"],
  "reason": "Two related provisions specify different notice periods",
  "status": "needs_review"
}
```

This is an illustrative schema, not a fixed requirement. Validate the model's response against a Pydantic or JSON Schema model before saving it.

Safety requirement: describe findings as potential risks requiring review, not as a definitive determination that a contract is enforceable, invalid or legally compliant. Use synthetic contracts for testing and do not submit confidential contracts to an external model without appropriate permission and disclosure.

## 5. Project B — Recruitment Recommendation Engine

Goal: rank candidates against a specific job using relevant evidence, explainable scores and human oversight.

### Recommended user workflow

1\. Enter a job description

Role, required skills, experience and required qualifications

2\. Upload multiple resumes

Extract structured fields from PDF and DOCX files

3\. Match requirements and calculate scores

Normalize skills, apply configurable weights and retrieve supporting evidence

4\. Inspect and shortlist candidates

Ranked results, reasons, missing requirements and resume evidence

### Features to implement

First priority: structured resume extraction. Extract skills, work experience, projects, education, certifications and relevant dates. Preserve where each important fact came from in the resume.

Second priority: job requirement extraction. Separate mandatory requirements from preferred qualifications. Normalize synonyms—for example, a job that requests PostgreSQL experience should not treat every mention of a generic database as equivalent.

Third priority: transparent candidate ranking. I recommend calculating the initial scores in application code, rather than asking an LLM to produce an unexplained final ranking.

For example, you could begin with these configurable weights:

| Matching dimension                         | Example weight |
| ------------------------------------------ | -------------- |
| Required and preferred skills              | 40%            |
| Relevant experience                        | 25%            |
| Required qualifications and certifications | 15%            |
| Relevant projects and portfolio evidence   | 15%            |
| Relevant domain experience                 | 5%             |
| Total                                      | 100%           |

These are starting weights for a prototype, not industry-standard weights or official hackathon criteria. Recruiters should be able to change them for different roles. Handle genuinely mandatory requirements separately, rather than allowing strong performance in unrelated categories to hide a missing essential qualification.

A semantic matching model can help identify equivalent skills and relevant experience. The ranking system should then use validated fields and explicit scoring rules.

### What the candidate ranking page should show

For every candidate, display the overall match score, matched skills, missing or unclear requirements, relevant experience, and supporting resume passages.

For example, a candidate might rank highly because the resume explicitly documents Python, SQL and a relevant data pipeline project, while lacking a required cloud certification. The interface should show both the strengths and the gap, with the evidence for each.

Avoid presenting a score of 85% as an objectively measured probability that somebody will succeed in the job. It is a match score based on the criteria and weights you've chosen.

### Suggested API

```
POST /api/recruitment/jobs
POST /api/recruitment/jobs/{job_id}/candidates
POST /api/recruitment/jobs/{job_id}/rank
GET  /api/recruitment/jobs/{job_id}/rankings
GET  /api/recruitment/candidates/{candidate_id}
PATCH /api/recruitment/candidates/{candidate_id}/review
```

### The fairness and privacy requirements

This is where a basic resume-matching demo can become a stronger engineering product.

The ranking should use job-relevant information and avoid using gender, caste, religion, photographs or other unrelated sensitive characteristics as matching criteria. Do not infer these attributes from names, photographs or other signals. Keep the recruiter responsible for decisions and provide a way to correct extraction errors and review recommendations.

Test the system with profiles that contain equivalent qualifications expressed in different wording. Also test missing information, employment gaps and resumes in different layouts to see whether the parser treats candidates inconsistently.

Because resumes contain personal data, provide appropriate upload permissions, data-retention controls and deletion functionality. India's Digital Personal Data Protection Rules, 2025 were notified on November 14, 2025; check the applicable requirements before using the prototype for real recruitment.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://www.pib.gov.in\&sz=32)

Press Information Bureau+1



## 6. How to apply Spec-Driven Development to both projects

This is where I would directly follow the methodology shown in your PowerPoint.

GitHub Spec Kit's current documented workflow uses structured steps to define requirements, plan the implementation, produce tasks, implement features and check for convergence. The specific commands available depend on your chosen coding-agent integration.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://github.github.com\&sz=32)

Spec Kit Documentation+1



### 01

Create the engineering constitution

Define non-negotiable principles: evidence-backed AI outputs, input validation, privacy, testable requirements, accessibility, explainable recruitment ranking and human review of legal findings.

### 02

Write two independent feature specifications

Specify the Legal Review Assistant and Recruitment Recommendation Engine separately, including user journeys, acceptance criteria, error handling and out-of-scope features.

### 03

Plan the architecture

Choose the technology stack, API contracts, database models, document-processing strategy, LLM interfaces and deployment target. Resolve ambiguity before generating implementation tasks.

### 04

Implement in small, testable increments

Build one complete workflow at a time. Write tests for the required behavior, inspect the generated code and verify that the implementation actually satisfies the specifications.

### 05

Run convergence and deploy

Compare the implementation against the specifications, fix gaps, run evaluation tests, document limitations and deploy working versions of both products.

### Starter prompts for Spec Kit

Use these as starting points for your requirements phase, adapting them to your selected coding agent.

For the Legal Review Assistant

Specify the behaviour before deciding implementation details.

Build a Legal Document Review Assistant that accepts PDF and DOCX contracts. Extract clause text and source locations, identify important clauses and obligations, flag potential risks and inconsistencies, and display each finding with verifiable evidence. Support review statuses and a searchable report. All findings must link to source passages; unsupported findings must be rejected or marked for human review. Include validation, privacy controls, error states, tests, and clear acceptance criteria. This tool supports human reviewers and does not provide definitive legal advice.

&#x20;Copy specification prompt

For the Recruitment Recommendation Engine

Make the ranking explainable and configurable.

Build a Recruitment Recommendation Engine that accepts a job description and multiple resumes in PDF or DOCX format. Extract structured candidate profiles, normalize job-relevant skills, distinguish mandatory from preferred requirements, and rank candidates using configurable scoring weights. For each recommendation, display the score breakdown, matched and missing requirements, and verifiable resume evidence. Handle missing information explicitly, avoid unrelated sensitive attributes, provide recruiter review controls, and include tests for extraction accuracy, ranking correctness, fairness risks, and failure cases.

&#x20;Copy specification prompt

After specifying each product, follow the Spec Kit planning, task generation, implementation and verification workflow. Avoid skipping straight from the initial prompt to generating the whole application.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://github.github.com\&sz=32)

Spec Kit Documentation+1



## 7. How to organize the code

I recommend one monorepo initially, with shared infrastructure and independent product modules.

```
cjit-ai-suite/
├── apps/
│   └── web/                    # Next.js frontend
├── services/
│   └── api/
│       ├── app/
│       │   ├── modules/
│       │   │   ├── legal_review/
│       │   │   └── recruitment/
│       │   ├── document_parser/
│       │   ├── llm/
│       │   ├── database/
│       │   └── main.py
│       └── tests/
├── specs/
│   ├── legal-review/
│   └── recruitment/
├── evals/
│   ├── legal_review/
│   └── recruitment/
├── DESIGN.md
├── docker-compose.yml
├── .env.example
└── README.md
```

The exact directory structure can be adjusted to the output generated by Spec Kit.

Use `DESIGN.md` to document design tokens, typography, layout conventions and reusable components, which aligns with the design guidance mentioned in your presentation. Keep API keys in environment variables, never in frontend code or a committed `.env` file.

For agent skills, create reusable development instructions for the two domains—such as how to write evidence-grounded legal tests or how to evaluate ranking logic. Treat these as instructions for your coding agent, not as a substitute for implementing and testing the actual products.

## 8. How to prove that the AI actually works

A judge should not have to trust an attractive interface or an impressive-sounding answer. Show measurable evidence of correctness.

| Evaluation area    | Legal Review Assistant                           | Recruitment Engine                                                  |
| ------------------ | ------------------------------------------------ | ------------------------------------------------------------------- |
| Core accuracy      | Correct clauses and issues detected              | Relevant skills and experience extracted                            |
| Evidence integrity | Finding quotes match the original document       | Explanations match the resume                                       |
| Decision quality   | Precision and recall of annotated risks          | Precision\@5, Recall\@5 or NDCG\@5 against a reviewed ranking       |
| Failure handling   | Scanned files, missing clauses, conflicting text | Unreadable resumes, missing qualifications, different skill wording |
| Human oversight    | Findings can be confirmed or dismissed           | Scores can be reviewed and corrected                                |
| Reliability        | Stable structured outputs and useful errors      | Consistent scores for the same criteria                             |

These are suggested evaluation methods, not metrics specified by the organizers.

For the legal product, create a small evaluation set of synthetic contracts containing deliberately introduced issues alongside clean provisions. Manually annotate the expected findings and source locations.

For recruitment, create synthetic resumes and several job descriptions, then prepare a reference ranking based on explicit job requirements. Measure whether relevant candidates appear near the top and whether the supporting evidence is correct.

Also measure citation accuracy, unsupported findings, processing failures and response time. If the system fails a test, fix the implementation rather than hiding the failure behind a confident explanation.

The broader emphasis on documenting, evaluating and managing AI risks is consistent with NIST's Generative AI Risk Management Profile.&#x20;

[image](https://www.google.com/s2/favicons?domain=https://www.nist.gov\&sz=32)

NIST+1



## 9. What I would prioritize for selection

The hackathon PDF's first-page infographic presents the process as registering and selecting a use case, submitting a functioning prototype under a time limit, and receiving expert review, with results shared with partner companies for recruitment. It also emphasizes deployed applications in its career-preparation guidance.&#x20;

CJIt  Hackathon .pdf

CJIt  Hackathon .pdf



Based on that, I would prioritize the following:

1. Complete workflows over feature quantity. Each product should work from real file upload to a useful, verifiable result.
2. Evidence over generic AI prose. Display original contract clauses and resume passages beside findings and recommendations.
3. A deployable application. Give reviewers a working URL, a reliable local setup, seeded demo data and a useful README.
4. Demonstrable engineering discipline. Include the specifications, architecture, API contracts, tests and evaluation results in the repository.
5. Responsible use. Make privacy controls, review workflows, explainability and failure handling visible rather than burying them in the documentation.

One uncertainty is worth flagging: the recruitment infographic describes selecting a use case in the singular. I couldn't verify a separate public official brief specifying either a mandatory technology stack or whether one team may submit both projects. It is reasonable to develop both, but you should confirm the submission rules before treating two full products as two eligible entries. Do not assume that two partially finished applications are preferable to one polished primary submission.

## My final recommendation

Build the two products on the same Python, LLM, document-processing and database foundation, but keep their core workflows and evaluation suites separate. Start with the Legal Review Assistant's evidence-grounded findings and the Recruitment Engine's explainable ranking. Add semantic search where it directly improves those workflows, then finish deployment and evaluation.

That gives you two functional AI products while also demonstrating the specification-first, tool-assisted engineering approach taught in your second document.