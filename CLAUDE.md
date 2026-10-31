# CLAUDE.md

Repository: person-sovereign-health-record. This is the public PSHR Architecture, the specification for the Person-Sovereign Health Record. Owner: Precision Health Ventures (PHV). Text is licensed CC BY 4.0 (LICENSE); any reference code is Apache 2.0 (LICENSE-CODE). SPEC.md is the master. releases/ holds built copies (PDF and DOCX) made from SPEC.md at each tagged version, with a short release note per version. CHANGELOG.md mirrors the document history inside SPEC.md; the history inside SPEC.md is authoritative. Conformance claims are governed by CONFORMANCE.md.

## What belongs here

Only the public specification and what supports it. Commercial and internal planning content never appears in this repository: no prices, no revenue lines, no work packages, no mechanics held back for counsel, no internal names. The PHV plan of record (the Consolidated Development Plan, the PHV Business Plan, the PSHR Implementer's Checklist, and decision records) lives in the private repository phv-plan-of-record. Where a public statement is a direction rather than a specified mechanism, the specification says so.

## Versions

1. A version exists when its tag (vX.Y) is pushed. Until then SPEC.md is a draft.
2. Every revision names its base version in the document history in SPEC.md (About This Document) and in CHANGELOG.md. CITATION.cff and README.md carry the current version and date.
3. A release build produces releases/PSHR-Architecture-vX.Y.docx and .pdf from SPEC.md (title from the H1 as metadata, body from line 2, table of contents to depth 2, tools/reference-public.docx for page numbers) and releases/vX.Y.md as the release note.

## Writing rules

- No em-dashes anywhere, including commit messages and release notes.
- Never the word "AI" twice in one sentence; name the kind of model by what it does.
- "Sealed record" is defined at first use: a record stored in a form the storage holder cannot read because every entry is encrypted with keys only the person holds. "Sealing" is the act; "unsealing" is reading under a granted key.
- Never "de-identified"; say "privacy-preserving analysis under the person's authorization".
- Avoid "canonical"; prefer "authoritative" or "single source".
- SHIRLe Health is named only as the first implementation of this specification, never as a product being sold.
- The specification speaks in a neutral voice. Where a section states testable obligations for implementers it says so and uses conformance language (MUST, SHOULD, MAY); elsewhere the text is descriptive.
- References to another section name the section number and, where the title helps the reader, its title.
