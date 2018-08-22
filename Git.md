Git
======

Todo
------


### Configuration

Add global params
```
git config --global user.name "Grace Hopper "
git config --global user.email "gho@acti.fr"
git config --list (pour lister tous les paramètres)
```
@TODO 

Fichier de config global pour des exclusions systématiques (.idea, etc.)
http://patatos.over-blog.com/article-comment-configurer-un-fichier-gitignore-global-119567055.html
Commands aliases
Editez votre fichier de config et ajoutez les alias suivants :
[user]
# Please adapt and uncomment the following lines:
name = André Cianfarani
email = a.cianfarani@c2is.fr
[color]
diff = auto
status = auto
branch = auto

[alias]
st = status
co = checkout
ba = branch -v -a
nlog = log --name-status
glog = log --graph --abbrev-commit
sglog = log --graph --abbrev-commit --pretty=oneline
relog = log --graph --abbrev-commit --pretty=oneline --no-merges
slog = log --pretty=oneline --abbrev-commit
dlog = log -p
ci = commit -v
br = branch -v
ru = remote update
su = submodule update
si = submodule init
addm = !git-ls-files -m -z | xargs -0 git-add && git status # ajouter les fichiers modifiés.
addu = !git-ls-files -o --exclude-standard -z | xargs -0 git-add && git status # ajouter les fichiers inconnus.
rmm = !git ls-files -d -z | xargs -0 git-rm && git status # supprimer les fichiers marqués
pom = push origin master
plom = pull origin master
board = "!f() { php54 /Users/andre/Documents/Work/gitboard/gitboard.php $@; }; f"
wdiff = diff --word-diff=color --unified=1

[core]
​ excludesfile = /Users/andre/.gitignore

Init a repository
Start fresh
git init

Clone a repository
git clone git@gitlab.c2is.fr:nomprojet.git
Link a folder to an existing repo
cd existing_git_repo
git remote add origin git@gitlab.c2is.fr:icam_annuaire_2017.git
git push -u origin master
Files state
List modifications
git status

Check modifications on a file
git diff
git diff dossier/mon-fichier-modifie.php

List modifications by author
git blame {ficher}

Cancel modifications on a file
git checkout -- {nom-du-fichier}

Cancel all modifications
git fetch {nom-de-la-remote}
git reset --hard {nom-de-la-remote}/{nom-de-la-branch}
# exemple par defaut:
git fetch origin
git reset --hard origin/master

Stage files
Add one file to staging
git add nomFichier
Add all the files (recursively)
git add .
Désindexer un fichier déjà indexé
git reset HEAD {nom-du-fichier}

Commit
Commit add files
git commit 
​git commit -m"Refactoriser l'envoi des mails"

Alter the last commit message
git commit --amend
Pour voir l'historique du repo (Version simple)
git log
Pour voir l'historique du repo (Version détaillée)
git log --oneline --decorate --graph --all
Pour voir où en était votre projet à un commit particulier 
git checkout {id-du-commit}
L'id-du-commit  est une suite de chiffre qui sert d'identifiant au commit qui est retrouvable avec git log. Vous pouvez aussi utiliser les noms des différents pointeurs (nom des branches et des tags) qui existent pour vous déplacer.
Annuler le dernier commit
git reset HEAD~1
Squashing
git rebase -i [sha1}
Pour partager vos commits
Envoyer vos commits sur le dépôt
git push
git push {remote} {branch}
Si la branch sur laquelle vous êtes est déjà suivie (c'est le cas de la branch master, initialiser par défaut) vous pouvez utiliser la version courte. Sinon il vous faudra la premiere fois preciser sur quelle remote et sur quelle branche distante vous voulez partager votre travail. 
Vous pouvez ne pas pousser tout de suite un commit pour vous donner le temps de vérifier votre travail, avant de la partager avec les autres.
Récupérer les commits sur le dépôt de la branche courante seulement (et positionnement sur le dernier commit) :
git pull
Récupérer tous les commits sur le dépôt (ne change pas le pointeur de votre commit actuel) :
git fetch
Il faut alors lancer git pull ou utiliser git checkout pour rejoindre le commit le plus récent.
Crud des remotes
Ajouter un remote
git remote add {nom-de-la-remote} {url-de-la-remote}
Lister toutes les remotes de notre repo
git remote
Afficher les détails d'une remote
git remote show {nom-de-la-remote}
Supprimer un remote
git remote remove {nom-de-la-remote}
Modifier son origine
git remote set-url origin <newurl>
Mettre à jour son repository local
Récupère juste les infos : branches etc.
git remote update
Branching
Create a branch
git branch {nom-de-la-branch}
git checkout -b {new-branch}
Si elle existe déja sur un repo distant 
git branch {nom-de-la-remote}/{nom-de-la-branch}
Lister toutes les branches
git branch
Changer de branche
git checkout {nom-de-la-branch}
Merger deux branches
Il faut se placer dans la branche sur laquelle on veut en merger une autre
git merge {nom-de-la-branch-que-lon-veut-recuperer}
Un git merge est la récupération fonctionnelle, intégrale et finale d’une branche dans une autre.
Le commit de merge est un commit qui a deux commits parent. Mis à part ça, c'est un commit classique. Il est local, il faut donc le pusher sur le repo distant pour qu'il soit disponible pour tout le monde.
Effacer un branche locale
git branch -d {nom-de-la-branch}
Effacer une branche distante
git branch -dr <remote/branch>
git push <remote_name> --delete <branch_name>
Rebase

Stash
Record your project state
git stash

List stashes work
git stash list

Inspect
git stash show {stash}
Restore last stash
git stash pop

git stash apply ?? what the difference?



:house: [Back to home](README.md)