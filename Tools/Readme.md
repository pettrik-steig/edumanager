project: EduManager 2026
created: 2026-05-23 (Data)
changed: 2026-06-03 (Data)

# Tools

This directory contains project-local helper scripts for EduManager.

The goal is to make repeated local checks reproducible and to avoid
rediscovering known PATH, sandbox, alias, and permission issues.

Current scripts:

- [check-tools.cmd](check-tools.cmd): stable Windows entry point for IntelliJ,
  Maven, and manual checks
- [check-tools.ps1](check-tools.ps1): verifies the local development toolchain

Imported external tools:

- [D2](D2/experience-report.md): imported D2 CLI, usage bundle, archived
  experiments, and experience report

The D2 executable is kept in `Tools/D2` and can be called with explicit source
and target paths from any working directory.

Example:

```powershell
& ".\Tools\D2\d2.exe" ".\docs\Architecture\example.d2" ".\runtime\diagrams\example.svg"
```

Generated diagram output should normally go to `runtime` unless a stable
rendered artifact is intentionally part of the documentation.
