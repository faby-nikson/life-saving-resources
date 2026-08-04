# Life-saving resources

De la doc, des liens, des gifs, des tutos, ... Tout ce qui pourrait servir peut-être ici. Aussi des scripts.

Le repo est rangé par **ce qu'on en fait**, pas par type de fichier :

| Dossier | C'est quoi | Quand j'y vais |
|---|---|---|
| [`docs/`](./docs) | Aide-mémoire par sujet (git, docker, php, shell...) | « c'était quoi la commande pour... ? » |
| [`links/`](./links) | La collection de liens (écologie, bouffe, musique, memes) | « j'avais un lien pour ça » |
| [`setup/`](./setup) | Installer et configurer une machine Ubuntu de zéro | nouveau PC, ou réinstall |
| [`bin/`](./bin) | Les outils du quotidien, à mettre dans le `PATH` | tous les jours |

## docs/

Aide-mémoire. Un fichier par sujet, ou un dossier quand le sujet a plusieurs pages.

- [Git](./docs/git.md)
- [Docker](./docs/docker.md)
- [PHP](./docs/php) — [Symfony](./docs/php/symfony.md), [outillage](./docs/php/tooling.md)
- [Unix shell / bash](./docs/unix-shell.md)
- [Ubuntu](./docs/ubuntu.md) — astuces et raccourcis (pour *installer* Ubuntu, voir [`setup/`](./setup))
- [Nano](./docs/nano.md)
- [Markdown](./docs/markdown.md)
- [TCP / UDP](./docs/tcp-udp.md)

## links/

Voir [l'index des liens](./links). Depuis le terminal : `_l <mot-clé>`.

## setup/

Voir [le runbook d'installation](./setup/README.md). En résumé : `make install`, reboot, `make config`, puis
[les étapes manuelles](./setup/manual-steps.md) (extensions Gnome, gestes du trackpad, raccourcis).

## bin/

Ajouté au `PATH` par [`setup/config/zsh/aliases.zsh`](./setup/config/zsh/aliases.zsh).

| Outil | Ce qu'il fait | Alias |
|---|---|---|
| [`git-checker`](./bin/git-checker) | Liste les repos locaux sales ou pas sur main/master | `_gitchecker` |
| [`git-clean`](./bin/git-clean) | Nettoie untracked / ignored / branches mergées | `_gitcleaner` |
| [`lsr-link`](./bin/lsr-link) | Cherche un mot-clé dans `links/` | `_l` |

Chaque outil répond à `--help`.
