# Ubuntu

Setup your Ubuntu computer

## 1. Requirements 

1. Install git & make

```
sudo apt install git make
```

2. Create Workspace and perso folders

```
mkdir ~/Workspace
mkdir ~/Workspace/perso
```

## 2. Execute install scripts

1. Clone this repository and move to this place

```
cd ~/Workspace/perso
git clone git@github.com:f-dumas/life-saving-resources.git
cd ~/Workspace/perso/life-saving-resources/scripts/setup-ubuntu
```

2. Run:

```
make install
```

3. Reboot your computer.

## 3. Configure

1. Run:
```
make config
```

2. Add custom configs:
    - Set [the mouse focus](https://askubuntu.com/questions/978401/how-do-i-set-focus-follows-mouse-in-ubuntu-17-10)
    - Add [auto-suggest](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md) to ZSH
3. Add shortcuts:
    - Dossier personnel | `Super + e`

4. Install Gnome extensions handler (See [doc](https://doc.ubuntu-fr.org/extensions-gnome) online):
```
sudo apt install gnome-shell-extensions
```
5. Add extensions:
    - [Clipboard Indicator](https://github.com/Tudmotu/gnome-shell-extension-clipboard-indicator)
    - [touchpad](https://doc.ubuntu-fr.org/touchpad#installer_fusuma) with [Fusuma SendKey](https://github.com/iberianpig/fusuma-plugin-sendkey) (instead of xdotools)
```yaml
# Fusuma sendkey config example
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
