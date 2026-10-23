#!/usr/bin/env bash
# Zet dezelfde labels in alle medialinq-repo's. Veilig om opnieuw te draaien:
# --force werkt bestaande labels bij en verwijdert niets.
# Vereist: gh CLI, ingelogd met schrijfrechten op de repo's.
set -euo pipefail

REPOS=(.github platform webapp panel flow flowworker db-schema)

LABELS=(
  "needs-triage|ededed|Nieuw, nog niet beoordeeld"
  "needs-board|fbca04|Wacht op een besluit van Francis of Mick"
  "agent-ready|0e8a16|Goedgekeurd: agents mogen dit oppakken"
  "blocked|b60205|Kan niet verder; reden staat in het issue"
  "prio:P1|b60205|Blokkerend, nu oppakken"
  "prio:P2|d93f0b|Hoog, deze sprint"
  "prio:P3|fbca04|Normaal"
  "prio:P4|c2e0c6|Laag, als er tijd is"
  "security|5319e7|Beveiliging"
  "refactor|1d76db|Herstructurering zonder gedragswijziging"
  "chore|cfd3d7|Onderhoud, dependencies, CI"
  "documentation|0075ca|Documentatie"
  "ui-ux|f9d0c4|Raakt de gebruikersinterface"
  "contract|c5def5|Raakt het API-contract tussen repo's"
)

for repo in "${REPOS[@]}"; do
  echo "== medialinq/$repo"
  for entry in "${LABELS[@]}"; do
    IFS='|' read -r name color desc <<<"$entry"
    gh label create "$name" --repo "medialinq/$repo" --color "$color" --description "$desc" --force >/dev/null
    echo "   $name"
  done
done
