# Taibu AI OS Eesti — automaatne commit + push (valikuline)
#
# Käivitatakse Claude Code "Stop" hook'i poolt, kui Claude lõpetab vastuse.
# Aktiveeritakse .claude/settings.local.json kaudu (masinapõhine, gitignore-s).
#
# Turvaline disain:
#   - Töötab ainult git repos
#   - Commitib ainult kui on muudatusi
#   - .env ja *-service-account.json on .gitignore-s -> võtmeid ei pushita
#   - Ei blokeeri ega viska viga, kui midagi pole või võrku pole
#   - Vahele jäetakse, kui rebase/merge on pooleli

$ErrorActionPreference = 'SilentlyContinue'

if ((git rev-parse --is-inside-work-tree 2>$null) -ne 'true') { exit 0 }

$gitDir = git rev-parse --git-dir 2>$null
if ($gitDir) {
    if ((Test-Path "$gitDir/MERGE_HEAD") -or (Test-Path "$gitDir/rebase-merge") -or (Test-Path "$gitDir/rebase-apply")) {
        exit 0
    }
}

if (-not (git status --porcelain 2>$null)) { exit 0 }

git add -A 2>$null
$stamp = Get-Date -Format 'yyyy-MM-dd HH:mm'
git commit -m "auto: salvestatud $stamp" --no-verify 2>$null | Out-Null

if (git remote 2>$null | Select-String -Pattern '^origin$' -Quiet) {
    git push 2>$null | Out-Null
}

exit 0
