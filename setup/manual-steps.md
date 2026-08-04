# Étapes manuelles

Tout ce que `make install` / `make config` ne peuvent pas faire à ta place.

## Réglages système

- Régler [le focus à la souris](https://askubuntu.com/questions/978401/how-do-i-set-focus-follows-mouse-in-ubuntu-17-10)
- Ajouter [l'auto-suggest](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md) à ZSH

## Raccourcis clavier

| Action | Raccourci |
|---|---|
| Dossier personnel | `Super + e` |

## Extensions Gnome

Les extensions **maison** sont automatisées : elles vivent dans
[`config/gnome-shell-extensions/`](./config/gnome-shell-extensions) et `make gnome-extensions` les
pose. Il reste juste à se déconnecter / reconnecter. Rien à faire à la main pour celles-là.

- [Swap Monitor Windows](./config/gnome-shell-extensions/swap-monitor-windows@fdumas.local/README.md)
  — `Super + X` échange le contenu des deux écrans

Le reste vient du store, donc à la main. Installer le gestionnaire d'extensions (voir
[la doc](https://doc.ubuntu-fr.org/extensions-gnome)) :

```
sudo apt install gnome-shell-extensions
```

Puis ajouter :

- [Clipboard Indicator](https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator)
- [touchpad](https://doc.ubuntu-fr.org/touchpad#installer_fusuma) avec
  [Fusuma SendKey](https://github.com/iberianpig/fusuma-plugin-sendkey) (plutôt que xdotools)

Exemple de config Fusuma :

```yaml
swipe:
  4:
    left: 
      sendkey: 'LEFTMETA+LEFT'
    right: 
      sendkey: 'LEFTMETA+RIGHT'
    up: 
      sendkey: 'LEFTMETA+UP'
    down: 
      sendkey: 'LEFTMETA+DOWN'
pinch:
  in:
    sendkey: 'LEFTMETA+LEFTCTRL+KPPLUS'
  out:
    sendkey: 'LEFTMETA+LEFTCTRL+KPMINUS'

threshold:
  swipe: 0.4
  pinch: 0.4

interval:
  swipe: 0.8
  pinch: 0.1
```
