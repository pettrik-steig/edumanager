project: EduManager 2026
created: 2026-05-23 (Data)
changed: 2026-05-23 (Data)

# Common Conventions

## Single Point Of Truth

Project documentation should try to follow a single-point-of-truth principle.

Each stable agreement should have one primary home when practical. Other
documents may reference that home, but should avoid restating the full agreement
unless a short reminder helps readability.

Current homes:

- language rules: `docs/Conventions/language.md`
- file format and file usage rules: `docs/Conventions/fileformat.md`
- file, directory, and artifact naming rules: `docs/Conventions/naming.md`
- old Sitzplan reference access: `docs/reference-sitzplan.md`

Current documentation areas:

- `docs/State`: current project state
- `docs/Development`: planned work, ideas, and general development material
- `docs/Development/Alex`: special or temporary material for Alex
- `docs/Development/Data`: special or temporary material for Data
- `docs/Development/Spock`: special or temporary material for Spock
- `docs/Development/Ray`: special or temporary material for Ray

State documentation rule:

- `docs/State` describes the current state only
- it should not explain older states or the path that led to the current state
- setup history, rationale, transition notes, and "how we got here" material
  belong in `docs/Development`

History documentation rule:

- project history is written newest first
- older entries move downward in the same file
- each entry should keep its concrete date in the heading

When an agreement changes, update its primary home first when practical. Then
update only those secondary references that would otherwise become misleading.

## Reference Material

Copied documents from the old Sitzplan project are reference material until
they are explicitly rewritten for EduManager.

Reference documents may temporarily keep old wording, old headers, old dates,
or Sitzplan-specific assumptions. They should not be treated as EduManager
working agreements unless a new EduManager convention document adopts them.

## Scope Discipline

Conventions should stay close to their topic.

Examples:

- language rules belong in `language.md`
- file extensions, encodings, and file usage belong in `fileformat.md`
- file and directory naming rules belong in `naming.md`
- broad documentation organization rules belong in `common.md`

If a convention starts to grow into domain, architecture, lifecycle, or use-case
content, it should usually move into a more specific document.

## Convention Maintenance

Conventions are preferred working agreements, not immutable rules.

If a convention creates practical problems, ambiguity, unnecessary friction, or
architectural drift, it should be reviewed and revised as soon as reasonably
possible.

The preferred response to a bad convention is to improve the convention, not to
silently work around it.

## Tool Usage

Alex prefers working with tools through IntelliJ IDEA when practical.

The console is useful for checks, automation, and cases where it is the clearest
or only practical path, but it is not the preferred everyday interaction
surface.

Shared working processes should be callable from IntelliJ IDEA when practical.
Builds, checks, generation steps, and project-local scripts should not become
Data-only command-line magic.

Data should prefer the same project-local paths that Alex can run from the IDE.
If Data introduces a script for repeated work, a matching IntelliJ run
configuration should be added when practical.

Data should prefer scripts or reusable project-local automation for repeated
technical tasks. This reduces AI workload, avoids fragile manual tool usage, and
makes local tooling problems easier to diagnose and fix.

When a local tool problem is solved once, especially around sandbox limits,
permissions, paths, encodings, or missing command-line tools, the solution
should be captured in a script or a short documented workflow when practical.

The goal is that Data does not repeatedly run into the same local technical
problem in later sessions.

## Minimal Duplication

Documentation may include short cross-references, but should avoid copying
whole explanations across multiple files.

Duplication is acceptable only when:

- a brief local reminder prevents misinterpretation
- a format or tool requires local repetition
- a copied old reference document has not yet been normalized

## Change Tracking

Project text headers track only file-level provenance:

```text
project: EduManager 2026
created: YYYY-MM-DD (<from>)
changed: YYYY-MM-DD (<by>)
```

They are not a changelog. Larger decisions, design changes, or historical
notes should be documented in the appropriate project document instead of being
accumulated in file headers.
