if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "Run this script as Administrator."
    break
}

New-Item -Path "HKLM:\SOFTWARE\Policies\Google\Chrome" -Force | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Google\Chrome" -Name "ExtensionManifestV2Availability" -Value 2 -PropertyType DWord -Force

Write-Host "Manifest V2 enabled. Restart Chrome to apply changes." -ForegroundColor Green
