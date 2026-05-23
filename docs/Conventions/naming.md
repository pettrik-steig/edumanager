project: EduManager 2026
created: 2026-05-23 (Data)
changed: 2026-05-23 (Data)

# Naming Conventions

## Purpose

This file describes preferred naming conventions for files, directories, and
stable project artifacts.

More specific code naming rules may later live in architecture or source-code
convention documents.

## File Names

File names should usually be short, clear, and thematically specific.

Prefer names that describe the content or role of the file, not its temporary
editing state.

Project preference:

- directory names usually start with an uppercase letter
- regular file names usually start with a lowercase letter
- established ecosystem conventions take precedence

Examples of accepted convention-based exceptions:

- `README.md`
- `LICENSE`
- `CONTRIBUTING.md`

Prefer to avoid:

- `final`
- `new`
- `old`
- `v2`
- `latest`
- `last-version`
- unclear working titles that only make sense in the current chat

Versioning belongs primarily in Git and in explicit format/version metadata,
not in casual file suffixes, unless a specific situation makes such a suffix
useful.

## Separators

Preferred separators:

- `_` as a structural separator between major name parts
- `-` to bind words inside one name part

Examples:

- `03_ENVIRONMENT_YYYY-MM-DD.md`
- `domain-lifecycle.md`
- `fileformat.md`
- `identity-and-mapping.md`

## Dates In File Names

Use ISO dates:

```text
YYYY-MM-DD
```

Dated file names may be useful for snapshot-like documents, generated
handoffs, history documents, or time-bound working notes.

For stable convention files, prefer undated names.

References to dated document families should usually use date-neutral patterns
when the exact file is not important.

Example:

```text
02_WORKFLOW_YYYY-MM-DD.md
```

## Directory Names

Directory names should usually describe a stable category, not a temporary task.

Use singular or plural according to the category meaning:

- singular for one conceptual area: `Architecture`, `Domain`, `Tooling`
- plural for collections of similar documents: `Conventions`

Keep top-level documentation directories few and meaningful.

## Temporary Names

Temporary files are allowed when they are useful for active work.

Temporary names should still be understandable enough to clean up later.

Temporary material should move into a stable document or be deleted once its
purpose is finished.

## Domain Terms

German domain terms may appear in names when they are the clearest model words.

Use ASCII-safe spelling for file names and code identifiers unless a later UI or
content rule explicitly allows proper German spelling.

Examples:

- `schueler-import.md`
- `lerngruppe-use-cases.md`
- `raumsituation-lifecycle.md`
