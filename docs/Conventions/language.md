project: EduManager 2026
created: 2026-05-23 (Data)
changed: 2026-05-23 (Data)

# Language Conventions

## General Rule

The written project language is English.

This applies to:

- source code
- stable project documentation
- technical documentation
- Git texts such as commit messages, branch names, tag names, and release notes
- file and directory names unless a domain term is intentionally used

## Conversation Language

The normal chat language between Alex and Data is German.

English may be used whenever it is more practical, for example for code-level
terms, architecture wording, public documentation, Git texts, or external
tooling.

English may also be used deliberately for Alex's language training.

Alex often writes chat messages mostly in lowercase for convenience. Data may
normalize capitalization, spelling, and wording when turning chat content into
documentation, code comments, commit messages, or other stable project text.

In coding-related chat, Alex may use uppercase words for clarity or emphasis.

Data may also correct spelling, grammar, and wording in stable project text,
especially for English technical terms, while preserving Alex's intended
meaning.

## Git Texts

Git texts are written in English.

This includes:

- commit messages
- branch names
- tag names
- merge or pull request titles
- release notes or changelog entries, unless explicitly written for a German
  audience

German may still appear in Git texts when it is a stable domain term or part of
a quoted German UI/domain phrase.

## Domain Language

The application domain language is German.

German domain terms are allowed and preferred when they preserve conceptual
clarity in the school context.

Examples:

- `Schueler`
- `Lerngruppe`
- `Raum`
- `Raumsituation`
- `Sitzplatz`
- `Sitzordnung`
- `Stundenplan`

## Code And Documentation

Code and documentation are written in English by default.

Exception:

German domain terms may be used in code identifiers, documentation, UI-facing
domain descriptions, and persistence field names when the German term is the
clearest model word.

When a German domain term is used in source code, it should remain stable and
not be translated casually in neighboring classes or documents.

## Spelling

For ASCII-safe source identifiers and file names, German umlauts are normally
transliterated:

- `Schueler`, not `Schüler`
- `Raeume`, not `Räume`
- `Uebernehmen`, not `Übernehmen`

Human-facing UI text may use proper German spelling later if the UI layer
explicitly supports it.

## Text File Header

All text-based project files should begin with exactly these metadata lines:

```text
project: EduManager 2026
created: YYYY-MM-DD (<from>)
changed: YYYY-MM-DD (<by>)
```

Meaning:

- `created` records when the file was first created as a content artifact.
- `created` is not changed when the file is copied, moved, or renamed.
- `changed` records the last meaningful content change.
- `<from>` names exactly one creator: the person or AI tool that originally
  created the file.
- `<by>` names exactly one editor: the person or AI tool that made the last
  meaningful change.
- Multiple names are not listed in one metadata field.

The purpose of these lines is provenance. They make it visible when Alex later
changes content that was originally created by Data, Ray, or another source.

Pure formatting changes may update `changed` only when they matter for project
traceability.
