$TemplateRoot = "$HOME\flutter_templates"

Write-Host "===================================="
Write-Host "      Flutter Project Generator"
Write-Host "===================================="

$templates = Get-ChildItem $TemplateRoot -Directory

for ($i = 0; $i -lt $templates.Count; $i++) {
    Write-Host "$($i + 1)) $($templates[$i].Name)"
}

Write-Host ""

$choice = Read-Host "Select template"

$templatePath = $templates[$choice - 1].FullName

if (!(Test-Path $templatePath)) {
    Write-Host "Invalid Selection"
    exit
}

if (!(Test-Path "pubspec.yaml")) {
    Write-Host "Run inside Flutter project"
    exit
}

$projectName = (
    Select-String "^name:" pubspec.yaml
).Line.Split(":")[1].Trim()

Write-Host "Project Name: $projectName"

(Get-Content "$templatePath\master_pubspec.yaml") `
-replace "PROJECT_NAME_PLACEHOLDER", $projectName |
Set-Content "pubspec.yaml"

Remove-Item "lib" -Recurse -Force -ErrorAction Ignore

New-Item -ItemType Directory -Path "lib" | Out-Null

Copy-Item "$templatePath\flutter_core\*" "lib" -Recurse

if (Test-Path "$templatePath\assets") {

    Remove-Item "assets" -Recurse -Force -ErrorAction Ignore

    Copy-Item "$templatePath\assets" "." -Recurse
}

Get-ChildItem "$templatePath" | ForEach-Object {

    if ($_.Name -in @(
        "flutter_core",
        "assets",
        "master_pubspec.yaml"
    )) {
        return
    }

    Copy-Item $_.FullName "." -Recurse
}

flutter pub get

Get-ChildItem lib -Recurse -Filter *.dart | ForEach-Object {

    (Get-Content $_.FullName) `
    -replace "package:flutter_template/", `
    "package:$projectName/" |
    Set-Content $_.FullName
}

dart format lib

Write-Host "===================================="
Write-Host "Project Ready"
Write-Host "===================================="
