project: D2 Local Spike
created: 2026-05-23 (Data)
changed: 2026-05-23 (Data)

# D2 Usage Bundle

This directory is a compact handoff bundle for using D2 in another local
project, especially EduManager.

It is intentionally small. It does not copy the full upstream documentation.
For deeper questions, use the locally cloned originals in the D2 spike
workspace:

```text
Originals\docs-d2lang
Originals\source
```

## Contents

- `d2-quick-reference.md`: compact syntax and workflow notes.
- `examples\basic-flow.d2`: minimal directed flow.
- `examples\container-sketch.d2`: simple nested architecture sketch.
- `examples\layout-options.d2`: small example with layout direction.

## Recommended Local Workflow

1. Write a `.d2` file in the project.
2. Render it to SVG with the local D2 CLI.
3. Preview the SVG in IntelliJ or a browser.
4. Commit the `.d2` source. Commit generated SVGs only when they are useful as
   stable documentation artifacts.

Example command:

```powershell
path\to\d2.exe docs\diagrams\example.d2 docs\diagrams\example.svg
```

When running a relative executable path in PowerShell, use the call operator:

```powershell
& ".\Tools\d2-v0.7.1\bin\d2.exe" Examples\hello.d2 Output\hello.svg
```
