# Usage: .\install.ps1 [-Target claude|codex|cursor]   (default: claude)
# Copies skills into the agent's skills folder. Same-named skill folders are overwritten.
# For claude it also copies CLAUDE.md (if none exists) and merges plugins.json into settings.json.
param([ValidateSet('claude','codex','cursor')][string]$Target = 'claude')
$ErrorActionPreference = 'Stop'
$src = $PSScriptRoot
$dst = Join-Path $HOME ".$Target"
New-Item -ItemType Directory -Force "$dst\skills" | Out-Null
Copy-Item "$src\skills\*" "$dst\skills" -Recurse -Force
Write-Host "Skills copied to $dst\skills"
if ($Target -eq 'claude') {
  if (-not (Test-Path "$dst\CLAUDE.md")) { Copy-Item "$src\CLAUDE.md" "$dst\CLAUDE.md" }
  else { Write-Host "CLAUDE.md exists, left unchanged. Merge $src\CLAUDE.md by hand." }
  $sf = "$dst\settings.json"
  $s = if (Test-Path $sf) { Get-Content $sf -Raw | ConvertFrom-Json } else { [pscustomobject]@{} }
  $p = Get-Content "$src\plugins.json" -Raw | ConvertFrom-Json
  foreach ($k in 'extraKnownMarketplaces','enabledPlugins') {
    if (-not $s.$k) { $s | Add-Member -NotePropertyName $k -NotePropertyValue ([pscustomobject]@{}) }
    foreach ($n in $p.$k.PSObject.Properties) { $s.$k | Add-Member -NotePropertyName $n.Name -NotePropertyValue $n.Value -Force }
  }
  $s | ConvertTo-Json -Depth 10 | Set-Content $sf -Encoding utf8
}
Write-Host 'Done. Restart the agent.'
