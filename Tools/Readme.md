project: EduManager 2026
created: 2026-05-23 (Data)
changed: 2026-05-23 (Data)

# Tools

This directory contains project-local helper scripts for EduManager.

The goal is to make repeated local checks reproducible and to avoid
rediscovering known PATH, sandbox, alias, and permission issues.

Current scripts:

- [check-tools.ps1](check-tools.ps1): verifies the local development toolchain

Imported external tools:

- [d2.exe](d2.exe): local D2 CLI executable for rendering text-based diagrams
- [D2_USAGE_BUNDLE](D2_USAGE_BUNDLE/README.md): imported D2 usage notes and
  examples

The D2 executable is kept in this directory and can be called with explicit
source and target paths from any working directory.

Example:

```powershell
& ".\Tools\d2.exe" ".\docs\Architecture\example.d2" ".\runtime\diagrams\example.svg"
```

Generated diagram output should normally go to `runtime` unless a stable
rendered artifact is intentionally part of the documentation.
