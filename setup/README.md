# Setup Ubuntu

Amener une machine Ubuntu de zéro à opérationnelle.

Ce qui est **automatisé** est ici. Ce qui demande de cliquer dans une interface est dans
[`manual-steps.md`](./manual-steps.md).

## 1. Prérequis

1. Installer git & make :

```
sudo apt install git make
```

2. Créer les dossiers de travail :

```
mkdir -p ~/Workspace/perso
```

## 2. Cloner le repo

Le repo peut vivre où tu veux : les scripts et les alias se repèrent tout seuls.

```
cd ~/Workspace/perso
git clone git@github.com:f-dumas/life-saving-resources.git
cd life-saving-resources/setup
```

## 3. Installer

```
make install
```

Puis **redémarrer** (le changement de shell vers zsh a besoin d'une nouvelle session).

## 4. Configurer

```
make config
```

Ça installe starship, source [`config/zsh/aliases.zsh`](./config/zsh/aliases.zsh) depuis ton `.zshrc`
(ce qui ajoute aussi [`bin/`](../bin) au `PATH`), clone les projets perso et installe Emote.

Ensuite : `source ~/.zshrc`.

## 5. Le reste à la main

Voir [`manual-steps.md`](./manual-steps.md).

## Ce qu'il y a dans ce dossier

| Fichier | Rôle |
|---|---|
| `Makefile` | Les deux entrées : `make install`, `make config` |
| `install.sh` | Paquets apt, zsh par défaut, oh-my-zsh |
| `configure.sh` | Starship, alias, clone des projets perso, Emote |
| `config/zsh/aliases.zsh` | Les alias et le `PATH` (sourcé depuis `~/.zshrc`) |
