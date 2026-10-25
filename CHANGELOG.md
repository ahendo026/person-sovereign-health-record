# Changelog

All notable changes to the Person-Sovereign Health Record Architecture. The document history inside the specification is the authoritative record; this file mirrors it.

## v0.21

Folder 06 renamed from 06-observations to 06-results, with five named subfolders: labs, labs-reproductive (its own sharing boundary), vitals, device-readings (Device Readings, the continuous data of Section 2.6), and implanted-devices (Implanted Devices, formerly the implants list); the rename carries through Sections 2.1, 2.4, 2.6, 2.10, 2.11, 2.15, and 3, Appendix B, and Appendix C. New Section 2.18: laboratory results (one entry per result and one report entry per panel, standard codes and units with the as-read values retained, one series per test across every source, the abstain rule for unresolved codes, the correction rule, and the file naming and path constraints a conforming implementation follows). Section 2.5 names the record-time element in conformance language. Section 2 states that originals and filed entries are write-once. Section 6 adds the healthcare harness as a defined term and says open-weight where it said open-source. Terms added to Appendix A. Built on v0.20 of September 29, 2026.

## v0.20

New Section 2.17: the environment folder (_environment/), which holds how this copy of the record is set up: the governing jurisdiction and active law-pinned set with its change history, record settings, the AI routing map, the model registry, per-model cost and quality tallies, pending routing proposals, cryptographic configuration identifiers, and implementation identity. A change of the AI model serving a task type is never automatic (Sections 7.1 and 7.3, now four kinds of permanent protection); context files carry the routing map and the arriving model's own track record (Section 6.1). Terms added to Appendix A; the folder added to Appendix B; AI model selection, jurisdiction setting, and model registry indexed in Appendix C. This version merges two September 2026 branches that were both built on v0.18 and both numbered v0.19: the September 15 branch (Section 2.16, tasks and the pre-visit brief) is the base, and the September 27 branch (the environment folder) is carried in as Section 2.17, rebuilt from its issuing instruction and aligned to the wording filed in Provisional A Specification v1.2, Section 4. Built on v0.19 of September 15, 2026.

## v0.19

New Section 2.16: tasks as a fact class (owner, linked entry, due date, status, recorded completion), the repeat check that surfaces an existing result beside a matching new order, and the pre-visit brief that brings forward what an upcoming visit needs. Terms added to Appendix A; tasks, pending orders, questions, and the brief indexed in Appendix C.

## v0.18

New Section 5.5: disclosure proofs, requests, and participant identity. Grants are delivered only to verifiable participant identities; requests are signed objects that confer no access until the person approves; redemption receipts are content-free, independently verifiable proofs of authorized disclosure, anchored to the access history and available to both parties; disclosure proofs state a defined fact derived from the record without revealing the entries beneath it, with refusal indistinguishable from inability. Terms added to Appendix A; requests and receipts indexed in Appendix C.

## v0.17

New folder 19 and Section 2.15: self-directed training, nutrition, mindfulness, and recovery logs, held under a named lifestyle boundary that also covers self-tracked content elsewhere in the record. New non-clinical support role (coach, trainer, dietitian) in Section 4. Lifestyle targets are permanently non-graduating. Financial folder references corrected from 10 to 11 in Sections 2.9 and 2.10.

## v0.16

Extraction provenance: every AI-derived entry records the model that produced it (Section 3). Algorithm agility and post-quantum protection added to the key hierarchy (new Section 5.4.6; the closing subsections renumber to 5.4.7 and 5.4.8), with the long-horizon threat stated in Section 5.1. Context files added: how an AI learns the record before it reads it (Section 6.1). Terms added to Appendix A; cover date corrected.

## v0.15

New Section 2.14: body-system views, a seventh view type compiling the record across all folders by physiological system, with inflammation and immune status as a cross-system layer rather than a system of its own.

## v0.14

New Section 5.4: the key hierarchy, recovery phrase, threshold shares, and portable control designations that enforce Section 5.1 and make protection portable across implementations, in conformance language. Terms appendix restored to one place and extended.

## v0.13.3

Section 2.6 app-screen rule extended: the shape of a trace is part of the fact (zones, peaks, phases, target bands, time in range); chart-relative times anchor to calendar time; captures taken over weeks reconcile into one longitudinal series, with no agreement from the app’s maker required.

## v0.13.2

Cross-references in the appendices now carry page numbers, and index entries that are permissions or views rather than filed documents say so plainly.

## v0.13.1

Appendix B is now the complete record organization in one table; the filing index becomes Appendix C.

## v0.13

Filing index appendix added. Terms appendix retitled Appendix A. (v0.12.1 named microbiome profiles and uncoded experimental care.)

## v0.12

Records held on behalf of another person (Section 2.12: guardians, shared and contested custody, transition of control at a per-record age of majority). Jurisdiction-aware law-pinned classes and international alignment rows (GDPR Article 9, UK GDPR, PIPEDA, PDPA). Folder 18 for education and developmental support records (FERPA note). Section 2.11 extended to functional and developmental status on the WHO ICF framework, with goals as a distinct fact class. Provenance sufficient for recognition across borders. Translation as a typed derived layer (Section 5.3). ICD-11 and SNOMED CT named alongside US claim codes.

## v0.11

SHIRLe Health described at first mention. Earned Autonomy governance named in Section 1. “First-class” defined. Patients and caregivers lead the archetype list. Out-of-clinic share of health stated in 2.7. Manual entry added to Section 3. Section 5 placed under the governance layer.

## v0.10

Federal SDOH hooks added (USCDI elements, Z-codes, CMS screening programs). SMART Health Link QR made explicit in Part II. Vision, hearing, and dental promoted to folder 17 (Section 2.10). Mobility and daily function added (Section 2.11).

## v0.9

Section 1.1 reframed around the inclusive design methodology. Readability pass on Sections 2.6 through 2.9.

## v0.8

Condition view added (Section 2.9): per-condition compilation across folders including costs, with AI-inferred condition links entering only as proposals.

## v0.7

Reorganized into four parts with this section added. Life context (social determinants of health) and genomic/omics data added as folders 15 and 16. Accessibility commitment added (Section 1.1). EHI exports elevated throughout. App-screen extraction clarified for annotated stream captures. Ingested document types enumerated.

## v0.6 to v0.6.1

How the record understands time (event time and record time; the five time questions; order versus cause). Continuous data: streams, computed values, baselines, trends, departures.

## v0.5 to v0.5.2

Neutral specification voice with SHIRLe Health as first implementation. Bulk import via EHI export. Protection model across tiers. Several people on one device.

## v0.4 to v0.4.1

Federal alignment (CMS Health Tech Ecosystem, TEFCA, RAISE, ACL Caregiver AI Prize, HHS AI Strategy, 42 CFR Part 2). Caregivers on the care team. Categories protected by law.

## v0.3

Journal, directives, family history folders. Emergency access. Corrections and disputes. Deferred decisions named.

## v0.1 to v0.2

Initial architecture, rewritten person-first with earned trust AI governance.

