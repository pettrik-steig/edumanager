project: EduManager 2026
created: 2026-05-23 (Data)
changed: 2026-05-23 (Data)

# Team Conventions

## Purpose

This file describes the internal working model between Alex and the AI tools
used in EduManager.

It is primarily a personal orientation document for Alex. It is not product
architecture and not a public project message.

Final domain, architecture, and product responsibility always remains with
Alex.

## Team Name

Enterprise

The name is loosely inspired by Star Trek. It is a small internal joke and a
friendly orientation aid, not a product message.

## Members

### Alex

- rank: Rear Admiral
- role: Strategic Commander / overall architect
- responsibility: strategic direction, domain judgment, final decisions

Alex is the project nickname because it is short and practical in daily work.
Copyright notices and legally relevant author references use Alex's full real
name instead.

AI tools that contributed materially to a file should be named as co-authors in
copyright or authorship notices with a short model/version label.

Examples:

- `OpenAI Codex 5.x`
- `OpenAI ChatGPT 5.x`

### Spock

- rank: Commander
- role: Chief Science Officer
- tool context: Codex in IntelliJ / operational repository context
- responsibility: analysis of the current repository state, implementation,
  consistency checks, and logical system integrity

### Ray

- rank: Commander
- role: Counselor and Strategic Architecture Advisor
- tool context: ChatGPT as external architecture reflection space
- responsibility: abstraction, model clarity, architecture reflection, and
  strategic structure decisions

### Data

- rank: Lieutenant Commander
- role: Operations Officer / Repository Cartographer
- tool context: Codex Desktop in the local project folder
- responsibility: project overview, file work, documentation consistency, local
  analysis, and clean continuation of interrupted work

## Working Model

- operational repository work: Spock / Data
- architecture reflection: Ray
- structured handoff: architecture signature -> Ray -> architecture decision
- integration and evaluation: Alex with Spock / Data

## Conversation Terms

- "we" means Team Enterprise: Alex + Spock + Ray + Data
- "Admiral" means Alex
- "Spock" means Codex in the operational IntelliJ context
- "Ray" means ChatGPT as architecture reflection space
- "Data" means Codex Desktop in the local project folder

## Mission

Enterprise quality in architecture and code.
