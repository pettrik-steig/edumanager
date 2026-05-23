# project: EduManager 2026
# created: 2026-05-23 (Data)
# changed: 2026-05-23 (Data)

$ErrorActionPreference = "Stop"

function Find-CommandPath {
    param(
        [Parameter(Mandatory = $true)]
        [string] $CommandName,

        [Parameter(Mandatory = $false)]
        [string[]] $FallbackPaths = @()
    )

    $command = Get-Command $CommandName -ErrorAction SilentlyContinue
    if ($null -ne $command -and $command.Source) {
        return $command.Source
    }

    foreach ($path in $FallbackPaths) {
        if (Test-Path -LiteralPath $path) {
            return $path
        }
    }

    return $null
}

function Invoke-VersionCheck {
    param(
        [Parameter(Mandatory = $true)]
        [string] $Name,

        [Parameter(Mandatory = $true)]
        [string] $Path,

        [Parameter(Mandatory = $false)]
        [string[]] $Arguments = @("--version")
    )

    if (-not $Path) {
        [PSCustomObject]@{
            Tool = $Name
            Status = "missing"
            Path = ""
            Version = ""
        }
        return
    }

    try {
        $output = & $Path @Arguments 2>&1
        [PSCustomObject]@{
            Tool = $Name
            Status = "ok"
            Path = $Path
            Version = (($output | Select-Object -First 3) -join " | ")
        }
    }
    catch {
        [PSCustomObject]@{
            Tool = $Name
            Status = "failed"
            Path = $Path
            Version = $_.Exception.Message
        }
    }
}

$knownGit = "C:\Users\Pettrik\AppData\Local\Programs\Git\cmd\git.exe"
$knownMaven = "C:\Program Files\JetBrains\IntelliJ IDEA 2025.3.2\plugins\maven\lib\maven3\bin\mvn.cmd"
$knownPython = "C:\Users\Pettrik\AppData\Local\Python\pythoncore-3.14-64\python.exe"
$knownJava = "C:\Program Files\Eclipse Adoptium\jdk-17.0.17.10-hotspot\bin\java.exe"

$git = Find-CommandPath "git.exe" @($knownGit)
$maven = Find-CommandPath "mvn.cmd" @($knownMaven)
$python = $knownPython
$java = Find-CommandPath "java.exe" @($knownJava)
$rg = Find-CommandPath "rg.exe"

$results = @()
$results += Invoke-VersionCheck "Git" $git @("--version")
$results += Invoke-VersionCheck "Maven" $maven @("-version")
$results += Invoke-VersionCheck "Python" $python @("--version")
$results += Invoke-VersionCheck "Java" $java @("-version")
$results += Invoke-VersionCheck "ripgrep" $rg @("--version")

$results | Format-Table -AutoSize

$failed = @($results | Where-Object { $_.Status -ne "ok" })
if ($failed.Count -gt 0) {
    exit 1
}
