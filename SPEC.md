# Person-Sovereign Health Record Architecture

**Specification v0.20 (First Public Release Candidate)**  
First implementation: SHIRLe Health / HealthDigits  
Precision Health Ventures, September 29, 2026  
License: CC BY 4.0 (specification text). Patent pending.

## Table of Contents

- About This Document
- Part I: The Record
  - 1. What This Is and Why It Matters
    - 1.1 Built Through Inclusive Design
  - 2. How the Record Is Organized
    - 2.1 Your Journal
    - 2.2 Legal Documents and Your Wishes
    - 2.3 Caregivers on the Care Team
    - 2.4 Family History and Implanted Devices
    - 2.5 How the Record Understands Time
    - 2.6 Continuous Data: Glucose Monitors, Wearables, and Workouts
    - 2.7 Life Context: The Conditions Your Health Lives In
    - 2.8 DNA and Other Molecular Profiles
    - 2.9 Seeing the Record by Condition
    - 2.10 Vision, Hearing, and Dental
    - 2.11 Functional and Developmental Status
    - 2.12 Records Held on Behalf of Another Person
    - 2.13 Education and Developmental Support Records
    - 2.14 Seeing the Record by Body System
    - 2.15 Training, Nutrition, Mindfulness, and Recovery
    - 2.16 Before the Visit: Tasks, Repeats, and What to Bring
    - 2.17 The Environment Folder: How This Copy Is Set Up
  - 3. How Information Gets In
    - 3.1 Bulk Import: Seeding the Record from a Full Medical Record Export
- Part II: Control and Protection
  - 4. Who Can See What
    - 4.1 Emergency Access
    - 4.2 Corrections and Disputes
    - 4.3 Categories Protected by Law, Not Just by Choice
  - 5. Where the Record Can Live, and How It Travels
    - 5.1 How the Record Is Protected
    - 5.2 Several People, One Device
    - 5.3 When the Record Crosses Languages
    - 5.4 Key Hierarchy, Recovery, and Control Designations
    - 5.5 Disclosure Proofs, Requests, and Participant Identity
- Part III: Intelligence
  - 6. Works With Any AI
    - 6.1 Context Files: How an AI Learns the Record
  - 7. What the AI Is Allowed to Do on Its Own
    - 7.1 What Requires Approval
    - 7.2 The Approval Gate and the Trust Record
    - 7.3 Protected Categories: Yours and the Law’s
- Part IV: Context and Boundaries
  - 8. How This Fits the Broader Program and the Federal Landscape
  - 9. Decisions Deferred on Purpose
- Appendix A: Terms Used in This Document
- Appendix B: The Record at a Glance
- Appendix C: Where Things Go, A Filing Index

# About This Document

This specification is organized in four parts. Part I (Sections 1 to 3) describes the record itself: what it is, how it is organized, and how information gets into it, including the complete medical record exports (EHI exports) that federal law entitles every person to and that this architecture is built to receive. Part II (Sections 4 and 5) covers control and protection: who can see what, and how the record is protected wherever it lives. Part III (Sections 6 and 7) covers intelligence: how any AI can work with the record and what the AI is allowed to do on its own. Part IV (Sections 8 and 9) places the architecture in its program and federal context and names what is deliberately deferred. Appendices define terms, show the record at a glance, and index where things go.

**Document history:**

v0.20: New Section 2.17: the environment folder (_environment/), which holds how this copy of the record is set up: the governing jurisdiction and active law-pinned set with its change history, record settings, the AI routing map, the model registry, per-model cost and quality tallies, pending routing proposals, cryptographic configuration identifiers, and implementation identity. A change of the AI model serving a task type is never automatic (Sections 7.1 and 7.3, now four kinds of permanent protection); context files carry the routing map and the arriving model's own track record (Section 6.1). Terms added to Appendix A; the folder added to Appendix B; AI model selection, jurisdiction setting, and model registry indexed in Appendix C. This version merges two September 2026 branches that were both built on v0.18 and both numbered v0.19: the September 15 branch (Section 2.16, tasks and the pre-visit brief) is the base, and the September 27 branch (the environment folder) is carried in as Section 2.17, rebuilt from its issuing instruction and aligned to the wording filed in Provisional A Specification v1.2, Section 4. Built on v0.19 of September 15, 2026.

v0.19: New Section 2.16: tasks as a fact class (owner, linked entry, due date, status, recorded completion), the repeat check that surfaces an existing result beside a matching new order, and the pre-visit brief that brings forward what an upcoming visit needs. Terms added to Appendix A; tasks, pending orders, questions, and the brief indexed in Appendix C.

v0.18: New Section 5.5: disclosure proofs, requests, and participant identity. Grants are delivered only to verifiable participant identities; requests are signed objects that confer no access until the person approves; redemption receipts are content-free, independently verifiable proofs of authorized disclosure, anchored to the access history and available to both parties; disclosure proofs state a defined fact derived from the record without revealing the entries beneath it, with refusal indistinguishable from inability. Terms added to Appendix A; requests and receipts indexed in Appendix C.

v0.17: New folder 19 and Section 2.15: self-directed training, nutrition, mindfulness, and recovery logs, held under a named lifestyle boundary that also covers self-tracked content elsewhere in the record. New non-clinical support role (coach, trainer, dietitian) in Section 4. Lifestyle targets are permanently non-graduating. Financial folder references corrected from 10 to 11 in Sections 2.9 and 2.10.

v0.16: Extraction provenance: every AI-derived entry records the model that produced it (Section 3). Algorithm agility and post-quantum protection added to the key hierarchy (new Section 5.4.6; the closing subsections renumber to 5.4.7 and 5.4.8), with the long-horizon threat stated in Section 5.1. Context files added: how an AI learns the record before it reads it (Section 6.1). Terms added to Appendix A; cover date corrected.

v0.15: New Section 2.14: body-system views, a seventh view type compiling the record across all folders by physiological system, with inflammation and immune status as a cross-system layer rather than a system of its own.

v0.14: New Section 5.4: the key hierarchy, recovery phrase, threshold shares, and portable control designations that enforce Section 5.1 and make protection portable across implementations, in conformance language. Terms appendix restored to one place and extended.

v0.13.3: Section 2.6 app-screen rule extended: the shape of a trace is part of the fact (zones, peaks, phases, target bands, time in range); chart-relative times anchor to calendar time; captures taken over weeks reconcile into one longitudinal series, with no agreement from the app’s maker required.

v0.13.2: Cross-references in the appendices now carry page numbers, and index entries that are permissions or views rather than filed documents say so plainly.

v0.13.1: Appendix B is now the complete record organization in one table; the filing index becomes Appendix C.

v0.13: Filing index appendix added. Terms appendix retitled Appendix A. (v0.12.1 named microbiome profiles and uncoded experimental care.)

v0.12: Records held on behalf of another person (Section 2.12: guardians, shared and contested custody, transition of control at a per-record age of majority). Jurisdiction-aware law-pinned classes and international alignment rows (GDPR Article 9, UK GDPR, PIPEDA, PDPA). Folder 18 for education and developmental support records (FERPA note). Section 2.11 extended to functional and developmental status on the WHO ICF framework, with goals as a distinct fact class. Provenance sufficient for recognition across borders. Translation as a typed derived layer (Section 5.3). ICD-11 and SNOMED CT named alongside US claim codes.

v0.11: SHIRLe Health described at first mention. Earned Autonomy governance named in Section 1. “First-class” defined. Patients and caregivers lead the archetype list. Out-of-clinic share of health stated in 2.7. Manual entry added to Section 3. Section 5 placed under the governance layer.

v0.10: Federal SDOH hooks added (USCDI elements, Z-codes, CMS screening programs). SMART Health Link QR made explicit in Part II. Vision, hearing, and dental promoted to folder 17 (Section 2.10). Mobility and daily function added (Section 2.11).

v0.9: Section 1.1 reframed around the inclusive design methodology. Readability pass on Sections 2.6 through 2.9.

v0.8: Condition view added (Section 2.9): per-condition compilation across folders including costs, with AI-inferred condition links entering only as proposals.

v0.7: Reorganized into four parts with this section added. Life context (social determinants of health) and genomic/omics data added as folders 15 and 16. Accessibility commitment added (Section 1.1). EHI exports elevated throughout. App-screen extraction clarified for annotated stream captures. Ingested document types enumerated.

v0.6 to v0.6.1: How the record understands time (event time and record time; the five time questions; order versus cause). Continuous data: streams, computed values, baselines, trends, departures.

v0.5 to v0.5.2: Neutral specification voice with SHIRLe Health as first implementation. Bulk import via EHI export. Protection model across tiers. Several people on one device.

v0.4 to v0.4.1: Federal alignment (CMS Health Tech Ecosystem, TEFCA, RAISE, ACL Caregiver AI Prize, HHS AI Strategy, 42 CFR Part 2). Caregivers on the care team. Categories protected by law.

v0.3: Journal, directives, family history folders. Emergency access. Corrections and disputes. Deferred decisions named.

v0.1 to v0.2: Initial architecture, rewritten person-first with earned trust AI governance.

# Part I: The Record

## 1. What This Is and Why It Matters

This document describes an architecture for storing a person’s health record so that the person, not a hospital or a software vendor, is in control of it. SHIRLe Health / HealthDigits, Precision Health Ventures’ patient-controlled health data platform (SHIRLe Health is the platform; HealthDigits is its capture and device-data layer), is the first implementation of this specification. Throughout, the AI’s conduct is governed by the Earned Autonomy framework (Section 7): the AI proposes, the person approves, every action is remembered, and autonomy is earned, never granted. The record is designed around a right most people have never used: federal rules entitle you to a complete export of your electronic health information (an EHI export) from every certified provider system, and this architecture exists to turn those exports, along with everything else you capture, into a record that is finally yours. The record is kept as a set of ordinary folders and readable files. A patient, a family member with authority to act for them, or a reviewer can open the record and read it without any special software. Behind that readable layer, every entry is also stored in FHIR, the healthcare industry’s standard data format, so the record can be shared with any doctor, hospital, or health app that speaks that standard.

Four commitments shape the design:

- You can read it. Every technical entry in the record is paired with a plain-language version, generated automatically so the two never drift apart.
- You can take it with you. The record is a self-contained set of files. It can live on your own computer, on a care facility’s system, or in a protected cloud service, and moving it is as simple as copying it. Nothing about it has to change when it moves.
- Everything shows its source. No fact appears in the record without a link back to where it came from: the photographed visit summary, the lab report, the device reading. When the AI estimated a value rather than reading it directly, the record says so.
- The AI never controls access. Decisions about who can see what are made by simple, predictable software rules that behave the same way every time, never by AI judgment. The AI helps interpret and organize the record; it is never the gatekeeper.

### 1.1 Built Through Inclusive Design

This architecture was built through an inclusive design methodology: it was shaped with the people who experience the most friction in healthcare, not merely for them. The project’s co-design program recruits participants across nine experience archetypes (first among them patients managing many conditions at once and the caregivers who direct care for someone else, alongside screen reader users, people with motor impairments, and others), and they test on their own devices, with their own assistive technology, against real tasks. Inclusive design’s central lesson is that solving for the situations of greatest stress produces a better design for everyone, the way curb cuts, made for wheelchairs, ended up serving strollers, carts, and travelers alike.

That methodology shaped the architecture’s most basic choices. The record is readable text because text is the format assistive technology handles best: screen readers, braille displays, magnification, and voice control all work with it natively. Every entry has a plain-language version, generated automatically so it is never out of date, serving people with cognitive disabilities, low literacy, or simply no medical training. The representative and caregiver roles (Section 4) are first-class (built into the foundation, not added on top) because many people direct their care through others, and doing so must never mean losing ownership of the record. Capture by photo (Section 3) exists in part because gathering and retyping paper records is the kind of burden that falls hardest on people managing complex conditions. And summaries, approval questions, and views can each be read, listened to, enlarged, or simplified. Nothing in this record requires fine motor control, vision, hearing, or medical vocabulary to own and control.

## 2. How the Record Is Organized

The record is a set of numbered folders, one per area of a person’s health, plus a small set of governance folders that hold the rules about access and permissions. Each health folder holds the industry-standard entries alongside their plain-language versions.

```
health-record/
 IDENTITY.md whose record this is
 CONTEXT.md the map: which questions go to which folder
 _governance/ sharing permissions, roles, AI permissions,
 emergency access rules, access history
 _environment/ how this copy is set up: jurisdiction, settings,
 AI routing map, model registry, algorithm identifiers
 _reference/ medical code references and conventions
 00-inbox/ items captured but not yet filed, including
 visit records returned by providers
 01-demographics/ who you are, contact details, insurance identity
 02-care-team/ your doctors, clinics, providers, and the
 caregivers and family members on your team
 03-conditions/ diagnoses and allergies; dental kept separate
 04-medications/ prescriptions; vitamins and supplements kept separate
 05-immunizations/ vaccines
 06-observations/ lab results, vitals, device and wearable data,
 questionnaires; implants/ lists devices in your body
 07-procedures/ surgeries and procedures
 08-encounters/ visits and hospital stays
 09-documents/ original scans, photos, files, clinician notes
 10-care-plans/ treatment plans, goals, referrals, pending orders
 11-financial/ insurance claims and billing
 12-journal/ your own diary entries and notes, in your words
 13-directives/ advance directives, healthcare power of attorney,
 organ donor status, legacy instructions
 14-family-history/ health history of your relatives
 15-life-context/ housing, food, transportation, work, and
 support: the conditions your health lives in
 16-omics/ DNA and other molecular profiles
 17-vision-hearing-dental/ eyes, ears, and teeth: the records
 that live outside medical systems
 18-education-support/ school and developmental support records:
 IEPs, EHCPs, 504 plans, school assessments
 19-lifestyle/ self-directed training, nutrition, mindfulness,
 and recovery logs, and the goals you set
```

Organizational choices that matter to the person who owns the record:

- Categories you might want to share separately get their own folder. Vaccine records, reproductive health labs, behavioral health content, dental records, your journal, and your family’s history are kept structurally apart, so you can share one without exposing the others.
- The inbox shows what is waiting. Anything sitting in 00-inbox has been captured (a photo of a visit summary, or a visit record a provider sent back after check-in) but not yet filed. You can see the system’s to-do list just by looking.
- Originals are never thrown away. Folder 09 keeps every scan and photo permanently, so any entry in the record can always be checked against the document it came from.
- The record looks forward as well as back. Referrals that have been placed but not yet scheduled, and orders that are pending, live in 10-care-plans, so the question “what is supposed to happen next” always has an answer.
- Rules and setup are kept apart. A line that answers “who is allowed to do what” lives in _governance; a line that answers “how is this record set up” lives in _environment (Section 2.17). Keeping them apart means the rulebook never fills with configuration, and moving the record to a new implementation carries its setup without carrying anyone's authority.

### 2.1 Your Journal

Folder 12 is the one part of the record you author entirely yourself: diary entries, symptom notes in your own words, questions you want to ask at the next appointment, observations about a family member you care for. It is a first-class folder for two reasons. First, it is independently shareable: you can show your journal to a therapist but not your cardiologist, or share your clinical record widely while keeping the journal fully private. Second, it gives the AI honest context for questions like “when did I start feeling this way,” with the answer’s source link pointing to your dated entry. The AI never rewrites or restructures journal text; it is your writing, permanently, exactly as you wrote it. If the AI notices something clinically meaningful in an entry (for example a note that suggests a medication side effect), that observation follows the normal rules in Section 7: it becomes a suggestion awaiting your approval, never a silent change to the record. Notes written by clinicians are not journal content; they live in 09-documents. Structured self-tracking with numbers and scales lives in 06-observations, and self-directed training, nutrition, and recovery logs live in 19-lifestyle (Section 2.15).

### 2.2 Legal Documents and Your Wishes

Folder 13 holds advance directives, a living will, healthcare power of attorney, organ donor status, and instructions about who should receive custody of the record. These are the documents that establish the authority of your representative (the role defined in Section 4), and they are the papers that matter most in a crisis, so they are kept together, current, and clearly marked. This folder is also where you can record what should happen to the record itself after your death, so that question never falls to guesswork.

### 2.3 Caregivers on the Care Team

Folder 02 names not only your doctors and clinics but also the people who care for you: a spouse, an adult child, a friend who drives you to appointments. Recording a caregiver in the care team does two things. Inside SHIRLe, it connects their access permissions to a named person with a stated role. Outside SHIRLe, it means that when your record is shared with a provider, the caregiver’s role travels with it, so the clinic knows who helps you manage your care without you having to explain it at every visit. Federal caregiving policy has called for exactly this kind of caregiver identification in health records; here it is achieved from the patient’s side, under the patient’s control.

### 2.4 Family History and Implanted Devices

Folder 14 holds the health history of your relatives (for example a parent’s heart disease or a sibling’s cancer), which clinicians routinely need and which deserves its own sharing boundary because it is partly information about other people. The implants list inside 06 records any device in or on your body (a pacemaker, an insulin pump, a stent, a joint replacement), including safety details such as imaging compatibility, kept separate from the data streams those devices may produce.

### 2.5 How the Record Understands Time

A health record is not a pile of facts; it is facts arranged in time, and the record keeps that arrangement explicit. Every entry carries two times, because they answer different questions. Event time is when something was true: the day the medication started, the morning the blood pressure was taken. Record time is when the record learned it: the day the visit summary was photographed, the moment the lab export arrived. Keeping both is what makes honesty possible later. A correction does not erase history; it shows that the record believed one thing until a certain date and something better afterward. And the record can answer “what did my doctors know last March” separately from “what was actually happening to me last March,” which are different questions with different answers more often than people expect.

On top of those two clocks, the record recognizes that health information asks five kinds of time questions, and it is organized to answer each one directly:

- What happened. Events: a visit, a procedure, a lab draw. Each is anchored to its date and its source.
- In what order. Sequences: the third blood pressure medication tried after two others did not work. Order is often the clinical story.
- What is true now. Current state: the medications you are actually on, the conditions that are active rather than resolved. Most everyday questions are this kind, and answering them should never require wading through twenty years of history.
- What repeats. Routines: twice-daily doses, weekly injections, quarterly labs. These are how the record understands adherence and schedules.
- What happens next. The expected future: the referral not yet scheduled, the refill coming due, the follow-up in six weeks. This is the part of a record most systems lose and most people most need.

The record’s summaries are built from these five kinds directly. A visit summary answers what happened. A timeline answers in what order. Your health summary answers what is true now and what happens next, together, which is what a person actually wants from the question “where do things stand.” A schedule view answers what repeats. The emergency summary (Section 4.1) is pure current state with no history at all, because a crisis needs now, not then.

One honest boundary: the record treats order and cause differently. That the dizziness began two days after a new medication is a fact of order, and the AI may point that order out to you. That the medication caused the dizziness is a claim, and claims enter the record only the way every suggestion does (Section 7): proposed, attributed, and waiting for approval. The record will show you sequences freely and assert causes never.

### 2.6 Continuous Data: Glucose Monitors, Wearables, and Workouts

Some sources do not produce facts one at a time; they produce a signal. A glucose monitor reports around the clock, a wearable tracks heart rate and sleep all night, a workout records second by second. The record handles these differently from single facts, in five ways.

Raw readings are kept; summaries are shown. The readings themselves are stored in daily and weekly blocks as the permanent evidence layer, the same role original scans play for documents. What you see when you open the folder is the readable layer built on top: plain-language daily and weekly summaries, with the raw detail always one step below if you or your clinician want it.

Calculated numbers are a third kind of fact. Alongside values read directly from a source and values the AI estimated, the record recognizes computed values: numbers produced by a fixed, named calculation, such as time in healthy glucose range. Rerunning the same calculation on the same readings gives the same answer, so computed values file automatically, and each records which calculation, and which version of it, produced it. If readings arrive late (devices often sync after the fact), the affected summaries are simply recomputed, and the record’s two clocks (Section 2.5) keep both the before and the after visible.

Analysis produces three things, kept distinct. Your baseline: what is normal for you, such as your typical overnight glucose. Your trends: which direction things are moving, such as a resting heart rate drifting upward over six weeks. Your departures: the moments that differ from your own normal. Departures usually matter most, to you and especially to a caregiver, whose real question is rarely a single number and almost always “is the pattern changing.”

A photographed app screen is more than a curve. A screen like a glucose graph usually shows an exact current reading, events the person logged (a lunch at 1:40 with the foods named), and the response that followed. Each part is filed as what it is: the displayed number as a directly read value, the logged events as events, the curve as an estimated window marked as read from an image, and the pairing of event and response as order, never as cause. And the shape of the curve is itself part of the fact: the zones a reading moved through, the peaks, the phases of the day, the target band drawn on the chart, and the share of time spent inside it (time in range) all carry clinical meaning that a single displayed number does not, so the record keeps them rather than discarding them. When the device’s own stream later arrives for the same period, the denser source is preferred and the overlap is shown rather than silently merged.

Snapshots become a timeline. A chart on a screen speaks in its own clock (“3pm,” “yesterday,” “last 7 days”); the record anchors those to actual calendar dates and times, so a screenshot does not float, it takes its place on the timeline. And captures taken across weeks, from the same app or several, reconcile into one coherent longitudinal series rather than a pile of unrelated images, with daily and weekly summaries built on top like any other stream. None of this requires any agreement with the app’s maker: the person’s own screen, photographed by the person, is a source the person fully controls, which is the point of a sovereign record.

The rule from Section 2.5 holds here with full force: the record may show you that two things moved together in time, but a claim about cause enters the record only as a suggestion awaiting your approval. And when the AI answers questions, it works from your baselines, trends, and departures, reaching into the raw readings only when a question truly needs them, which is part of what keeps a fully private AI on your own computer workable against years of continuous data.

### 2.7 Life Context: The Conditions Your Health Lives In

Health does not happen only in clinics; by most estimates, well over 80 percent of what shapes a person’s health happens outside clinical care. Housing stability, food security, transportation, work and its exposures, social support, and safety at home shape health outcomes as strongly as most treatments, and clinicians increasingly screen for them (the healthcare field calls these social determinants of health). Folder 15 gives this information a home of its own.

It also gets its own sharing boundary, because this is among the most personal content a record can hold and among the most consequential to share: the same fact that helps a care team arrange transportation or food support could harm the person in other hands. Life context is therefore a permanent candidate for the strictest protections you can set: locked to suggestion-only for AI filing (Section 7.3), excluded from every export by default, and shareable only through a permission that names it explicitly. When a clinic’s screening questionnaire arrives in an export, its answers file here, behind this boundary, not into the general record.

Federal health policy is moving the same direction. The national data standard that governs what EHI exports contain (USCDI) now includes social determinants elements, so screening answers increasingly arrive in exports and route here automatically. Clinicians record these needs with dedicated diagnosis codes (the ICD-10-CM Z55 through Z65 range), which the record keeps like any other code. And CMS programs increasingly require or reward screening for health-related social needs, which means this folder will fill whether or not a person ever types a word into it. The boundary exists precisely because the inflow is now routine.

### 2.8 DNA and Other Molecular Profiles

Genomic results (from clinical genetic tests or consumer DNA services), microbiome profiles, and other molecular results are unlike everything else in the record in three ways: they do not change, they are partly information about your blood relatives, and they can affect how others treat you in ways the law only partly forbids. Folder 16 holds them under rules that respect all three.

Because DNA does not change but its meaning does, the raw profile is evidence-layer content, stored like an original document: kept whole, never edited. Interpreted findings (a specific variant and what it is understood to mean, as of a stated date) are filed as entries that cite the profile, so understanding can improve over time without ever touching the source.

Because the information reaches beyond you, the folder carries its own permanent sharing boundary: excluded from every export by default, never included in a broad grant, shareable only by a permission that names it. Whenever sharing is considered, the record states plainly that granting access to your genome discloses something about your parents, siblings, and children, who never agreed. Federal law (GINA) restricts some uses of genetic information; the folder boundary is the protection you hold regardless of where the law’s lines fall.

### 2.9 Seeing the Record by Condition

A serious illness spreads across the whole record: visits in encounters, chemotherapy in medications, staging in conditions, scans in imaging, referrals in care plans, bills in insurance and billing. The record keeps every fact in its domain folder (one home per fact, because the same lab often serves two conditions), and compiles a condition view on top: for a named condition, everything related, in one place, in time order. Visits, procedures, medications, labs, imaging, referrals, and what is next. The view includes the money: explanations of benefits and bills from folder 11 that link to the condition appear in the same view, so the question “what has this illness involved, and what has it cost” finally has an answer in one place. The record keeps the standard codes its sources carry (diagnosis codes, procedure codes, lab and medication codes) alongside every entry, in whichever code systems the sources used: SNOMED CT and ICD-11 internationally, with ICD-10-CM and CPT/HCPCS retained for United States claims and insurance linkage, because those codes are how documents state their connections: a bill names the procedure it charges for and points at the diagnosis that justified it, and the condition view reads exactly those pointers to assemble the cost picture.

Condition links follow the record’s standing honesty rules. When a source document itself states the connection (a visit whose stated reason is the condition, a medication prescribed for it), the link applies automatically, because the record is only repeating what the source said. When the connection is a judgment (is the fatigue from the illness or from its treatment), a link the AI infers is a proposal like any other claim, waiting for approval. A bounded course of illness can also be grouped as an episode (the record’s equivalent of “the 2027 cancer treatment”), so that years later the whole arc opens as one story. The condition view joins the five views of Section 2.5 as a sixth: it is a compiled answer, generated from the tree, scoped by the same permissions as everything else.

### 2.10 Vision, Hearing, and Dental

Eyes, ears, and teeth live in separate provider ecosystems that rarely connect to medical record systems at all: an optometrist, an audiologist, and a dentist each keep their own records, and none of them typically appears in a hospital’s export. Folder 17 gives this care a home. It holds eyeglass and contact lens prescriptions, exam results, audiograms, hearing aid records and settings, dental charts, treatment plans, and the bills and insurance records those visits generate (linked to folder 11 like any other cost). Because these providers rarely offer exports, photographing the paper is usually the way this content arrives, which is exactly what the capture path (Section 3) was built for. Corrective devices with clinical significance (hearing aids, dentures, implanted dental work) are listed alongside the implants of Section 2.4.

### 2.11 Functional and Developmental Status

How a person moves through the world and manages daily life is health information, and federal data standards treat it as such (functional status is a standard element of the same rules that govern exports). The record files it in the observations folder as its own conventions: gait and balance, falls and near-falls, mobility equipment (wheelchairs, walkers, canes, and their specifications, kept with the device list), what daily activities require assistance and how much, and changes over time, which the record’s trend machinery (Section 2.6) treats like any other signal worth watching. This content matters most to the people the inclusive design methodology centers: it is what a caregiver needs to coordinate help, what disability documentation draws on, and what a new clinician most needs to know and is least likely to find in a hospital export.

The record organizes this content on the World Health Organization’s International Classification of Functioning, Disability and Health (the ICF), the international framework that describes health in terms of body function, activity, and participation rather than diagnosis alone. Using an international frame matters because functional status is exactly the content that must survive a move between countries and systems.

Developmental and therapy goals are their own kind of fact, distinct from the continuous streams of Section 2.6. Each goal entry carries the goal itself, the starting point when it was set, the target, dated progress observations, who assessed progress, and which instrument they used. Departures from the expected trajectory are surfaced the same way stream departures are (Section 2.6), because the caregiver’s question is the same: is the pattern changing.

### 2.12 Records Held on Behalf of Another Person

Many records begin in someone else’s hands. A parent creates a child’s record; a guardian or an agent under power of attorney controls an adult’s. The record treats this as a normal lifecycle, not an exception. The person the record is about is always its owner; the person controlling it holds a named, recorded role in the record’s own permissions (the representative of Section 4), and every action they take is logged under their own name.

Two guardians can each hold independent authority. Each guardian’s grants and actions are logged separately, and neither can remove or reduce the other’s authority on their own: any change to who controls the record is a recorded control event, visible permanently in the access history. This is what makes the record safe in shared and contested custody: the record does not take sides, it keeps a complete, separately attributed account of what each guardian did, and control changes only through recorded events that both the history and, where applicable, a court can read.

Control transfers when the person comes of age, and the record does not hardcode what that means. The age of majority varies by jurisdiction, so it is a setting of the record itself, and the handover is a recorded control transition, the same machinery Section 5.2 uses for households. Before that day, the record can grow with the person: a maturing minor can be given their own increasing view and voice in the record where the governing jurisdiction recognizes it (some legal systems call this mature minor or Gillick competence), recorded like every other permission. The same shape runs in reverse when a power of attorney takes effect for an adult, and runs forward again if capacity returns.

### 2.13 Education and Developmental Support Records

For a child receiving developmental support, and for many adults in supported settings, the school system generates as much consequential record as the clinic does: individualized education programs (IEPs in the United States, EHCPs in England), 504 accommodation plans, school psychological and developmental assessments, in-school therapy plans and progress notes, and correspondence with school liaisons. Folder 18 gives these a first-class home. In the United States these are education records governed by FERPA rather than health records governed by HIPAA; they live under a different law, held by different institutions, and rarely meet the medical record at all. The PSHR treats them as part of the person’s one record regardless of which law governs the institution that produced them, because the family’s reality is one child, one story. When a family moves between school systems or countries, this folder is what lets the new system see what was assessed, what was planned, and what worked, without starting over.

### 2.14 Seeing the Record by Body System

The condition view of Section 2.9 answers a question about something already named: tell me about my diabetes. A different and equally common question has no diagnosis attached to it: how is my heart doing, across everything, including things no one has labeled yet. The record answers that with body-system views, which compile the whole longitudinal record through a physiological lens rather than reproducing the traditional chart’s organization by encounter and specialty.

Seven systems are recognized:

- Cardiovascular: blood pressure, heart rate and rhythm, lipids, vascular risk.
- Metabolic and endocrine: glucose, insulin resistance, A1c, weight and body composition, thyroid.
- Musculoskeletal: joints, bones, muscle, mobility and strength, pain, injuries and surgeries.
- Neurologic and cognitive: brain and nerves, cognition, headaches, balance, sleep-related neurologic signals.
- Respiratory: lungs and breathing, oxygenation, respiratory fitness.
- Gastrointestinal and hepatic: digestion, gut, liver, nutrition-related markers.
- Renal and genitourinary: kidneys, urinary system, hydration and electrolytes, relevant reproductive and urologic measures.

Each view cuts across every folder: labs, medications, symptoms and journal entries, diagnoses, procedures, imaging, device and wearable streams, and the baselines, trends, and departures computed from them (Section 2.6). What the person sees is one system’s whole story over time, including the years before anything was diagnosed, which is the part a chart organized by visit can never assemble.

Inflammation and immune status is a layer, not an eighth system. It affects cardiovascular, metabolic, musculoskeletal, and other systems at the same time, so the record treats it the way it treats other derived layers: it surfaces within each system view where it bears on that system, rather than standing alone as a view of its own.

Three rules keep body-system views honest with the rest of the record. Assignment follows the standing rule on links: when the coding a source carries places a fact in a system (a lipid panel is cardiovascular by its own lab code), the assignment is automatic, because the record is only reading what the source said; when the connection is a judgment, it is an AI proposal awaiting approval, exactly like a condition link. Overlap is expected rather than resolved: A1c belongs to the metabolic view and the cardiovascular view both, and a fact appearing in two views is correct behavior, because views are questions asked of the tree, not places where things are filed. And consent scoping applies unchanged: a system view reaches only as far as the viewer’s grant allows, and content behind a boundary (folders 15, 16, and 19, and law-pinned classes) never enters a view that does not name it.

Body-system views join the five temporal views of Section 2.5 and the condition view of Section 2.9 as a seventh type: compiled answers, generated from the tree on demand, scoped by the same permissions as everything else.

### 2.15 Training, Nutrition, Mindfulness, and Recovery

Much of what a person does for their own health never passes through a clinic: the training block they are working through, what they eat, the meditation practice they keep, and how well they are recovering. Folder 19 holds this self-directed work: workout and training logs, nutrition and hydration logs, sleep routine and quality as the person tracks it, mindfulness and meditation sessions, recovery signals such as heart rate variability, resting heart rate, training load, soreness and rest days, and the goals the person set for themselves, recorded in the same shape as the goals of Section 2.11 (goal, starting point, target, dated progress, who assessed it, which instrument).

Source and purpose decide, not the device. The same wrist sensor can produce clinical evidence and self-tracking, so the rule is about how the data is used, not what produced it. Anything a clinician ordered, or reads as clinical evidence, belongs in observations: a sleep study, a cardiac rehabilitation plan, a home blood pressure series a physician asked for. Anything the person is doing for themselves belongs here: a self-directed training block, a food diary, a meditation streak. When self-tracked content becomes clinically relevant, it is not moved; the clinical views simply reach into this folder like any other.

The lifestyle boundary. Folder 19 carries a named sharing boundary, and that boundary is wider than the folder: it also covers self-tracked content held elsewhere in the record, so that a person sharing “my training and recovery data” shares a coherent set rather than one folder’s worth. Like the boundaries on life context and omics, it is excluded from clinical grants by default. A cardiologist receiving a grant does not receive a food diary unless the person names it.

A recipient the record has not needed until now. This content is often shared with someone who is not a clinician at all: a trainer, a coach, a dietitian, a wellness practitioner. Section 4 therefore recognizes a non-clinical support role, scoped to the lifestyle boundary and to nothing else by default. A coach can be given training and recovery data with no path to conditions, medications, or any clinical folder, and every view they take is written to the access history like any other.

Lifestyle targets never graduate. Section 7 allows categories of AI filing to earn automatic handling through a track record. Lifestyle targets are permanently excluded from that, in the same category as estimated values: calorie targets, training loads, fasting windows, and similar numbers always wait for the person’s approval, no matter how long the track record is. The reason is plain. Automation that quietly tightens a target can reinforce disordered eating or overtraining, and a record built to serve the person must not be the mechanism that does it.

The record’s compiled views draw on this folder like any other. A body-system view (Section 2.14) shows training and recovery alongside cardiovascular measures; a condition view shows nutrition alongside a metabolic diagnosis. Self-directed work enriches the clinical picture without being filed as clinical fact.

### 2.16 Before the Visit: Tasks, Repeats, and What to Bring

Two ordinary failures show what “what happens next” (Section 2.5) has to do for a person. A cardiologist begins a visit not knowing a cardiac scoring result already exists in another system. A clinic prepares to draw the same blood panel that was drawn a month ago. Neither is anyone’s fault; both are what happens when the record of what was done and the record of what is planned live in different places. This section puts them in one place and makes the record do the remembering.

Tasks are a fact class. A task is something that needs doing: get the records from the imaging center, ask about the new medication, fast before Thursday’s labs, send the calcium score to the cardiologist. Each task carries who it belongs to (you, a caregiver, or the record itself as proposer), the entry it is about (a result, an order, a referral, a visit), an optional due date, and a status: open, done, or dropped. Marking a task done is an event like any other, with its own event time and the name of who marked it, so “did I ever do that” is answerable years later, and a task that was never done says so honestly. Tasks live in 10-care-plans beside the referrals and pending orders they usually come from, and they are what the schedule view and the health summary read when they answer what happens next. (FHIR carries this as the Task resource.)

Tasks come from three sources, and the record’s standing rules apply to each. Tasks you write are your own writing, like a journal entry: they file without approval. Tasks the record proposes (“your calcium score is not in Thursday’s grant; add it?”) are proposals under Section 7, waiting for your yes. Tasks that arrive inside a document (fasting instructions on an order, a follow-up in discharge papers) are extracted like any other fact: the order is the fact, the task is what it asks of you, and both show their source.

The repeat check. When a new order or a scheduled test carries the same test code as a result already in the record, within a window that fits the test (weeks for a blood panel, years for a scan), the record surfaces the earlier result beside the new order: in the timeline, in the pre-visit brief, and in the health summary’s what-happens-next. It shows the date, the source, and the result, so the earlier work cannot be missed. It never blocks the order and never judges it, because many repeats are intentional: a clinician may want a fresh value, or the earlier one may have been drawn under different conditions. The record’s job is to make the earlier result impossible to overlook; the decision belongs to you and your clinician. The same check runs for immunizations and screenings, where “already done” is the most common finding of all.

The pre-visit brief. For an upcoming visit, the record compiles what that visit needs: the visit’s purpose as recorded, your open tasks and questions for that provider, results and changes since your last visit with them, results elsewhere in the record that bear on their specialty (the cardiac score for the cardiologist, the kidney panel for the nephrologist), any repeat flags on what they have ordered, medications changed since you last saw them, and a proposed grant scope, so that presenting your code at check-in carries exactly this and nothing more. The brief is a compiled answer, like the views of Sections 2.5, 2.9, and 2.14: generated from the tree, scoped by your permissions, never a place where anything is filed. Which results “bear on” a specialty is partly a judgment, and the record treats it as one: results the coding places in the specialty’s body system (Section 2.14) are included automatically, and anything the AI adds beyond that is marked as its suggestion, with the source shown. You choose what goes in the grant; the brief only makes the choice easy.

None of this is clinical advice. The record shows what exists, what is pending, and what was already done, and it hands the decision to the people in the room. That is the whole point of a record the person carries: the clinician meets the visit knowing what the person knows.

### 2.17 The Environment Folder: How This Copy Is Set Up

The governance folder holds the rules: who may see what, and what the AI may do. A record also carries facts about how this particular copy is set up, and those are not rules. Which jurisdiction governs it. What age of majority it uses. Which AI model answers questions and which one reads photographed documents. Which cryptographic algorithms seal it. The environment folder (_environment/ at the record root) holds these facts, so that the rulebook stays a rulebook and the setup travels with the record wherever it goes. The test for placement is simple: a line that answers “how is this record set up” belongs in _environment; a line that answers “who is allowed to do what” belongs in _governance. The access history stays in _governance.

What the folder holds. Each item is a readable file paired with a machine-readable form, the same pairing rule as the record’s entries:

- Jurisdiction. The governing jurisdiction, the active law-pinned set derived from it (Section 4.3), and the history of every change to that set. When the record has moved, the file shows the union of the prior and new sets and the date of any re-evaluation.
- Record settings. The values the specification says are settings rather than fixed rules: the per-record age of majority (Section 2.12), the official-copy designation when the record exists in more than one place (Section 5.2), language and locale for the plain-language layer and translations (Section 5.3), and data residency constraints on the host (Section 5).
- AI routing map. For each task type (answering questions, extraction from documents and screens, computed summaries, translation, and any others the implementation defines): the selected model, its version, its provider or the local runtime, whether it runs on the person’s device or over a connection, the date of selection, and who made it. A flag marks task types the person has pinned to local-only operation.
- Model registry. The models available to this record, whether installed locally or reachable by connection, with version, runtime location, and the date last seen, and the discovery source for candidates: the local runtime’s installed models, a provider’s published model list, or a signed catalog the person subscribes to.
- Cost and quality tallies. Per model and per task type: call count, cost, the acceptance rate of its proposals, the correction and deletion rate of entries it filed, and any golden-set score. These are the evidence behind a routing proposal and the same signals the trust record already keeps (Section 7.2).
- Pending routing proposals. Candidate model, version, runtime location, the supporting evidence, the plain-language text shown to the person, expiry, and outcome.
- Cryptographic configuration. The versioned algorithm identifiers in use for sealing, key wrapping, signatures, and key establishment (Section 5.4.6), and the recovery and share scheme identifiers (Sections 5.4.3 and 5.4.4). Never any key material.
- Implementation identity. The name and version of the implementation that last wrote this copy, so a record arriving at a new implementation can say where it came from.

Choosing the model is the person’s decision, recorded. Nothing in this design depends on one AI (Section 6), and the choice of which model serves which task is a setting the person makes, not something an implementation hides. A person may pick a fully private local model for questions that touch sensitive categories and a more capable connected model for complex questions, and both choices are written to the routing map. Every entry an AI produces already carries the identity of the model that produced it (Section 3), so the routing map and the entries together always answer which model read a given document, and a later change of model never alters entries already filed.

Being told when something better exists. The implementation records how each model performs and what it costs, and when it learns that a newer version of a selected model exists, or that another available model clears the task type’s quality threshold at lower cost or with higher measured quality, it MUST inform the person in plain language: the candidate, its version, where it would run, the evidence, and what would and would not change. Below the evidence threshold it stays silent. A candidate that runs over a connection MUST be presented with the plain statement that content for that task type would leave the person’s device, and a task type the person has pinned to local-only MUST NOT be offered a connected candidate at all. The person or their representative adopts, declines, or ignores the proposal; adoption is a recorded control event in the access history; an unanswered proposal expires. No earned trust ever permits the implementation to change the model serving any task type on its own, because a change of model changes what reads the record (Section 7.1). When a different model is adopted for a task type, the person elects, by recorded control event, whether the filing categories that model serves carry their earned trust forward or reset to suggestion-only until the new model has re-earned it (Section 7.2).

Rules for the whole folder. It travels with the record and is readable by the person without special software. Files that can be derived are generated, not authored, the same rule as context files (Section 6.1), so they cannot drift. Every change to an environment value is a recorded control event in the access history with the actor and the date, and no environment change is made by an AI on its own. Context files compiled for an AI session (Section 6.1) include the routing map, that model’s own track record, and which task types it may and may not serve, scoped to the acting party’s grant, so any model arriving to work on the record learns what it is permitted to do before it reads any content.

## 3. How Information Gets In

New material arrives in the inbox from six kinds of source. First and most important, EHI exports: the complete medical record exports federal law entitles you to from every certified provider system, which are how a lifetime of history arrives at once (Section 3.1). Second, structured connections: standard FHIR feeds from provider systems, C-CDA documents, and the visit records that Health Tech Ecosystem providers return to you at check-out in the same format they accept. Third, photographed and scanned documents. Fourth, captured app screens. Fifth, direct device and service streams you have authorized, such as a glucose monitor, blood pressure cuff, or fitness wearable. Sixth, education and developmental support records from schools and related services, which arrive by document or by liaison correspondence and file to folder 18. And alongside all six, you can always simply enter a fact yourself, typed or dictated: a symptom, a home reading, a medication change. A person-entered fact files like any other capture, marked as entered by you, with you as its source.

The documents the system ingests span everything a life in healthcare generates:

- Clinical documents: after visit summaries, discharge instructions, referral and consult letters, operative and procedure reports, imaging reports.
- Results on paper: printed or PDF lab reports, vaccination cards, screening results.
- Medication artifacts: prescription bottle labels, pharmacy printouts and receipts, handwritten or printed medication lists.
- Administrative and financial: insurance cards, explanations of benefits, superbills, medical bills and receipts.
- Legal: advance directives, healthcare power of attorney, guardianship papers (filed to folder 13).
- Records from separate provider ecosystems: dental, vision, and hearing documents, which rarely flow through medical systems at all.
- App screens: glucose, wearable, sleep, nutrition, rehabilitation, and patient portal displays, captured when no export or connection exists.
- Intake and screening forms: questionnaires and assessments, including life-context screenings (which file behind the folder 15 boundary).
- Education and developmental support: IEPs and EHCPs, 504 plans, school assessments, in-school therapy plans and progress notes, school liaison correspondence (folder 18).

An extraction capability (in the first implementation, SHIRLe’s proprietary AI image analysis capability) reads each captured item and files what it finds. One photographed visit summary might produce a medication change filed under medications, a blood pressure reading filed under observations, a new diagnosis filed under conditions, and a follow-up task filed under care plans. Each of those entries carries a link back to the original photo, along with a note about how confident the system was. Values the system read directly off the page are marked differently from values it estimated, and that distinction stays visible forever. Device data arrives the same way, with the link pointing to the device instead of a document.

Extraction also records what did the reading. Every entry an AI produced carries the identity and version of the model that produced it, and where several models participate, the identity of the full model set in use at that moment. This is the same honesty the record already requires of computed values (which name their calculation and version) and of translations (which name their method and version), applied to extraction. It matters because the models working under a record will change over the record’s life: when they do, existing entries stay exactly as filed, still carrying the identity of the model that actually read them, so the question “what read this document” always has an answer.

When two sources disagree (for example two providers exporting two different medication lists), the record keeps both, each with its own source link, and surfaces the discrepancy to you rather than silently merging or choosing. Resolution is a human decision, recorded like any other.

For assessments and diagnoses, the source link carries enough for a stranger to trust the work. Each such entry records the instrument used and its version (for example ADOS-2, ADI-R, or Vineland-3), the scores together with the norms they were scored against, the administering clinician’s credential and the body that accredits it (for example ASHA in the United States or RCSLT in the United Kingdom), and the jurisdiction where it was administered. The point is recognition: a clinic or school system in a new region should be able to accept the assessment as done, rather than putting the person, often a child, through it again.

Some care happens outside coded systems entirely: experimental and regenerative treatments, therapies received abroad, clinical trial participation. These file like everything else, with full provenance (who, where, when, what was done, from which document), even when no standard code exists for them yet; a code can be attached later without touching the original entry.

### 3.1 Bulk Import: Seeding the Record from a Full Medical Record Export

Federal information access rules give every person the right to a complete export of their electronic health information (an EHI export) from any certified provider system. This is how a lifetime of scattered history arrives at once, and it is most people’s first day with the record. Three rules govern it. First, the export archive itself is preserved permanently in 09-documents: it is the legally complete snapshot of what that institution held on that date, and every entry extracted from it links back to the exact file inside it. Second, because these exports arrive in whatever computable format the vendor produces (standard FHIR bundles, C-CDA documents, spreadsheets, or proprietary files), normalization into the record’s folders is part of import, and if an entry lands behind the wrong sharing boundary you can move it and the correction is recorded (Section 4.2). Third, every bulk import is scanned before anything is filed: legally protected content such as substance use disorder treatment records is recognized and placed behind its law-pinned boundary (Section 4.3) automatically, and categories you have marked sensitive are sorted behind their boundaries at the same step.

The flow also runs in reverse, better. What this record exports (a patient grant: clean, standard FHIR entries with every fact carrying its source) exceeds the legal minimum that provider systems are required to produce. The grant travels as a SMART Health Link, a secure federal-standard link most often shown as a QR code on your phone: at check-in you present the code, the clinic scans it, and it receives exactly the consent-scoped record you chose to share, nothing more. The architecture accepts the industry’s messiest lawful export and emits its cleanest one.

# Part II: Control and Protection

## 4. Who Can See What

Access is controlled by sharing permissions the person (or their authorized representative) sets, stored in the governance folder in both a machine-readable form and a plain-language form. Each permission says who may see the record, for what purpose, which categories they may see, and for how long.

The roles the system recognizes:

- You, the record owner.
- Your representative: someone with legal authority to act for you, such as a person holding power of attorney or a guardian, established by the documents in folder 13. The system treats this role with the same care as the owner role, because for many people this is how their record will actually be managed.
- Your clinicians, scoped to what each one needs. A physical therapist might see rehab notes and activity data and nothing else.
- A caregiver named in your care team, with whatever view you choose to give them, including standing access that does not expire between visits, because caregiving is not an occasional event.
- A non-clinical support person such as a trainer, coach, dietitian, or wellness practitioner, scoped by default to the lifestyle boundary (Section 2.15) and to nothing else.
- Researchers, who can only ever receive information with your identity removed.

When someone asks to see the record, simple software rules check their role against your permissions and show them only the folders you allowed. Anything outside their permission is simply never presented to them. You can also decide separately whether someone may see original documents or only the organized entries taken from them. Every time anyone views any part of the record, that event is written to a permanent access history you can read, answering the question: who looked at what, and when.

### 4.1 Emergency Access

A record that no one can open in an emergency protects your privacy at the cost of your safety, so emergency access is designed on purpose rather than left as an exception. You maintain an emergency summary: allergies, current medications, major conditions, implanted devices, your directives from folder 13, and emergency contacts. You decide in advance what it contains and under what rule it can be opened, for example by emergency personnel when you cannot respond. Every emergency opening is heavily logged, is limited to the summary you defined, and generates a notification to you and your representative afterward. Nothing else in the record becomes visible through this path.

### 4.2 Corrections and Disputes

Records contain errors, and you have the right to challenge them. When you dispute an entry, it is flagged and annotated, never silently deleted: the original, your objection, and any correction all remain visible, and anyone you share that entry with sees the dispute alongside it. This mirrors how amendment rights work in traditional medical records while keeping the full story honest.

### 4.3 Categories Protected by Law, Not Just by Choice

Most sharing boundaries in this record exist because you drew them. A small number exist because federal law draws them for everyone. Records from substance use disorder treatment programs carry their own federal confidentiality rules (42 CFR Part 2) that are stricter than ordinary health privacy law, including limits on how such records can be redisclosed and used in legal proceedings. When content of that kind enters the record, the system recognizes it as a legally protected class automatically: it is held in its own boundary, excluded from every export by default, and shareable only through a permission that names it explicitly. You cannot accidentally include it in a broad grant. Separately, this design treats reproductive health information as a patient-controlled sensitive category by architecture, which matters because the federal rule that briefly gave such information special regulatory protection was largely vacated by a federal court in 2025. Where the law’s protection has receded, the structural boundary you control remains.

Which classes the law pins depends on where the record is governed. The law-pinned set is not fixed in the architecture; it is a function of the record’s governing jurisdiction, applied automatically. United States records recognize the federal classes described above. A record governed elsewhere recognizes that jurisdiction’s protected categories instead (for example, the special categories of data under GDPR Article 9 in the European Union). And when a record moves between jurisdictions, it does not drop protections at the border: it carries the union of the prior and new jurisdictions’ pinned classes until the person, with the new rules in front of them, chooses to re-evaluate. Protection travels with the record and only ever ratchets down by the person’s recorded decision.

## 5. Where the Record Can Live, and How It Travels

The same record works in three settings:

- On your own device, where nothing leaves your hands unless you export a copy to share.
- On a care facility’s system, for example a nursing facility or home care agency that hosts records for the people it serves, with staff seeing only what their role allows and the access history answering for every view.
- In a protected cloud service, where the same folder structure is wrapped in strong technical safeguards: encryption on each category, verified identity for every viewer, and secured processing environments.

The facility setting generalizes naturally to health systems and insurers. A health system can host person-sovereign records as the longitudinal, person-and-caregiver-facing layer alongside its electronic health record, which remains the legal medical record; this is where transitions of care stop losing information, and it fulfills the check-in and record-return commitments many systems have already pledged. An insurer can likewise sponsor records for its members. In every hosted case one rule is absolute: hosting is not access. The host sees only what the person’s permissions allow, the access history answers whether the host looked, and the record leaves with the person when they change providers or plans, which no portal offers today. Where the record is physically stored (data residency, which some jurisdictions regulate) is a hosting-tier concern handled under the same rule: residency requirements constrain where a host may keep the bytes, never who may read them.

Sharing is always an export: the system assembles a copy containing only the categories your permission allows, as a standard FHIR bundle any healthcare system can accept, delivered as a SMART Health Link or QR code you present from your phone. This is the same format the federal Health Tech Ecosystem initiative has organized hundreds of providers and technology companies around, so a SHIRLe export is not a proprietary artifact; it is the industry’s arriving standard for patient-carried data. A practical consequence is digital check-in: instead of the waiting room clipboard, you present a code, the front desk receives exactly the categories you chose to share, and participating providers return the visit record to you the same way.

### 5.1 How the Record Is Protected

Protection follows where the record lives, and one rule never changes: the plain-language versions are guarded exactly like the technical entries, always. On your own device, the device’s built-in protection (the same full-device encryption that guards everything else on a modern phone or computer) covers the record, and the files stay directly readable to you, which is the point. Your backup is different: a backup is a copy that leaves your hands, so it always carries its own lock, with a recovery path you set up in advance. In hosted settings, sealing becomes the enforcement itself: each category you can grant separately is sealed separately, and granting a permission is what unseals it for that person. The host holds the storage, not the ability to read it: nothing hosted for you is readable to the host without a permission you gave, and for law-protected categories the host never holds the ability to unseal at all. Shared copies are protected in motion too: a patient grant travels as a locked package whose key rides in the link or code you present, so only the person you hand it to can open it. Finally, the access history and the AI’s trust record are protected against silent rewriting: entries are chained so that any tampering is visible.

Protection is also designed for the record’s whole life, not the present decade. A health record must stay confidential for fifty years or more, and encrypted copies stolen today can simply be held until computers exist that can break today’s public-key encryption (an attack known as harvest now, decrypt later). Section 5.4.6 states how the record’s cryptography is required to stay movable to newer algorithms, including post-quantum ones, so that a copy sealed today is not a promise that quietly expires.

### 5.2 Several People, One Device

A shared computer in a household holds records the same way a facility does, just smaller: one complete record per person, side by side, never merged. There is no shared household health data; anything two family members both need exists in each person’s record as their own entry (her diagnosis in her conditions, the same fact in your family history), so either person can change their sharing without breaking the other’s record. Each record on the device is sealed under its owner’s own keys, so using the computer is not the same as reading everyone’s record: the hosting-is-not-access rule applies to the family member who owns the machine just as it applies to a hospital. A family member who reads another’s record does so as a named role in that record’s own permissions (representative or caregiver, Section 4), and that record’s access history shows every view. The AI works in one person’s record at a time; a question that spans two records (for example whether two family members’ medications interact) is a distinct, explicit step that checks both people’s permissions and is written to both access histories, and trust the AI has earned in one person’s record never carries into another’s. Transitions need no special machinery: a child’s record begins with a parent as its controlling representative and control transfers to the child at adulthood as a recorded permission change inside their own record; the same shape, run in reverse, handles a power of attorney taking effect; and when someone moves out, their record copies to their own device and becomes official there.

If your record exists in more than one place, one copy is the official one and the others are read-only views marked with how current they are. If you withdraw a permission, all ongoing and future access ends. To be plain about the limit: withdrawing permission cannot recall copies you already sent, any more than you can unsend a fax. The system will always state this honestly rather than imply otherwise. Every copy, projection, and grant, wherever it lives, operates under the same governance and consent layer: relocating the record never relaxes its rules, and no host or family member gains authority the permissions do not give them.

Because the record may be the only complete copy of your health history, it is protected against loss: an encrypted backup you control, with a recovery path you set up in advance, so a lost or destroyed device does not mean a lost record.

### 5.3 When the Record Crosses Languages

A record that travels between countries will need to be read in more than one language. Translation follows the same pattern the record already uses for omics interpretation and computed values: the original is the permanent fact and is never overwritten; a translation is a derived layer on top, marked as a translation, recording the method and version that produced it (a named human translator, or a named translation model and its version). Better translation later means a new derived layer, with the old one superseded visibly, and the original untouched beneath them all. What a clinician in the new country reads is the translation; what the record holds forever is what was actually written.

### 5.4 Key Hierarchy, Recovery, and Control Designations

This section defines the cryptographic structure that enforces the guarantees of Section 5.1 and makes them portable across implementations. A conforming implementation MUST use this hierarchy, so that a person can move their record, their recovery materials, and their designations from one implementation to another without re-encryption and without the cooperation of the implementation they are leaving. This section uses conformance language (MUST, SHOULD, MAY) because it states testable obligations for implementers.

The key hierarchy (5.4.1). Three levels. Each category folder (00 through 19) is encrypted with its own category key, and a category key MUST NOT encrypt more than one category. Category keys are wrapped (encrypted) by the root key: the single secret from which access to the full record derives. Consent-scope keys wrap subsets of category keys for disclosure; each MUST be bound to a recipient, a category set, and a validity window, and travels inside a grant (Section 5.1). An implementation MAY add intermediate keys (for example, per-device keys) but MUST preserve two properties: the root key is sufficient to derive every category key, and no category key derives the root key.

Root key generation and custody (5.4.2). The root key MUST be generated under the person’s control, on a device or in an environment the person designates, and MUST NOT be generated by, transmitted whole to, or reconstructable by any hosting party. No host, including a facility-sovereign node operator, MAY hold the root key whole, or hold enough key shares (5.4.4) to reconstruct it without participation by the person or a person-chosen party. For law-pinned categories (Sections 4.3 and 5.1), no host MAY hold any share of the keys protecting those categories: only the person and, if designated, their trustee hold that material. A person MAY choose, explicitly and revocably, to place custody with a host (for example, a guardianship arrangement under Section 2.12); that is a recorded control transition, not a default, and it MUST be visible in the audit ledger.

The recovery phrase (5.4.3). An implementation MUST offer the person a recovery phrase: a human-writable encoding of the root key as a sequence of words drawn from a published word list. The encoding MUST follow a deterministic, published mapping, so a phrase produced by one conforming implementation restores the root key in any other; implementations SHOULD adopt an existing standardized word-mnemonic scheme rather than inventing one, and MUST document which scheme and word list they use. The phrase MUST be displayed only under the person’s control and MUST NOT be stored by any host in any form, including hashed or encrypted forms. At creation time the implementation MUST tell the person, in plain language, what the phrase restores and what is lost if the phrase, all devices, and all shares are lost.

Threshold shares (5.4.4). An implementation MAY split the root key into key shares under a threshold scheme: a defined quorum of shares (for example, any two of three) reconstructs the root key, and fewer than the quorum reveals nothing about it. Share format MUST be portable: a share exported from one conforming implementation MUST be usable in another, and MUST identify the scheme, the quorum parameters, and the share index without revealing key material. Where splitting is offered, the default placement SHOULD be one share on the person’s device, one with a service or host, and one with a person-chosen trustee or as a second written code; other placements MAY be offered, and every placement MUST satisfy the custody constraints of 5.4.2. Reconstruction events MUST be recorded in the audit ledger, including which shares participated.

Control designations as portable objects (5.4.5). Trustee, proxy, and break-glass designations MUST be represented as signed, portable objects that name the designated party, the powers granted, any limits, and revocation status; a designation created in one conforming implementation MUST be honorable in another. A break-glass designation MUST name at least two approvers and MUST require that quorum before emergency access proceeds (this operates alongside the emergency summary of Section 4.1, whose openings are already logged and notified); every break-glass access MUST be logged and MUST generate a notification to the person. Revocation of any designation MUST take effect at the next verification of that designation and MUST be recorded. Estate and transition instructions (Section 2.12) are a designation class under this section and follow the same portability and logging rules.

Algorithm agility and post-quantum protection (5.4.6). The record’s confidentiality horizon is a lifetime, which is longer than the safe life of any single cryptographic algorithm. In particular, the public-key algorithms in universal use today are expected to be breakable by sufficiently capable quantum computers, and an adversary does not need to wait for that day: encrypted material copied now can simply be held until it can be opened (harvest now, decrypt later). This subsection makes the record’s cryptography movable rather than betting the record on any one algorithm.

Every sealed object, wrapped key, grant, signed designation, and ledger signature MUST carry a versioned identifier of the algorithms protecting it, and an implementation MUST be able to re-encrypt and re-wrap under newer algorithms without altering record content, so that migration is a routine operation rather than a rebuild. Category and backup sealing MUST use symmetric encryption at a minimum strength of 256 bits (for example AES-256), which is not meaningfully weakened by known quantum attacks. Wherever public-key cryptography is used (encrypting a grant’s keys to its recipient, and signing grants, designations, and ledger anchors), an implementation SHOULD use a hybrid of an established classical algorithm and a standardized post-quantum algorithm, so that a break of either leaves the other intact. The named standards are ML-KEM (the Module-Lattice-Based Key-Encapsulation Mechanism, FIPS 203) for key establishment and ML-DSA (the Module-Lattice-Based Digital Signature Algorithm, FIPS 204) for signatures. Long-lived signed objects (designations, grants held as evidence, and ledger anchors) SHOULD be re-signable under newer algorithms with the original signature preserved and visibly superseded, the same pattern the record uses for translations (Section 5.3). Nothing in this subsection freezes an algorithm list. The obligations are that every protected object says what protects it, that the implementation can always move to what is current, and that nothing sealed today depends on classical public-key cryptography alone remaining unbroken for the life of the record.

What this section deliberately does not standardize (5.4.7). Operational matters are outside the specification: where a service stores its share, hardware security module usage, recovery service levels, pricing, and support processes, and the specific cryptographic libraries and certification levels chosen to implement 5.4.6. Implementations compete on these. The specification standardizes only the formats and constraints above, so that the person’s ability to leave is never contingent on the quality of the implementation they are leaving.

Conformance summary (5.4.8). An implementation conforms to this section if: it uses the three-level hierarchy (5.4.1); it never holds or can reconstruct a root key without person-side participation, with zero host-held material for law-pinned categories (5.4.2); it offers a portable recovery phrase under a documented, published scheme (5.4.3); any share splitting uses portable share formats and logs reconstruction (5.4.4); designations are portable signed objects with quorum-enforced break-glass (5.4.5); and every sealed object carries a versioned algorithm identifier, with migration to newer algorithms supported and no sole reliance on classical public-key cryptography for lifetime confidentiality (5.4.6).

### 5.5 Disclosure Proofs, Requests, and Participant Identity

Everything in this specification so far describes sharing that the person starts: the person assembles an export, presents a code, and hands over categories of the record. Three more capabilities are needed for the record to work in the wider world, and each must be standardized or the person’s independence quietly erodes. The record must be able to tell who an organization really is before sharing with it. Organizations must be able to ask for a disclosure without that asking ever becoming taking. And both sides must be able to prove what happened afterward, including proving a single fact about the person without opening the record at all. This section defines those capabilities in conformance language (MUST, SHOULD, MAY), reusing two pieces of machinery Section 5.4 already established: signed portable objects (5.4.5) and versioned algorithm identifiers with re-signing (5.4.6).

Participant identity (5.5.1). Any organization that receives grants, sends requests, or verifies proofs is a participant, and a participant MUST present a verifiable identity: a signed, portable identity object naming the organization, its type (for example clinic, insurer, school, research sponsor, non-clinical support organization), its governing jurisdiction, its public keys, a validity window, and its revocation status. A grant MUST be encrypted only to keys bound to such an identity object, and the implementation MUST show the person, in plain language, who they are about to share with, as attested by that identity, before the grant is created. Identity objects carry algorithm identifiers and are re-signable under 5.4.6. Who vouches for an identity, and how directories of participants are operated, is deliberately not standardized (5.5.5); what is standardized is that no implementation may deliver a grant to an unverifiable recipient.

Requests (5.5.2). A request is a signed, portable object by which an identified participant asks for a disclosure. It MUST name the requester (by its identity object), the purpose, exactly what is sought (named categories, or a named proof under 5.5.4), the validity window of what would be disclosed, and the text the person will be shown. A request confers no access of any kind. It becomes access only when the person or their representative approves it, and approval produces an ordinary grant or proof under this specification’s existing rules; declining or ignoring a request produces nothing and requires no justification. Every request received, and its outcome, MUST be recorded in the access history. An unanswered request MUST expire. Consistent with Section 7 (What the AI Is Allowed to Do on Its Own), no earned trust ever permits an AI to approve a request: approval crosses the boundary of the person’s control and always requires the person or their representative, every time.

Redemption receipts (5.5.3). At the moment a grant is honored, both parties MUST be able to obtain a receipt: a signed, portable object recording that a specific grant from a specific person was honored for a specific identified recipient, covering named categories or a named proof, under a stated purpose and validity window, at a stated time. A receipt MUST contain no record contents. It MUST be verifiable by a party outside any implementation, using only the published formats of this section, and it MUST be anchored to the tamper-evident access history (Section 5.1) so that a receipt and the history it belongs to confirm each other. Receipts carry algorithm identifiers and are re-signable, because a receipt may need to serve as evidence for decades. The person’s copy lives in the access history; the recipient’s copy is theirs to keep as proof that the disclosure was authorized.

Disclosure proofs (5.5.4). A disclosure proof states a defined fact derived from the record without revealing the entries beneath it: that a current prescription of a named class exists, that immunization requirements are met, that stated eligibility criteria are satisfied. A proof MUST name the criterion it answers and the criterion’s version, the date of derivation, and the identity the proof was issued to, and it MUST be signed, scoped, and time-limited exactly as a grant is. A proof MUST be issued only with the person’s approval, through the request flow of 5.5.2, never automatically. Proofs touching law-pinned categories follow the standing rule of Section 4.3 (Categories Protected by Law, Not Just by Choice): they can be derived only under a permission that names that category explicitly. And refusal reveals nothing: a proof request that is declined, and a proof request the record cannot satisfy, MUST return the same answer, so that the absence of a proof is never itself a disclosure.

What this section deliberately does not standardize (5.5.5). Who operates participant directories, how identities are vouched for and revoked in practice, what verification or matching services cost, service levels, and the commercial terms of any of it. These are operations, and implementations and services compete on them. The specification standardizes only the objects and constraints above, so that requests, receipts, and proofs mean the same thing everywhere and the person’s refusal is always free.

Conformance summary (5.5.6). An implementation conforms to this section if: it delivers grants only to verifiable participant identities and shows the person who they are sharing with (5.5.1); requests are signed objects that confer no access, expire, are always person-approved, and are fully recorded (5.5.2); receipts are content-free, independently verifiable, history-anchored signed objects available to both parties at redemption (5.5.3); and proofs are person-approved, criterion-versioned, scoped derivations with law-pinned categories explicitly named and refusal indistinguishable from inability (5.5.4).

# Part III: Intelligence

## 6. Works With Any AI

Nothing in this design depends on a particular AI product. The record is folders, readable text, and standard health data, so any capable AI system can work with it, including smaller open-source models that run entirely on a personal computer. Because the access rules are enforced by predictable software rather than by the AI itself, switching to a different AI changes only how good the answers are, never who can see what. The person can choose a fully private local AI for sensitive questions and a more powerful connected AI for complex ones, and both work from the identical record. The time structure in Section 2.5 is part of what makes the smallest AIs workable: a question about your current medications loads the handful of active entries, not decades of history, so even a modest computer holds what the question actually needs.

### 6.1 Context Files: How an AI Learns the Record

An AI is most useful, and least dangerous, when it understands the record’s rules before it touches the record’s contents. AI agent tools have converged on a simple convention for this: a small instructions file the model reads first, which tells it what a body of material contains and how to work with it correctly (in current agent frameworks these are often called skills or agent context files). The record adopts the same convention as a first-class part of the architecture, so that any AI, from any vendor, arrives already knowing how this record works.

The record-level manifest already lives in the tree: CONTEXT.md at the record root is the map. It states which questions go to which folder, the confidence markings in use (directly read, estimated, computed), how the record’s two clocks work (Section 2.5), which views exist and what each answers, what the AI is currently allowed to do on its own under the trust record (Section 7), and, from the environment folder (Section 2.17), the routing map, the arriving model’s own track record, and which task types it may and may not serve. A conforming implementation MUST generate this manifest, and an AI session MUST load it before reading record content.

Each folder SHOULD additionally carry its own context file: what the folder holds, the entry conventions in use there, how to read its markings, the temporal semantics that apply, and which operations are appropriate (for example, that journal text is never rewritten, or that folder 15 is locked to suggestion-only). An AI loads a folder’s context when a question takes it there, and not before, which is the same progressive approach that keeps small local models workable against a large record (Section 6).

Two rules keep context files honest. First, they are generated, not authored: like the plain-language twins, context files are compiled from the tree, the governance folder, and the environment folder (Section 2.17) by deterministic code, so they can never drift from what the record actually contains and permits, and they are fully regenerable. Second, they are consent-scoped projections: a context file is compiled per session against the acting party’s grant, and it MUST NOT reveal the existence, names, or contents of categories outside that grant. Law-pinned classes and boundary folders never appear in a context file compiled for a party whose grant does not name them. The map a viewer receives shows only the territory they are permitted to enter.

## 7. What the AI Is Allowed to Do on Its Own

Section 4 covers who may see the record. This section covers a different question: how much the AI is allowed to do without asking first. The architecture answers it with an earned trust approach (published as the Earned Autonomy framework, https://github.com/ahendo026/earned-autonomy): the AI starts with very little independence and earns more only by demonstrating a track record, and some actions can never be earned at all.

The two questions are kept strictly separate. Giving your doctor permission to see your medications never gives the AI more freedom to act, and no amount of earned trust ever lets the AI see or share anything your permissions do not allow.

### 7.1 What Requires Approval

Answering questions and writing plain-language summaries: allowed from day one. Reading your record and explaining it changes nothing and every answer shows its sources.

Capturing new items into the inbox: allowed from day one. The inbox is a waiting area; nothing there counts as part of the record yet.

Filing computed summaries from continuous data: allowed from day one. Metrics produced by a fixed, named calculation (Section 2.6) are reproducible, so there is nothing to approve; every one records the calculation and version that produced it.

Filing entries into the record: this is where trust is earned. At first, everything the AI extracts is only a suggestion. It sits in a pending state until you or your representative approve it, and only then does it become part of the record, with a note recording both the source and your approval. If a category of suggestion (say, blood pressure readings copied directly off a page) builds a long record of being approved without correction, you can allow that category to file automatically. Estimated values never earn that privilege; they always wait for approval. For bulk imports such as a full EHI export, approval works at the batch level: you approve categories at a time (for example “file all 214 lab results from this export”), with the entry-by-entry review reserved for the small minority the system flags as estimated, conflicting, or unusual.

Sharing anything outside the record, or changing permissions: never automatic, no matter how much trust has been earned. Any export or transmission always requires your explicit approval, every time, because it crosses the boundary of your control. The AI cannot propose changes to your sharing permissions at all in this version.

Changing which AI model serves a task type: never automatic. The implementation may propose a change and must tell you when a better or updated model clears the evidence threshold (Section 2.17), but only you or your representative adopt it, every time, because a change of model changes what reads your record.

### 7.2 The Approval Gate and the Trust Record

Every action the AI takes on the record passes through a single approval gate: a piece of ordinary, predictable software that checks what kind of action it is, how much independence that kind of action has earned, and what your sharing permissions allow, and then writes the event to the access history. If the gate cannot confirm all three, the action does not happen. The gate fails safe: when in doubt, it stops.

The AI’s current permissions are themselves a readable file in the governance folder: what it may do on its own, the track record that earned each privilege, and any privileges that were reduced after mistakes. This file travels with the record, and when the record moves to a new home, you decide whether the earned trust carries over or resets. At any moment, the answer to “what is the AI allowed to do without asking me” is something you can open and read, not something buried in settings.

### 7.3 Protected Categories: Yours and the Law’s

Trust is earned category by category, not all at once. Automatic filing might be earned for step counts and heart rate long before it is considered for medications or diagnoses, where a wrong entry could affect care. Four kinds of category carry permanent protection. Categories you pin: for anything you consider sensitive, including your journal, your family’s history, your life context (folder 15), and your genome (folder 16), you can permanently lock the AI to suggestion-only, so nothing there is ever filed without your approval regardless of track record. Categories the law pins: legally protected classes such as substance use disorder treatment records (Section 4.3) are locked to suggestion-only and excluded from automatic handling by the system itself, and that lock is not yours or the AI’s to lift. And lifestyle targets (Section 2.15): calorie targets, training loads, fasting windows, and similar self-directed numbers never graduate to automatic filing, because automation that quietly tightens a target can cause harm. And model changes (Section 2.17): the AI model serving a task type is changed only by your recorded decision, never by earned trust. If the system’s accuracy ever slips on its regular quality checks, privileges are reduced automatically until performance is re-proven.

# Part IV: Context and Boundaries

## 8. How This Fits the Broader Program and the Federal Landscape

This specification is published as a neutral, openly available architecture; SHIRLe Health / HealthDigits is its first implementation. Within the SHIRLe program it is the data-layer companion to the Phase 2 White Paper and Development Work Plan. It gives concrete form to the program’s commitments on explainability (a record anyone can read, with every fact showing its source) and on responsible AI governance (predictable rules controlling access, and AI independence that is earned, inspectable, and revocable). It also defines the shared artifact that all three processing paths operate on. The folder record is generated as a live copy from the existing system of record; whether it eventually becomes the primary store is a decision reserved for after the demonstration.

The design also aligns deliberately with the current direction of federal health data policy:

| Federal effort | How this architecture aligns |
| :-: | :-: |
| CMS Health Tech Ecosystem / Kill the Clipboard | The patient grant is delivered as a SMART Health Link or QR code carrying a standard FHIR bundle, the format pledged providers have committed to accept at check-in and to return visit records in. https://www.cms.gov/initiatives/health-technology-ecosystem |
| TEFCA and the HTI rules | The record exchanges through standard FHIR interfaces and TEFCA-connected networks; sharing permissions are designed to map onto emerging automated consent exchange formats. https://healthit.gov/regulations/hti-rules/ and https://www.healthit.gov/topic/interoperability/policy/trusted-exchange-framework-and-common-agreement-tefca |
| RAISE National Strategy to Support Family Caregivers | Caregivers are identified inside the record as members of the care team, so their role travels with every export, which is the caregiver identification the strategy calls for, achieved from the patient side. https://acl.gov/CaregiverStrategy |
| ACL Caregiver AI Prize Competition | The design reduces caregiver burden (capture by photo, standing representative access, one place for what happens next) while the earned trust and approval gate protect against unsafe automation. https://www.hhs.gov/press-room/acl-launches-phase-1-caregiver-ai-prize-competition.html |
| HHS AI Strategy (lifecycle oversight) | The earned trust record, with graduation on track record and automatic reduction after mistakes, is lifecycle AI governance applied at the level of a single person’s record. https://www.hhs.gov/sites/default/files/final-hhs-ai-strategy.pdf |
| GDPR Article 9 (EU), parallel alignment | Special categories of personal data (health, genetic, biometric, and related classes) map to the law-pinned protected classes; for EU-governed records they are the pinned set. https://gdpr-info.eu/art-9-gdpr/ |
| UK GDPR, parallel alignment | The United Kingdom’s retained version of the same special-category regime; recognized the same way for UK-governed records. https://ico.org.uk/for-organisations/uk-gdpr-guidance-and-resources/ |
| PIPEDA (Canada), parallel alignment | Canadian federal privacy law treating health information as sensitive, requiring consent proportionate to sensitivity; consent-as-routing satisfies it by construction. https://www.priv.gc.ca/en/privacy-topics/privacy-laws-in-canada/ |
| PDPA (Singapore), parallel alignment | Singapore’s consent-and-purpose regime; the record’s named-purpose grants align with its purpose limitation obligations. https://www.pdpc.gov.sg/overview-of-pdpa/the-legislation/personal-data-protection-act |

## 9. Decisions Deferred on Purpose

The following are real needs that this version acknowledges without designing, so the boundary of the current work is drawn deliberately rather than by omission:

- Households managing many records. The data architecture is now fully designed: sibling records on one device, cross-record access through each record’s own permissions, one-record-at-a-time AI, and recorded control transitions (Sections 2.3, 4, and 5.2). What remains deferred is the product layer above it: household dashboards, switching between records, and managing many records at once.
- Two-way synchronization between copies of the record. This version deliberately keeps one authoritative copy with read-only views elsewhere.

# Appendix A: Terms Used in This Document

FHIR: Fast Healthcare Interoperability Resources, the standard data format used across the healthcare industry so different systems can exchange records.

EHI export: a complete export of your electronic health information from a provider’s certified system, which federal rules require them to give you in a computable format; the usual way a lifetime of history first enters this record.

SMART Health Link / Card: a secure link or QR code that carries health information in the standard format, presentable from a phone and readable by participating providers and apps.

Export (a “patient grant”): a copy of part of your record, assembled according to a permission you set, in the standard format another provider or app can accept.

Social determinants of health: the conditions a person lives in (housing, food security, transportation, work, social support) that shape health outcomes; held in folder 15 behind its own strict sharing boundary.

Omics: molecular profiles such as DNA (genomic) data; held in folder 16, never exported by default, with interpretation filed separately from the unchanging raw profile. GINA is the federal law restricting some uses of genetic information.

ICF: the World Health Organization’s International Classification of Functioning, Disability and Health: the international framework for describing what a person can do and what support they need, used to organize functional and developmental status (Section 2.11).

Education records (IEP, EHCP, 504 plan): formal school plans and assessments for learning and developmental support; in the United States these are governed by education privacy law (FERPA) rather than health privacy law (HIPAA); held in folder 18.

Lifestyle boundary: the named sharing boundary covering folder 19 and self-tracked content elsewhere in the record, excluded from clinical grants by default and shareable with a non-clinical support person such as a coach or dietitian (Section 2.15).

Non-clinical support role: a trainer, coach, dietitian, or wellness practitioner granted access scoped to the lifestyle boundary and to nothing else by default, with every view recorded in the access history (Sections 2.15 and 4).

Translated view: a derived rendering of an entry in another language; the original is never overwritten, and the translation records the method and version that produced it (Section 5.3).

Body-system view: a compiled view of the whole record through one physiological system (for example cardiovascular or metabolic), cutting across every folder; inflammation and immune status appears as a layer within these views rather than as a system of its own (Section 2.14).

Computed value: a number produced by a fixed, named calculation over recorded data, such as time in range from glucose readings. Distinct from values read directly from a source and from values the AI estimated.

Model identity: the recorded name and version of the AI model, or model set, that produced an extracted entry, kept permanently with the entry even after the models under the record change (Section 3).

Event time and record time: the two clocks every entry keeps: when something was true, and when the record learned it. (Technical term: bi-temporality.)

Source link: the connection from any entry in your record back to the original document, photo, or device reading it came from. (Technical term: provenance.)

Filing: the step where an extracted piece of information becomes a permanent entry in your record. (Technical term: committing a resource.)

Approval gate: the single point of predictable software every AI action must pass through before it can change or share anything. (Technical term: a fail-closed chokepoint.)

Access history: the permanent, readable log of every time anyone or anything viewed or changed part of the record. (Technical term: audit log.)

Emergency summary: the small set of critical facts you choose in advance to be openable in a crisis under a rule you set. (Common industry term: break-glass access.)

Context file: a small generated guide an AI reads before touching content: the record-level map (CONTEXT.md) and the per-folder guides, compiled from the record itself and scoped to what the reader’s permission allows (Section 6.1).

42 CFR Part 2: the federal confidentiality regulation for substance use disorder treatment records, stricter than ordinary health privacy law; full compliance became enforceable in February 2026.

TEFCA: the Trusted Exchange Framework and Common Agreement, the federal framework connecting health information networks so records can move between systems nationwide.

Earned independence: the principle that the AI begins with minimal freedom to act and gains more only through a demonstrated track record, with some actions permanently requiring approval. (Framework: Earned Autonomy.)

Responsible AI: the discipline of building AI systems that are transparent, accountable, and under meaningful human control. Sometimes abbreviated RAI; this document uses the full phrase.

Root key: the single secret from which access to the full record derives; generated under the person’s control and never held whole by any host (Section 5.4).

Recovery phrase: a sequence of ordinary words that encodes the root key so a person can write it down and restore their record anywhere; never stored by any host (Section 5.4).

Key share: one piece of a split root key; a chosen quorum of shares (for example, two of three) restores the key, and fewer reveal nothing (Section 5.4).

Break-glass designation: a signed, portable authorization naming the people who together may unlock emergency access, with every use logged and notified (Section 5.4).

Participant identity: the signed, portable object naming an organization that receives grants, sends requests, or verifies proofs: its name, type, jurisdiction, public keys, validity window, and revocation status. Grants are delivered only to keys bound to one (Section 5.5).

Request: a signed, portable object by which an identified participant asks for a disclosure. It confers no access until the person or their representative approves it, expires if unanswered, and is recorded in the access history with its outcome (Section 5.5).

Redemption receipt: the signed, content-free proof, available to both parties when a grant is honored, of who disclosed which categories or which proof to whom, when, and under what purpose; independently verifiable and anchored to the access history (Section 5.5).

Disclosure proof: a signed statement of a defined fact derived from the record (for example, that eligibility criteria are met) without revealing the entries beneath it; person-approved, criterion-versioned, scoped, and time-limited, with refusal indistinguishable from inability (Section 5.5).

Task: something that needs doing, held in 10-care-plans with its owner, the entry it is about, an optional due date, and a status of open, done, or dropped; marking it done is a recorded event. Person-written tasks file directly; record-proposed tasks wait for approval (Section 2.16).

Repeat check: the record’s habit of surfacing an existing result beside a new order for the same test within a window that fits the test, so earlier work cannot be missed; it flags, never blocks (Section 2.16).

Pre-visit brief: a compiled view for an upcoming visit: open tasks and questions, results and changes since the last visit with that provider, results that bear on the specialty, repeat flags, medication changes, and a proposed grant scope (Section 2.16).

Environment folder: the folder (_environment/) that records how this copy of the record is set up: jurisdiction, record settings, the AI routing map, the model registry, cost and quality tallies, pending routing proposals, cryptographic configuration identifiers, and implementation identity; setup facts, never rules, and never key material (Section 2.17).

Routing map: the readable file naming, for each task type, which AI model serves it, its version, where it runs, when it was chosen, and by whom, with a flag for task types pinned to local-only operation (Section 2.17).

Model registry: the list of AI models available to this record, installed locally or reachable by connection, with version, runtime location, date last seen, and where candidates are discovered (Section 2.17).

Routing proposal: the implementation’s recorded suggestion to change the model serving a task type, with the candidate, the evidence, the text shown to the person, and its expiry and outcome; adopted only by the person’s recorded decision (Section 2.17).

Algorithm identifier: the versioned label every sealed object and signature carries naming the algorithms that protect it; what makes moving to newer cryptography a routine operation rather than a rebuild (Section 5.4.6).

Harvest now, decrypt later: the attack of copying encrypted data today in order to decrypt it in the future, when stronger computers, including quantum computers, can break today’s public-key encryption (Section 5.4.6).

Post-quantum cryptography: encryption and signature algorithms designed to resist quantum computers. The named federal standards are ML-KEM (FIPS 203) for key establishment and ML-DSA (FIPS 204) for signatures (Section 5.4.6).

# Appendix B: The Record at a Glance

The complete folder organization in one table. Every folder is described in Part I; the boundaries named here are detailed in Sections 2.7, 2.8, 2.15, and 4.3.

| Folder | What it holds |
| :-: | :-: |
| 00-inbox | Items captured but not yet filed; every new arrival lands here first |
| 01-demographics | Who you are: identity, contact details, insurance identity |
| 02-care-team | Your doctors, clinics, providers, and the people who care for you, each with a named role |
| 03-conditions | Diagnoses and allergies |
| 04-medications | Prescriptions, with vitamins and supplements kept separate |
| 05-immunizations | Vaccines |
| 06-observations | Lab results, vitals, device and wearable data, functional status, implants list |
| 07-procedures | Surgeries and procedures |
| 08-encounters | Visits and hospital stays |
| 09-documents | Original scans, photos, files, and clinician notes: the permanent evidence layer |
| 10-care-plans | Treatment plans, goals, referrals, pending orders, what happens next |
| 11-financial | Insurance claims, explanations of benefits, and billing |
| 12-journal | Your own diary entries and notes, in your words, yours alone to edit |
| 13-directives | Advance directives, healthcare power of attorney, guardianship papers, your wishes |
| 14-family-history | Health history of your relatives |
| 15-life-context | Housing, food, transportation, work, support: the conditions your health lives in (strictest boundary) |
| 16-omics | DNA, microbiome, and other molecular profiles (own permanent boundary) |
| 17-vision-hearing-dental | Eyes, ears, and teeth: the records that live outside medical systems |
| 18-education-support | School and developmental support records: IEPs, EHCPs, 504 plans, assessments |
| 19-lifestyle | Self-directed training, nutrition, mindfulness, and recovery logs, and the person’s own goals (lifestyle boundary) |
| _governance | The record’s own rulebook: permissions, consent artifacts, access history, the AI’s trust record |
| _environment | How this copy is set up: jurisdiction and law-pinned set, record settings, AI routing map, model registry, cost and quality tallies, routing proposals, algorithm identifiers, implementation identity (Section 2.17) |

Views (the emergency summary, health summary, timeline, schedule, visit summaries, condition views, body-system views, and the pre-visit brief) are compiled from these folders on demand; they are answers, not storage (Sections 2.5, and 2.9).

# Appendix C: Where Things Go, A Filing Index

An alphabetical guide to where common content lives in the record. Folder numbers refer to the tree in Section 2 (and the table in Appendix B). References like “Section 4” point to the chapter of this document that defines the item. A few entries are not documents at all but permissions or compiled views; those entries say so plainly. The folder taxonomy is authoritative; this index is a guide, not a limit, and anything not listed files by the same logic: originals to 09-documents, facts to their domain folder, sensitive classes behind their boundaries.

- 504 plan: 18-education-support.
- Advance directive: 13-directives.
- AI model selection (which model serves which task): not a filed document: a recorded setting in the routing map in _environment, changed only by the person’s recorded decision (Section 2.17).
- After Visit Summary (AVS): 09-documents (original), with extracted entries fanning out by domain.
- Allergy: 03-conditions.
- Ambulance and emergency transport record: 08-encounters; bill to 11-financial.
- Appointment, upcoming: 10-care-plans (expected next).
- Assessment, developmental or psychological (clinic): 09-documents (original); findings to 03-conditions and 06-observations.
- Assessment, school: 18-education-support.
- Audiogram: 17-vision-hearing-dental.
- Bill, medical: 11-financial; linked to its condition for the condition view.
- Biomarker panel: 06-observations, one coded entry per marker.
- Blood pressure reading: 06-observations (home device stream or single entry); a series a physician asked you to keep stays clinical, in observations.
- Body-system view (cardiovascular, metabolic, and so on): not a folder: a view compiled across the whole record on demand (Section 2.14).
- Care plan: 10-care-plans.
- Caregiver authorization: not a filed document: a named permission in the record’s access rules (Section 4); any legal papers behind it file to 13-directives.
- Clinical trial participation: 10-care-plans (plan) and 08-encounters (visits); consent papers to 09-documents.
- Clinician note: 09-documents (original); extracted facts fan out.
- Coach or trainer authorization: not a filed document: a non-clinical support permission scoped to the lifestyle boundary (Section 2.15).
- Complete medical record export (EHI export): arrives in 00-inbox; archive preserved in 09-documents; contents fan out.
- Contact lens prescription: 17-vision-hearing-dental.
- Context file (CONTEXT.md and folder guides): not a filed document: generated fresh from the record for each session, scoped to the viewer’s permission (Section 6.1).
- Continuous glucose monitor (CGM) data: 06-observations (stream blocks with summaries).
- Custody or guardianship papers: 13-directives; the authority itself lives as a recorded control role in the record’s permissions (Section 2.12).
- Dental chart or treatment plan: 17-vision-hearing-dental.
- Diagnosis: 03-conditions.
- Diary or personal note: 12-journal.
- Discharge instructions: 09-documents (original); follow-ups to 10-care-plans as tasks (Section 2.16).
- Disclosure proof (proof of eligibility or status): not a filed document: a signed, person-approved statement issued through a request, recorded in the access history (Section 5.5).
- DNA or genetic test result: 16-omics.
- Emergency summary: not a folder: a view compiled on demand under its own access rule (Section 4.1).
- Explanation of benefits (EOB): 11-financial; cost links feed the condition view.
- Eyeglass prescription: 17-vision-hearing-dental.
- Falls and near-falls: 06-observations (functional status, Section 2.11).
- Family member’s health history: 14-family-history.
- Fitness and workout data: 19-lifestyle when self-directed; 06-observations when a clinician ordered or reads it (Section 2.15).
- Food or nutrition log: 19-lifestyle (events; from app screens or entry).
- Guardianship, adult: 13-directives (the papers); the authority itself is a permission (Section 4).
- Hearing aid records and settings: 17-vision-hearing-dental; the device also listed with implants (Section 2.4).
- Home test result (over the counter): 06-observations, marked person-entered or device-read.
- Hospital stay: 08-encounters.
- IEP or EHCP: 18-education-support.
- Imaging report (X-ray, MRI, CT): 09-documents (original report); findings to 06-observations.
- Immunization record: 05-immunizations.
- Implanted device: 06-observations (implants list, Section 2.4).
- Insurance card: 01-demographics (identity) and 09-documents (image).
- Insurance claim: 11-financial.
- Intake or screening questionnaire: 09-documents (original); life-context answers to 15-life-context.
- Journal entry: 12-journal.
- Jurisdiction setting and active law-pinned set: _environment, with the history of every change (Section 2.17).
- Lab report, printed or PDF: 09-documents (original); results to 06-observations.
- Lab result: 06-observations.
- Living will: 13-directives.
- Meal logged in an app: 19-lifestyle (event, with its foods); when it annotates a clinical stream such as a glucose curve, the link is kept with that stream (Section 2.6).
- Medication bottle label (photo): 09-documents (image); medication to 04-medications.
- Medication, current or past: 04-medications.
- Microbiome test result: 16-omics.
- Mindfulness or meditation session: 19-lifestyle.
- Mobility equipment (wheelchair, walker): 06-observations (functional status and device list).
- Model registry (which AI models this record can use): _environment (Section 2.17).
- Order, pending (lab, imaging, referral): 10-care-plans; checked against recent results of the same test and flagged where one exists (Section 2.16).
- Operative report: 09-documents (original); procedure to 07-procedures.
- Power of attorney, healthcare: 13-directives; when it takes effect, control changes through a recorded permission change (Section 2.12).
- Pre-visit brief: not a folder: a view compiled for an upcoming visit from tasks, recent results, repeat flags, and medication changes (Section 2.16).
- Prescription: 04-medications.
- Procedure or surgery: 07-procedures.
- Questions for the next appointment: 12-journal in your own words, or a task in 10-care-plans when you want it tracked to done (Section 2.16).
- Recovery metrics (heart rate variability, resting heart rate, training load): 19-lifestyle.
- Recovery phrase or key shares: not filed in the record at all: the phrase is written down and kept by the person, and shares live where the person placed them (Section 5.4).
- Redemption receipt: not a filed document: the person’s copy lives in the access history, and the recipient keeps their own copy as proof the disclosure was authorized (Section 5.5).
- Referral: 10-care-plans.
- Regenerative or experimental treatment: 07-procedures or 04-medications as applicable, full provenance even without a code (Section 3).
- Rehabilitation or physical therapy log: 06-observations; plan to 10-care-plans.
- Request for disclosure: not a filed document: recorded in the access history with its outcome; confers no access by itself and expires if unanswered (Section 5.5).
- School liaison correspondence: 18-education-support.
- School therapy plan and progress: 18-education-support.
- Screenshot of a health app: 09-documents (image); decomposed per Section 2.6.
- Sleep data: 19-lifestyle when self-tracked; 09-documents and 06-observations for a clinical sleep study.
- Social needs screening (housing, food, transportation): 15-life-context, behind its boundary.
- Substance use disorder treatment record: files in its normal domain folders but is held behind the legally required boundary (Section 4.3).
- Supplement or vitamin: 04-medications (kept separate from prescriptions).
- Task or to-do (yours, a caregiver’s, or one the record proposed): 10-care-plans; done tasks stay, marked complete with the date and who marked them (Section 2.16).
- Symptom you noticed: 12-journal (your words) or 06-observations (person-entered fact).
- Therapy goal (developmental, speech, occupational, physical): 10-care-plans (goal entries, Section 2.11).
- Training log or workout block, self-directed: 19-lifestyle.
- Translation of an entry: not a separate fact: a derived layer kept with the original entry (Section 5.3).
- Trustee or break-glass designation: not a filed document: a signed, portable authorization in the record’s permissions (Section 5.4); any legal papers behind it file to 13-directives.
- Vaccination card (photo): 09-documents (image); doses to 05-immunizations.
- Visit: 08-encounters.
- Vital signs: 06-observations.
- Weight: 06-observations.
