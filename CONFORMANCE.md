# Conformance Policy

This policy governs any claim that a product, service, or implementation conforms to the Person-Sovereign Health Record (PSHR) Architecture. It has five parts.

## 1. Self-certification with public challenge

An implementer conforms by publishing a conformance statement: which specification version it conforms to, which tier (Section 3), and, for each section in that tier, a short description of how the implementation satisfies it. There is no certifying body and no fee. Any party may file a challenge against a published statement by opening an issue in this repository that names the section, the claimed behavior, and the observed behavior. The implementer has 60 days to respond publicly with a correction, a rebuttal, or a withdrawal of the claim. Statements with an unanswered challenge after 60 days are listed as disputed.

## 2. What conformance means

A conforming implementation makes the person's record readable without the implementation, portable by copying, and leavable: the person can move the record, its recovery materials, its designations, and its environment folder to another conforming implementation without re-encryption and without the cooperation of the implementation being left. Any implementation that requires its own software to read the record, or holds material without which the person cannot leave, does not conform, whatever else it does.

## 3. Tiers

**Core.** The record tree and readable pairing (Section 2), the two clocks (Section 2.5), source links for every entry and model identity for every AI-produced entry (Section 3), sharing permissions and the access history (Section 4), categories protected by law as a function of jurisdiction (Section 4.3), hosting is not access (Section 5), the key hierarchy, recovery phrase, and control designations (Section 5.4), context files (Section 6.1), and the approval gate, the trust record, and the never-graduating categories (Section 7).

**Complete.** Core plus continuous data (Section 2.6), condition and body-system views (Sections 2.9 and 2.14), records held on behalf of another person (Section 2.12), tasks, the repeat check, and the pre-visit brief (Section 2.16), the environment folder with governed model selection (Section 2.17), translation as a derived layer (Section 5.3), and the network objects: participant identity, requests, redemption receipts, and disclosure proofs (Section 5.5).

A statement names one tier. An implementation may describe Complete sections it partially supports, but the claim is Core until every Complete section is satisfied.

## 4. Version-bound claims

Every conformance claim names the specification version it was made against, for example "conforms to PSHR Architecture v0.20, Core." A claim does not carry forward to a later version automatically. When a new version is released, the changelog states which sections changed; a claim against the prior version remains valid as a claim against that version and must be restated to cover the new one.

## 5. Use of the name

"PSHR" and "Person-Sovereign Health Record" may be used to describe a conforming implementation in the form "conforms to PSHR Architecture vX.Y, [tier]." They may not be used to describe an implementation with no published statement or with a disputed statement, and they may not be used in a way that implies endorsement by Precision Health Ventures.
