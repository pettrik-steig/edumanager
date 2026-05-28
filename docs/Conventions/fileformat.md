project: EduManager 2026
created: 2026-05-23 (Data)
changed: 2026-05-23 (Data)

# File Format Conventions

## Text Encoding

All text-based files in this project use UTF-8 without BOM.

This applies to source code, documentation, configuration files, scripts,
project metadata, and text-based data files.

## Text File Header

All text-based project files should start with:

```text
project: EduManager 2026
created: YYYY-MM-DD (<from>)
changed: YYYY-MM-DD (<by>)
```

`created` is the first content creation date of the file and is not changed for
copies, moves, or renames. `changed` is the date of the last meaningful content
change. `<from>` and `<by>` each name exactly one person or AI tool. `project`
names the project title.

This header is a project convention for provenance, not a replacement for
language-specific metadata where such metadata is technically required.

If a file format treats raw header lines as executable syntax, patterns, or
configuration entries, write the provenance header as comments using the native
comment syntax of that format.

## File Types And Usage

### `.md`

Markdown documentation.

Usage:

- stable project documentation
- conventions
- architecture notes
- domain lifecycle notes
- use-case descriptions
- handover and reference notes

Rules:

- UTF-8 without BOM
- starts with the project text header
- old Sitzplan documents copied as reference may temporarily keep their old
  header style until they are rewritten for EduManager

### `.java`

Java source code for the main application.

Usage:

- domain model
- application services
- persistence adapters
- UI code if and when a Java UI is added
- tests when the Java test structure is defined

Rules:

- UTF-8 without BOM
- Java release target to be defined by the project setup
- source files should follow the project text-header rule unless a later Java
  source-header convention supersedes it
- copyright headers for `src` will be configured when the IntelliJ project and
  source tree are started

### `.py`

Python tooling code.

Usage:

- import/export helpers
- validation scripts
- migration tools
- test data generation
- development automation outside the Java core

Rules:

- UTF-8 without BOM
- not part of the Java application core

### `.edu`

EduManager project file or project package.

Usage:

- persisted EduManager project data
- stable user-facing project storage format

Current state:

- planned file extension
- physical structure not yet decided
- may become a single file, a structured archive, or a directory-backed format

Rules:

- must have explicit format versioning
- must preserve project identity and object identity rules
- must distinguish internal persistence from external import/export files

### `.json`

Structured text data.

Usage:

- candidate format for internal project metadata
- candidate format for machine-readable configuration
- candidate format for generated diagnostics or validation reports

Rules:

- UTF-8 without BOM
- use structured JSON parsing/writing, not ad-hoc string construction
- field names should be stable once persisted

### `.csv`

External tabular exchange data.

Usage:

- student import files
- timetable import candidates
- administrative export/import bridge files

Rules:

- external CSV encoding may differ from project encoding and must be detected or
  explicitly configured
- imported CSV data is external data, not internal project persistence
- import means explicit integration into project state

### `.txt`

Plain text notes or generated text output.

Usage:

- simple logs
- diagnostics
- temporary plain-text exports

Rules:

- UTF-8 without BOM for project-owned files
- prefer `.md` when the file has lasting documentation value

### `.svg`

Scalable Vector Graphics.

Usage:

- documentation images that should remain sharp in IntelliJ or a browser
- source vector assets when intentionally maintained as SVG

Rules:

- generated SVGs should usually be committed only when they are intentionally
  useful as stable documentation artifacts
- generated temporary previews should normally go to `runtime`
- SVG files imported from external tools or bundles should not be normalized
  unless they become EduManager-owned source assets

### `.xml`

XML configuration.

Usage:

- Maven project files if Maven is used
- IDE or tool configuration where XML is the native format

Rules:

- UTF-8 without BOM where configurable
- do not use XML for domain persistence unless a concrete need appears

### `.properties`

Java-style key-value configuration.

Usage:

- Java resource configuration
- localization candidates
- simple tool settings

Rules:

- UTF-8 without BOM where supported
- keep keys stable and descriptive

### `.ps1`

PowerShell scripts for Windows-oriented development automation.

Usage:

- setup checks
- local verification helpers
- developer convenience scripts

Rules:

- UTF-8 without BOM
- keep destructive actions explicit and guarded

### `.cmd` / `.bat`

Windows command scripts.

Usage:

- thin wrappers around Java, Maven, Python, or PowerShell commands
- compatibility helpers for IntelliJ or Windows shell integration

Rules:

- UTF-8 without BOM where practical
- prefer PowerShell for more complex Windows automation

### `.gitignore`

Git ignore rules.

Usage:

- exclude generated build output
- exclude local runtime files
- exclude temporary files

Rules:

- UTF-8 without BOM
- use commented provenance header lines
- keep project-relevant source and documentation files trackable

### `.gitattributes`

Repository file behavior rules.

Usage:

- line-ending normalization
- text/binary classification
- encoding-related repository policy where Git can enforce it

Rules:

- UTF-8 without BOM
- use commented provenance header lines
- should support consistent Windows development without hiding real format
  problems

### `.editorconfig`

Editor-neutral formatting rules.

Usage:

- line endings
- indentation
- final newline behavior
- charset hints

Rules:

- UTF-8 without BOM
- should be kept aligned with this file-format convention

### Binary Assets

Binary assets do not follow the text-header rule.

Usage:

- images
- icons
- generated PDFs
- packaged archives
- binary test fixtures

Rules:

- store only when they are source assets or intentionally versioned references
- generated binaries should normally be excluded unless explicitly needed
