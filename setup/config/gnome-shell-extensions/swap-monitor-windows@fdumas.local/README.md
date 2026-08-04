# Swap Monitor Windows

Extension GNOME Shell : **`Super + X`** échange le contenu de deux écrans. Toutes les fenêtres de
l'écran 1 partent sur l'écran 2, et inversement.

Le cas d'usage : tu partages un écran en visio et tu veux basculer ce que tu montres sans traîner
chaque fenêtre à la souris.

## Installation

Depuis [`setup/`](../../..) :

```
make gnome-extensions
```

Puis se déconnecter / reconnecter. Sur Wayland une extension nouvellement ajoutée n'est pas chargée
à chaud, et les deux portes de sortie D-Bus sont fermées (`ReloadExtension` répond « deprecated and
does not work », `EnableExtension` refuse un uuid que la shell ne connaît pas encore).

L'installation pose un lien symbolique vers ce dossier : un `git pull` suffit à mettre l'extension à
jour, il n'y a rien à recopier.

## Réglages

Le raccourci et la portée vivent dans le schéma GSettings, pas en dur dans le code. Comme le schéma
n'est pas dans le chemin système, il faut pointer `GSETTINGS_SCHEMA_DIR` dessus :

```bash
S=~/.local/share/gnome-shell/extensions/swap-monitor-windows@fdumas.local

# Changer le raccourci
GSETTINGS_SCHEMA_DIR="$S/schemas" gsettings set \
  org.gnome.shell.extensions.swap-monitor-windows swap-monitors "['<Super><Alt>x']"

# Permuter tous les workspaces d'un coup, au lieu du seul workspace actif
GSETTINGS_SCHEMA_DIR="$S/schemas" gsettings set \
  org.gnome.shell.extensions.swap-monitor-windows all-workspaces true
```

| Clé | Défaut | Rôle |
|---|---|---|
| `swap-monitors` | `['<Super>x']` | Le raccourci |
| `all-workspaces` | `false` | `false` = workspace actif seulement |

## Comment ça marche

Le déplacement passe par `Meta.Window.move_to_monitor()`, la même API que le « déplacer la fenêtre
vers l'écran de droite » de GNOME. Elle transporte l'état maximisé / tuilé / plein écran et
redimensionne quand les deux écrans diffèrent en taille — bien plus fiable que de recalculer les
rectangles à la main.

Trois pièges traités dans le code :

- **L'aller-retour.** Déplacer les fenêtres au fur et à mesure ferait réexaminer celles qui viennent
  de traverser, et les renverrait d'où elles viennent. Toutes les destinations sont donc résolues
  avant le premier déplacement.
- **Les doublons.** Avec `workspaces-only-on-primary` (le défaut GNOME), les fenêtres de l'écran
  secondaire sont sur *tous* les workspaces et apparaissent dans plusieurs listes. Un `Set` les
  dédoublonne.
- **Les fenêtres transitoires.** Les dialogues enfants suivent leur parent tout seuls ; les déplacer
  séparément entre en conflit avec le repositionnement de mutter. Filtrées via
  `get_transient_for() === null`.

Au-delà de deux écrans, l'extension apparie l'écran primaire avec celui où se trouve le focus.

## Diagnostic

```bash
gnome-extensions info swap-monitor-windows@fdumas.local        # doit dire ACTIVE
journalctl --user -b -o cat /usr/bin/gnome-shell | grep swap-monitor
```

Chaque déclenchement logue le nombre de fenêtres déplacées : ça dit tout de suite si le raccourci
est reçu mais ne trouve rien à bouger.

## À savoir

Quand une fenêtre passe de l'écran secondaire vers l'écran primaire, mutter la rattache au workspace
actif (conséquence de `workspaces-only-on-primary`) ; dans l'autre sens elle devient « sur tous les
workspaces ». C'est cohérent, mais si tu réappuies sur `Super + X` après avoir changé de workspace,
tu ne retrouveras pas exactement la répartition de départ.
