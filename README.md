# Person-Sovereign Health Record (PSHR) Architecture

An open specification for a health record that the person controls: a set of ordinary folders and readable files, every entry paired with a plain-language version and stored in FHIR, complete without any platform, portable by copying, with every fact linked to its source and with AI that proposes and never decides.

**Current version: Specification v0.21 (Public Release Candidate), October 25, 2026.**
The specification is `SPEC.md`. The document history is `CHANGELOG.md`. Release copies (PDF and DOCX) are in `releases/` and attached to the [v0.21 GitHub release](https://github.com/ahendo026/person-sovereign-health-record/releases/tag/v0.21).

## What the specification defines

- The record: twenty numbered folders plus governance and environment folders, the two clocks every entry keeps and the element that carries record time, continuous data, laboratory results, life context, omics, condition and body-system views, records held on behalf of another person, education records, lifestyle logs, tasks and the pre-visit brief, and the environment folder that records how a copy is set up (Part I).
- Control and protection: who can see what, emergency access, corrections, categories protected by law as a function of jurisdiction, where the record can live, the key hierarchy and recovery scheme, and the network objects: participant identity, requests, redemption receipts, and disclosure proofs (Part II).
- Intelligence: works with any AI, context files, and what the AI is allowed to do on its own under Earned Autonomy, including the rule that the AI never controls access and never changes the model serving a task on its own (Part III).
- Context and boundaries: federal and international alignment, and what is deliberately deferred (Part IV).

Sections 2.5, 2.18, 5.4, 5.5, 6, 6.1, and 2.17 use conformance language (MUST, SHOULD, MAY), as does the write-once rule in Section 2. Everything else is architecture in plain language.

## First implementation

SHIRLe Health / HealthDigits, by Precision Health Ventures, is the first implementation. The specification is written in a neutral voice so that any implementation can conform.

## Conformance

Conformance claims are governed by `CONFORMANCE.md`: self-certification with public challenge, Core and Complete tiers, and claims bound to a specification version.

## Licensing

- Specification text: Creative Commons Attribution 4.0 International (`LICENSE`).
- Any reference code published in this repository: Apache License 2.0 (`LICENSE-CODE`).

Patent pending. The custody scheme, jurisdiction-aware protected-category recognition, Earned Autonomy governance, governed model selection, and the network objects described in this specification are the subject of a United States provisional patent application. Publication under CC BY 4.0 licenses the text; it does not license patents.

## Citing

See `CITATION.cff`.

## Related

- Earned Autonomy, the AI governance framework the specification uses: https://github.com/ahendo026/earned-autonomy

## Contact

Precision Health Ventures, Arlington, Virginia. ahenderson@theanigroup.com
