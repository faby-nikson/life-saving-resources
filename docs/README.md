# Docs

Aide-mémoire personnels. Un fichier par sujet, ou un dossier quand il y a des exemples de code à côté.

Ici on répond à « c'était quoi la commande / la syntaxe pour... ? ». Pour *monter une machine*, c'est
[`setup/`](../setup).

| Sujet | Exemples |
|---|---|
| [Git](./git.md) | |
| [Docker](./docker.md) | |
| [PHP](./php) — [Symfony](./php/symfony.md), [outillage](./php/tooling.md) | [scripts PHP](./php/examples) |
| [Unix shell / bash](./unix-shell.md) | |
| [Ubuntu](./ubuntu.md) | |
| [Nano](./nano.md) | |
| [Markdown](./markdown.md) | |
| [TCP / UDP](./tcp-udp.md) | |

## Conventions

- Un nom de fichier en minuscules, sans espace.
- Un sujet devient un **dossier** (`sujet/README.md`) dès qu'il a des exemples ou plusieurs pages.
- Les exemples vivent à côté du doc qui les explique, dans `<sujet>/examples/`.
- Ce qui n'est plus maintenu part dans [`stale/`](./stale) plutôt que d'être supprimé.
