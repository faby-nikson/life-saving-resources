# Life-saving resources

De la doc et des liens. Tout ce dont je veux me souvenir sans le chercher deux fois.

| Dossier | C'est quoi | Quand j'y vais |
|---|---|---|
| [`docs/`](./docs) | Aide-mémoire par sujet (git, docker, php, shell...) | « c'était quoi la commande pour... ? » |
| [`links/`](./links) | La collection de liens (écologie, bouffe, musique, memes) | « j'avais un lien pour ça » |
| [`bin/`](./bin) | De quoi fouiller les liens depuis le terminal | tous les jours |

## docs/

Aide-mémoire. Un fichier par sujet, ou un dossier quand le sujet a plusieurs pages.

- [Git](./docs/git.md)
- [Docker](./docs/docker.md)
- [PHP](./docs/php) — [Symfony](./docs/php/symfony.md), [outillage](./docs/php/tooling.md)
- [Unix shell / bash](./docs/unix-shell.md)
- [Ubuntu](./docs/ubuntu.md) — astuces et raccourcis
- [Nano](./docs/nano.md)
- [Markdown](./docs/markdown.md)
- [TCP / UDP](./docs/tcp-udp.md)

## links/

Voir [l'index des liens](./links). Depuis le terminal : `_l <mot-clé>`.

## bin/

| Outil | Ce qu'il fait | Alias |
|---|---|---|
| [`lsr-link`](./bin/lsr-link) | Cherche un mot-clé dans `links/` | `_l` |

Répond à `--help`. L'alias et le `PATH` viennent de
[`ubuntu-setup`](https://github.com/faby-nikson/ubuntu-setup) : il repère ce repo s'il est cloné dans
`~/Workspace/perso`, sinon exporte `LSR_ROOT`. Sans lui, `./bin/lsr-link <mot-clé>` marche aussi
bien.

## Les repos voisins

Ce repo ne contient que de la doc et des liens. Le reste a été sorti, parce que ça ne vit pas au même
rythme :

| Repo | C'est quoi |
|---|---|
| [`ubuntu-setup`](https://github.com/faby-nikson/ubuntu-setup) | Monter une machine Ubuntu de zéro : paquets, zsh, alias, extensions Gnome, outils git (privé) |
| [`gnome-shell-extension-swap-monitor-windows`](https://github.com/faby-nikson/gnome-shell-extension-swap-monitor-windows) | `Super + X` échange le contenu des deux écrans |
