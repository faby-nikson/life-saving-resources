Configuration
======

### Add global params

```
git config --global user.name "Grace Hopper "
git config --global user.email "gho@acti.fr"
git config --list (pour lister tous les paramètres)
```

### Exclude file patterns

Create a file named for example: `.gitignore_global` and add the files you want to exclude from git:
```
.classpath
.project 
```

Then add a file in git config:
```
git config --global core.excludesfile ~/.gitignore_global
```

### Useful aliases

Edit your git config file:
```
[user]
  name = XX
  email = XX
  
[alias]
  a = add .
  br = branch -v
  bra = branch -v -a
  ca = "!f(){ git commit -am $1; }; f"
  co = checkout
  l = log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim w$
  rb = "!f() { git rebase -i HEAD~$1; }; f"
  st = status
  
# Other ideas
  nlog = log --name-status
  glog = log --graph --abbrev-commit
  sglog = log --graph --abbrev-commit --pretty=oneline
  relog = log --graph --abbrev-commit --pretty=oneline --no-merges
  slog = log --pretty=oneline --abbrev-commit
  dlog = log -p -v
  ru = remote update
  su = submodule update
  si = submodule init  
  pom = push origin master
  plom = pull origin master  
  wdiff = diff --word-diff=color --unified=1
```

### Helper functions

You can add this to your .bashrc / .zshrc file:

#### Clean merged branches

```bash
# Remove merged br
git-clean-br() {
  for br in $(git branch --merged | egrep -v '(^\*|master)'); do
    git branch -d ${br};
  done
  git fetch --prune
}
```