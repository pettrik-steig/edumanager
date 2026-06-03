# project: EduManager 2026
# created: 2026-05-23 (Data)
# changed: 2026-06-03 (Data)

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

function ConvertTo-ProcessArgument {
    param(
        [Parameter(Mandatory = $true)]
        [string] $Argument
    )

    if ($Argument -notmatch '[\s"]') {
        return $Argument
    }

    return '"' + ($Argument -replace '\\(?=")', '\\' -replace '"', '\"') + '"'
}

function Invoke-VersionCheck {
    param(
        [Parameter(Mandatory = $true)]
        [string] $Name,

        [Parameter(Mandatory = $false)]
        [AllowEmptyString()]
        [string] $Path,

        [Parameter(Mandatory = $false)]
        [string[]] $Arguments = @("--version"),

        [Parameter(Mandatory = $false)]
        [bool] $Required = $true
    )

    if (-not $Path) {
        [PSCustomObject]@{
            Tool = $Name
            Status = if ($Required) { "missing" } else { "optional-missing" }
            Path = ""
            Version = ""
        }
        return
    }

    try {
        $processStartInfo = [System.Diagnostics.ProcessStartInfo]::new()
        $processStartInfo.FileName = $Path
        $processStartInfo.UseShellExecute = $false
        $processStartInfo.RedirectStandardOutput = $true
        $processStartInfo.RedirectStandardError = $true
        $processStartInfo.Arguments = (($Arguments | ForEach-Object {
            ConvertTo-ProcessArgument $_
        }) -join " ")

        $process = [System.Diagnostics.Process]::Start($processStartInfo)
        $stdout = $process.StandardOutput.ReadToEnd()
        $stderr = $process.StandardError.ReadToEnd()
        $process.WaitForExit()

        $output = @()
        if ($stdout) {
            $output += ($stdout -split "`r?`n" | Where-Object { $_ })
        }
        if ($stderr) {
            $output += ($stderr -split "`r?`n" | Where-Object { $_ })
        }

        if ($process.ExitCode -ne 0) {
            [PSCustomObject]@{
                Tool = $Name
                Status = "failed"
                Path = $Path
                Version = (($output | Select-Object -First 3) -join " | ")
            }
            return
        }

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

$knownGit = Join-Path $env:USERPROFILE "AppData\Local\Programs\Git\cmd\git.exe"
$knownMaven = Join-Path $env:ProgramFiles "JetBrains\IntelliJ IDEA 2025.3.2\plugins\maven\lib\maven3\bin\mvn.cmd"
$knownPython = Join-Path $env:USERPROFILE "AppData\Local\Python\pythoncore-3.14-64\python.exe"
$knownJava = Join-Path $env:ProgramFiles "Eclipse Adoptium\jdk-25.0.3.9-hotspot\bin\java.exe"
$knownRipgrep = Join-Path $env:USERPROFILE "AppData\Local\Microsoft\WinGet\Packages\BurntSushi.ripgrep.MSVC_Microsoft.Winget.Source_8wekyb3d8bbwe\ripgrep-15.1.0-x86_64-pc-windows-msvc\rg.exe"

$git = Find-CommandPath "git.exe" @($knownGit)
$maven = Find-CommandPath "mvn.cmd" @($knownMaven)
$python = $knownPython
$java = Find-CommandPath "java.exe" @($knownJava)
$rg = Find-CommandPath "rg.exe" @($knownRipgrep)

$results = @()
$results += Invoke-VersionCheck "Git" $git @("--version")
$results += Invoke-VersionCheck "Maven" $maven @("-version")
$results += Invoke-VersionCheck "Python" $python @("--version")
$results += Invoke-VersionCheck "Java" $java @("-version")
$results += Invoke-VersionCheck "ripgrep" $rg @("--version")

$results | Format-Table -AutoSize

$failed = @($results | Where-Object { $_.Status -eq "missing" -or $_.Status -eq "failed" })
if ($failed.Count -gt 0) {
    exit 1
}
