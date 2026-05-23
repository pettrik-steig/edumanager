project: EduManager 2026
created: 2026-05-23 (Data)
changed: 2026-05-23 (Data)

# Architecture Tool Candidates

## Purpose

This document records the first comparison of text-based diagram and
architecture tools for EduManager.

The goal is not a final tool decision for the whole project. The immediate
question is which tool should be tried first for early architecture thinking.

## Candidate Overview

### 1. Mermaid

Mermaid is a Markdown-friendly text-to-diagram tool.

It is useful for small diagrams embedded directly in documentation, especially
simple flows, dependency sketches, and quick documentation diagrams.

Initial decision:

- not selected as the primary architecture tool
- reason: too lightweight and sketch-oriented for the expected architecture
  work

### 2. C4 With Structurizr

C4 is an architecture visualization method. Structurizr is a concrete
models-as-code tool and DSL for C4-based architecture models.

It is useful when architecture concepts are ready to be stabilized into system
context, containers, components, relationships, and multiple views generated
from one model.

### 3. D2

D2 is a general text-to-diagram language.

It is useful for open early exploration, customer-level sketches, workflows,
data flows, conceptual relations, and first structural diagrams before the
architecture vocabulary is fully settled.

### 4. PlantUML

PlantUML is a mature and broad text-to-diagram tool with strong UML support and
many additional diagram types.

Initial decision:

- not selected for the first architecture step
- reason: too complex and formal for the current exploratory phase

## Structurizr And D2 Compared

Structurizr advantages:

- strong fit for C4 and software architecture modeling
- supports a single architecture model with multiple generated views
- encourages explicit system boundaries, containers, components, and
  relationships
- useful for stabilizing architecture decisions later

Structurizr disadvantages:

- can constrain thinking too early
- requires adopting C4 vocabulary before the problem shape is fully clear
- less suitable for free customer-level or discovery sketches

D2 advantages:

- more open and flexible for early ideas
- useful beyond software architecture
- closer to a text-based whiteboard
- suitable for workflows, conceptual maps, data flows, and informal structures

D2 disadvantages:

- less methodical than C4
- does not by itself enforce architecture consistency
- diagrams may become isolated sketches if no later structure is introduced

## Relationship Between D2 And Structurizr

D2 and Structurizr do not need to compete for the same role.

D2 is better suited for the open beginning of architecture work, where the
project still needs room for exploratory thinking and customer-level
understanding.

Structurizr is better suited for detail and stabilization once the architecture
has clearer boundaries and recurring concepts. At that point, C4 can help turn
open sketches into a consistent architecture model.

Working relation:

- D2 first for exploration
- Structurizr/C4 later for structured architecture detail and stabilization

## Initial Decision

EduManager first experimented with D2 in a separate local workspace project.

The initial spike produced:

- a local D2 CLI executable
- a compact imported D2 usage bundle
- a working IntelliJ D2 plugin setup using the full executable path
- a first EduManager `.d2` architecture sketch rendered to SVG

Current practical decision:

- D2 source files use `.d2`
- SVG is the initial rendered documentation format
- `Tools/d2.exe` is the project-local CLI path
- D2 import files in `Tools/D2_USAGE_BUNDLE` are external reference material
  and should not be rewritten as EduManager-owned documentation
