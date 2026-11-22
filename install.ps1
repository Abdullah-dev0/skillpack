# Copies skills and CLAUDE.md into ~/.claude and merges plugins.json into settings.json.
# Existing skill folders with the same name are overwritten. Other settings keys are kept.
$ErrorActionPreference = 'Stop'
$src = $PSScriptRoot
$dst = Join-Path $HOME '.claude'
New-Item -ItemType Directory -Force "$dst\skills" | Out-Null
Copy-Item "$src\skills\*" "$dst\skills" -Recurse -Force
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
Write-Host 'Done. Restart Claude Code.'
