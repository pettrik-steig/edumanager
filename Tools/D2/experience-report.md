project: EduManager 2026
created: 2026-05-28 (Data)
changed: 2026-05-28 (Data)

# D2 Experience Report

## Context

D2 was imported and tried as a text-based diagram tool for early EduManager
architecture and workflow concept work.

The expectation was that D2 could serve as a versionable whiteboard: diagrams
would be written as text, previewed in IntelliJ, and optionally rendered with
the project-local CLI.

## What Worked

D2 was easy to install as a local executable and worked well with the IntelliJ
D2 plugin after the plugin was configured with the full path to the executable.

The CLI successfully compiled `.d2` files, and the text-based source files were
easy to edit, diff, and keep near project documentation.

D2 also helped clarify some modeling distinctions during the experiment:

- actor
- data store
- transferred data
- information transfer
- medium category such as human, mechanical, or electronic

## What Did Not Work Well

D2 was not a good fit for early exploratory concept work where spatial
placement carries meaning.

The automatic layout often placed shapes too far apart or in ways that did not
match the intended conceptual structure. This created friction because the
diagram position itself was part of the thinking.

Several adjustments were possible, such as direction changes, classes, shape
selection, and style tuning, but those adjustments still worked around the
layout engine instead of giving direct conceptual control.

D2 also made larger diagrams hard to keep usable on an A4-like mental canvas.
Once a diagram needed many nodes and relationships, splitting it into smaller
diagrams became necessary.

## Conclusion

The D2 experiment is considered a constructive failure for early architecture
and domain concept work.

D2 remains useful as an imported external tool for small, stable diagrams or
for presenting an already-understood result. It should not be treated as the
primary thinking tool for exploratory concept modeling.

For early concept work, paper, a whiteboard, or a free-positioning diagram
editor is likely more suitable. D2 can still be used later when a relationship
structure is stable enough that automatic layout is acceptable.

## Archived Experiment Material

The first D2 attempts have been archived in:

```text
Tools/D2/d2-experiments-2026-05-28.zip
```

The archive contains the former D2 development sketches and related notes from
`docs/Development`.
