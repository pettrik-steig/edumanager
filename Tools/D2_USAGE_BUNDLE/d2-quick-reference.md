project: D2 Local Spike
created: 2026-05-23 (Data)
changed: 2026-05-23 (Data)

# D2 Quick Reference

## What D2 Is Good For

D2 turns text into diagrams. For early architecture work, use it like a
versionable whiteboard:

- sketch relationships quickly
- keep diagram sources in Git
- render SVGs locally
- refine structure later when the model stabilizes

## CLI Basics

Check the CLI:

```powershell
d2.exe version
d2.exe --help
d2.exe layout
```

Render a diagram:

```powershell
d2.exe input.d2 output.svg
```

Useful output formats:

- `.svg`: best default for local docs and IntelliJ/browser preview
- `.png`: useful for sharing where SVG is not accepted
- `.pdf`: useful for printable output
- `.txt`: ASCII rendering for quick console output

## Minimal Diagram

```d2
x -> y: hello world
```

This creates two shapes and a labeled connection between them.

## Shapes

Declare a shape:

```d2
backend
```

Declare a shape with a label:

```d2
backend: Backend service
```

Give a shape a type:

```d2
database: Local database
database.shape: cylinder
```

Common shape values:

- `rectangle` default
- `circle`
- `square`
- `diamond`
- `cylinder`
- `cloud`
- `person`
- `page`
- `queue`

## Connections

Valid connection forms:

```d2
a -- b
a -> b
a <- b
a <-> b
```

Add a label:

```d2
teacher -> edumanager: uses
edumanager -> data: reads/writes
```

Important: connections reference shape keys, not labels.

```d2
be: Backend
fe: Frontend

# Correct: uses existing keys
be -> fe

# Usually wrong: creates new shapes named Backend and Frontend
Backend -> Frontend
```

Repeated connections are allowed and create separate edges.

## Containers

Use containers to group related parts:

```d2
system: EduManager {
  app: Application
  data: Local data

  app -> data: reads/writes
}
```

Nested maps avoid repeating long names:

```d2
school: School context {
  teacher: Teacher
  room: Room
  lesson: Lesson

  teacher -> lesson
  lesson -> room
}
```

Reference the parent scope from inside a container with `_`:

```d2
external: External system

app: EduManager {
  importer: Importer
  importer -> _.external: reads import file
}
```

## Layouts

The bundled local CLI currently provides:

- `dagre`: default, fast layered graph layout
- `elk`: bundled Eclipse Layout Kernel layout

List available engines:

```powershell
d2.exe layout
```

Choose a layout:

```powershell
d2.exe --layout=elk input.d2 output.svg
```

Set a diagram direction:

```d2
direction: right

a -> b -> c
```

Direction values:

- `up`
- `down`
- `right`
- `left`

## Style Basics

Style values can be attached to shapes or connections:

```d2
database: Local data {
  shape: cylinder
  style.fill: "#e9f5ff"
  style.stroke: "#2b6cb0"
}

app -> database: persists {
  style.stroke-dash: 3
}
```

Keep styles sparse during exploration. Prefer structure over decoration until
the diagram has stabilized.

## Comments

```d2
# This is a comment.
teacher -> edumanager
```

## Practical EduManager Defaults

Recommended first-pass conventions:

- store source diagrams as `.d2`
- render to `.svg`
- keep generated SVGs near the source only when they are useful to read in
  IntelliJ or project docs
- use English for technical labels unless a German domain term is clearer
- use stable ASCII-safe keys such as `schueler`, `lerngruppe`, `raum`
- use labels for human-facing spelling, e.g. `schueler: Schueler`

## Tiny Template

```d2
direction: right

teacher: Teacher
edumanager: EduManager
data: Local data {
  shape: cylinder
}

teacher -> edumanager: uses
edumanager -> data: reads/writes
```

## Local Upstream References

In the D2 spike workspace, deeper docs are available here:

```text
Originals\docs-d2lang\docs\tour
Originals\source\docs\INSTALL.md
Originals\source\README.md
```

Useful tour pages:

- `hello-world.md`
- `shapes.md`
- `connections.md`
- `containers.md`
- `layouts.md`
- `style.md`
- `themes.md`
- `exports.md`
- `sequence-diagrams.md`
- `classes.md`
- `grid-diagrams.md`
- `imports.md`
