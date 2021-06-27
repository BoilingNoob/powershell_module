Clear-Host
$debug = $true
#if($debug){write-host("")}

$destinations = $env:PSModulePath.split(';')
if($debug){$destinations}

$destinations = $destinations|Where-Object{Test-Path $_}
if($debug){"`n",$destinations}

$destinations|ForEach-Object{
    Copy-Item .\myModule.psm1 -Destination $_ -Force
}

Import-Module '.\myModule.psm1' -Force