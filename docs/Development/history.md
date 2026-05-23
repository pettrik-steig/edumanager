project: EduManager 2026
created: 2026-05-23 (Data)
changed: 2026-05-23 (Data)

# Project History

## 2026-05-23 - Project Change From Sitzplan To EduManager

EduManager 2026 starts as a new project after the Sitzplan predecessor
prototype. The old project remains a reference for useful ideas, workflows, and
domain experience, but EduManager should develop its own documentation,
architecture, and source structure.

The initial focus is to preserve lessons learned while avoiding direct
structural carry-over where the old project had grown organically.

## 2026-05-23 - Development Environment Preparation

The initial development environment was prepared before deeper application
work started.

Current groundwork includes:

- Git repository initialization
- Maven-based Java project structure
- Java 25 toolchain selection
- IntelliJ IDEA project and run configurations
- shared project documentation structure
- basic conventions for language, files, naming, team workflow, and tooling
- a project-local tool check script

The goal is a reproducible setup that Alex can use from IntelliJ IDEA and Data
can use through the same project-local workflows where practical.

## 2026-05-23 - Architecture Tool Discussion

Several text-based diagram and architecture documentation options were
discussed for early architecture work.

The main candidates were Mermaid, C4 with Structurizr, D2, and PlantUML.
Mermaid was considered too lightweight as the main architecture tool, while
PlantUML was considered too broad and formal for the first exploratory step.

C4 with Structurizr remains attractive for structured architecture modeling
once the system shape becomes clearer. D2 was selected as the first experiment
because it is more open for early exploration, closer to a whiteboard workflow,
and can still be versioned as text in Git.

## 2026-05-23 - D2 Imported For First Architecture Sketches

The separate D2 spike was successful enough to import D2 into EduManager as a
project-local external tool.

The imported tool setup includes:

- `Tools/d2.exe` as the local D2 CLI executable
- `Tools/D2_USAGE_BUNDLE` as external usage notes and examples
- IntelliJ D2 plugin usage with the full path to `Tools/d2.exe`
- SVG rendering as the first practical output format

The first EduManager D2 sketch was placed under
`docs/Development/architecture` and rendered to SVG for direct IntelliJ
preview.
