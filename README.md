# medialinq/.github

Gedeelde issue- en PR-templates voor alle repo's in de medialinq-organisatie.

GitHub gebruikt de templates uit deze repo voor elke medialinq-repo die geen
eigen `.github/ISSUE_TEMPLATE/` of PR-template heeft. Eén plek, geen kopieën.

**Deze repo moet public zijn**; anders negeert GitHub hem. Zet hier dus nooit
iets interns neer.

## Issue types

`Bug`, `Feature` en `Task` zijn issue types op organisatieniveau
(Organization settings → Planning → Issue types). De templates zetten het type
automatisch.

| Template | Type | Wanneer |
|---|---|---|
| Bug | Bug | iets werkt niet zoals het hoort |
| Feature | Feature | nieuw of gewijzigd gedrag voor de gebruiker |
| Taak | Task | onderhoud, refactor, CI, docs, security |

## Labels en de werkstroom

Labels bestaan per repo. `scripts/sync-labels.sh` zet ze in alle zes repo's
gelijk.

```
nieuw issue ──► needs-triage
                   │  triage: reproduceren, prio, ui-ux/contract/security
                   ▼
              agent-ready   ◄── alleen Francis of Mick
                   │
                   ▼
              plan van de CTO ──► board keurt goed (Slack)
                   │
                   ▼
              bouwen → review → security → QA → CI groen → merge
                   │
                   ▼
              release (tag) ◄── alleen Francis of Mick
```

Binnen een goedgekeurd plan werken en mergen de agents zelf. Terug naar de
board (`needs-board`) bij werk buiten het plan, schema, auth, CI/deploy, nieuwe
dependencies of verwijderen van code.

## CODEOWNERS

Per repo staat er een `CODEOWNERS`-bestand met alleen de gevoelige paden in
`.github/CODEOWNERS` van die repo zelf. Lokaal staat de bron in
`codeowners/<repo>`; die map gaat bewust niet mee in deze publieke repo. GitHub eist
voor die paden een review van het team `@medialinq/board`, ook als de rest van
een pull request automatisch mag mergen.
