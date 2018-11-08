<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
**Table of Contents**  *generated with [DocToc](https://github.com/thlorenz/doctoc)*

- [Git](#git)
  - [Configuration](#configuration)
  - [Useful commands](#useful-commands)
  - [To check (turning obsolete)](#to-check-turning-obsolete)
    - [Repository](#repository)
    - [Files state](#files-state)
    - [Stage files](#stage-files)
    - [Commit](#commit)
    - [Share your commits](#share-your-commits)
    - [Crud des remotes](#crud-des-remotes)
    - [Update your local repositotry](#update-your-local-repositotry)
    - [Branching](#branching)
    - [Stash](#stash)
  - [Rewrite history](#rewrite-history)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

Git
======

Configuration
------

See [Configuration](configuration.md)

Useful commands
------

[Git flight rules](https://github.com/k88hudson/git-flight-rules)


To check (turning obsolete)
------

### Repository

Link a folder to an existing repo
```
cd existing_git_repo
git remote add origin git@github.fr:my_project.git
git push -u origin master
```

### Files state

List modifications
```
git status
```

Check modifications on a file
```
git diff
git diff dossier/mon-fichier-modifie.php
```

List modifications by author
```
git blame {ficher}
```

Cancel modifications on a file
```
git checkout -- {nom-du-fichier}
```

Cancel all modifications
```
git fetch {nom-de-la-remote}
git reset --hard {nom-de-la-remote}/{nom-de-la-branch}
# exemple par defaut:
git fetch origin
git reset --hard origin/master
```

### Stage files

Add one file to staging
```
git add nomFichier
```

Add all the files (recursively)
```
git add .
```

Unstage a staged file
```
git reset HEAD {file-name}
```

### Commit

Commit add files
```
git commit 
​git commit -m"My message"
# Commit and add modified files
git commit -am"My commit message"
```

Alter the last commit message
```
git commit --amend
```

To see the repository history:
```
git log
#With details
git log --oneline --decorate --graph --all
```

@TODO

Pour voir où en était votre projet à un commit particulier 
```
git checkout {id-du-commit}
```

L'id-du-commit  est une suite de chiffre qui sert d'identifiant au commit qui est retrouvable avec git log. Vous pouvez aussi utiliser les noms des différents pointeurs (nom des branches et des tags) qui existent pour vous déplacer.

Annuler le dernier commit
```
git reset HEAD~1
```

Squashing
```
git rebase -i {sha1}
# List the 2 last commits
git rebase -i HEAD~2 
```

### Share your commits

Send to the repository:
```
git push
git push {remote} {branch}
```
Si la branch sur laquelle vous êtes est déjà suivie (c'est le cas de la branch master, initialiser par défaut) vous pouvez utiliser la version courte. Sinon il vous faudra la premiere fois preciser sur quelle remote et sur quelle branche distante vous voulez partager votre travail. 
Vous pouvez ne pas pousser tout de suite un commit pour vous donner le temps de vérifier votre travail, avant de la partager avec les autres.

Récupérer les commits sur le dépôt de la branche courante seulement (et positionnement sur le dernier commit) :
```
git pull
```

Récupérer tous les commits sur le dépôt (ne change pas le pointeur de votre commit actuel) :
```
git fetch
```
Il faut alors lancer git pull ou utiliser git checkout pour rejoindre le commit le plus récent.


### Crud des remotes

Add a remote
```
git remote add {nom-de-la-remote} {url-de-la-remote}
```

List every remotes
```
git remote
```


Afficher les détails d'une remote
```
git remote show {nom-de-la-remote}
```
Supprimer un remote
```
git remote remove {nom-de-la-remote}
```
Modifier son origine
```
git remote set-url origin <newurl>
```

### Update your local repositotry

Récupère juste les infos : branches etc.
```
git remote update
```

### Branching

Create a branch
```
git branch {nom-de-la-branch}
git checkout -b {new-branch}
```

Si elle existe déja sur un repo distant 
```
git branch {nom-de-la-remote}/{nom-de-la-branch}
```

Lister toutes les branches
```
git branch
```

Changer de branche
```
git checkout {nom-de-la-branch}
```


Merger deux branches
Il faut se placer dans la branche sur laquelle on veut en merger une autre
```
git merge {nom-de-la-branch-que-lon-veut-recuperer}
```
Un git merge est la récupération fonctionnelle, intégrale et finale d’une branche dans une autre.
Le commit de merge est un commit qui a deux commits parent. Mis à part ça, c'est un commit classique. Il est local, il faut donc le pusher sur le repo distant pour qu'il soit disponible pour tout le monde.

Effacer un branche locale
```
git branch -d {nom-de-la-branch}
```

Effacer une branche distante
```
git branch -dr <remote/branch>
git push <remote_name> --delete <branch_name>
```


### Stash

Record your project state
```
git stash
```

List stashes work
```
git stash list
```

Inspect
```
git stash show {stash}
```

Restore last stash
```
git stash pop
# git stash apply ?? what the difference?
```


## Rewrite history

```bash
git branch save
git reset HEAD~

```

:house: [Back to home](../../)