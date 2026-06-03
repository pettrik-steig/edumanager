project: EduManager 2026
created: 2026-05-23 (Data)
changed: 2026-06-03 (Data)

# Environment

This file records the currently verified local development environment for
EduManager.

## Operating System

- edition: Windows 10 Pro
- version: `Microsoft Windows 10.0.19045`
- long paths:
  `HKLM\SYSTEM\CurrentControlSet\Control\FileSystem\LongPathsEnabled = 1`

## PowerShell

- version: `7.6.1`
- edition: `Core`

## Java

- vendor: Eclipse Adoptium / Temurin
- version: `25.0.3`
- build: `25.0.3+9-LTS`
- `JAVA_HOME`:
  `C:\Program Files\Eclipse Adoptium\jdk-25.0.3.9-hotspot\`
- Java executable:
  `C:\Program Files\Eclipse Adoptium\jdk-25.0.3.9-hotspot\bin\java.exe`
- javac executable:
  `C:\Program Files\Eclipse Adoptium\jdk-25.0.3.9-hotspot\bin\javac.exe`

Verified:

```text
openjdk version "25.0.3" 2026-04-21 LTS
javac 25.0.3
```

## Git

- version: `2.53.0.windows.1`
- executable:
  `C:\Users\Pettrik\AppData\Local\Programs\Git\cmd\git.exe`
- available in user `PATH`: yes
- `core.autocrlf`: `true`

PowerShell command resolution:

- use `Get-Command git`
- `where.exe git` is not reliable in the current Codex command context

## Maven

- version: `3.9.11`
- distribution: IntelliJ bundled Maven
- executable:
  `C:\Program Files\JetBrains\IntelliJ IDEA 2025.3.2\plugins\maven\lib\maven3\bin\mvn.cmd`
- available in user `PATH`: yes
- Maven home:
  `C:\Program Files\JetBrains\IntelliJ IDEA 2025.3.2\plugins\maven\lib\maven3`
- Java runtime:
  `C:\Program Files\Eclipse Adoptium\jdk-25.0.3.9-hotspot`
- default locale: `de_DE`
- platform encoding: `UTF-8`

Current Maven note:

- Maven prints a `Zugriff verweigert` line before normal version output in the
  Codex command context.
- Java 25 builds print a Maven/Guice warning about a terminally deprecated
  `sun.misc.Unsafe` call from Maven's bundled Guice dependency.
- Builds succeed despite both messages.
- Maven network access for plugin/dependency resolution requires running outside
  the Codex sandbox.

## Python

- version: `3.14.5`
- pip version: `26.1.1`
- Python Install Manager version: `26.2`
- executable:
  `C:\Users\Pettrik\AppData\Local\Python\pythoncore-3.14-64\python.exe`

`py list` reports:

```text
3.14[-64]  *  Python 3.14.5  PythonCore  3.14.5
```

Current Codex sandbox note:

- WindowsApps Python aliases fail in the Codex sandbox.
- Data automation should use the direct interpreter path or a project-local
  wrapper.

Problematic aliases in the Codex sandbox:

```text
C:\Users\Pettrik\AppData\Local\Microsoft\WindowsApps\python.exe
C:\Users\Pettrik\AppData\Local\Microsoft\WindowsApps\py.exe
C:\Users\Pettrik\AppData\Local\Microsoft\WindowsApps\pymanager.exe
```

## IntelliJ IDEA

- IDE: IntelliJ IDEA Ultimate
- version: `2026.1.2`
- installation directory:
  `C:\Program Files\JetBrains\IntelliJ IDEA 2025.3.2`
- project SDK: `temurin-25`
- language level: `JDK_25`
- project encoding configuration: `.idea/encodings.xml`
- project code style: `.idea/codeStyles`
- copyright profile: `.idea/copyright/EduManagerHeader.xml`

Additional JetBrains installation:

- CLion `2026.1.1`

## ripgrep

- version: `15.1.0`
- installed by WinGet package:
  `BurntSushi.ripgrep.MSVC_Microsoft.Winget.Source_8wekyb3d8bbwe`
- executable:
  `%USERPROFILE%\AppData\Local\Microsoft\WinGet\Packages\BurntSushi.ripgrep.MSVC_Microsoft.Winget.Source_8wekyb3d8bbwe\ripgrep-15.1.0-x86_64-pc-windows-msvc\rg.exe`
- available in user `PATH`: yes

## EduManager Java Project

- Maven project file: `pom.xml`
- group ID: `de.alex`
- artifact ID: `edumanager`
- version: `0.1.0-SNAPSHOT`
- Java release: `25`
- source encoding: `UTF-8`

Source tree:

```text
src/main/java
src/main/resources
src/test/java
src/test/resources
```

Runtime working directory:

```text
runtime
```

Current application entry point:

```text
de.alex.edumanager.app.Main
```

Current source-header/copyright baseline:

- copyright holder: Pettrik Steig
- AI co-authors:
  - OpenAI Codex 5.x
  - OpenAI ChatGPT 5.x
- license marker: `SPDX-License-Identifier: AGPL-3.0-only`

Verified build command:

```powershell
mvn clean test
```

Observed result:

```text
BUILD SUCCESS
```

## Project-Local Tool Scripts

- `Tools/check-tools.ps1`
- `Tools/check-tools.cmd`
- IntelliJ run configuration: `check-tools (Maven)`

Verified toolcheck result:

- Git: ok
- Maven: ok
- Python: ok
- Java: ok
- ripgrep: ok

Verified IDE-callable Maven goal:

```powershell
mvn exec:exec@check-tools
```

## IntelliJ Run Configurations

- `test (Maven)`: runs `mvn test`
- `main (Maven)`: runs `mvn exec:java@app-main`
- `main (Application)`: runs `de.alex.edumanager.app.Main`
- `check-tools (Maven)`: runs `mvn exec:exec@check-tools`

The `main (Maven)` run configuration uses `runtime` as working directory.
The `main (Application)` run configuration also uses `runtime` as working
directory.

## Open Environment Facts

- IntelliJ plugin list: open
- Python virtual environment setup: open
- Hardware details: open
