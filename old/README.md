# Arch linux installation

## User and permissions

Grant root permissions to users in the wheel group
```
$ EDITOR=nano visudo
```
and then uncomment '%wheel ALL=(ALL) ALL'

Add a user in the wheel group
```
$ useradd -m -G wheel -s /bin/bash username
```
Set user password
```
$ passwd username
```

## Auto-connect to internet
- wpa_actiond

Following arch-wiki instalation guide, iw, wpa_supplicant and dialog should be installed.
The command wifi-menu creates a netctl profile and then loads it.
To autoconnect, install wpa_actiond and then run:
```
$ sudo systemctl enable netctl-auto@interface.service
```
where the interface should be one of the listed with the command:
```
$ ip link
```
In my case:
```
$ sudo systemctl enable netctl-auto@wlp2s0.service
```

## Applications
- xfce4-terminal (terminal emulator)
- vim (cli text editor)
- git (version control manager)
- rofi (keystroke laucher)
- firefox (web-browser)
- ristretto (image viwer)
- mupdf (pdf viwer)
- curl (cli download)
- texlive-most (latex)
- tmux (terminal multiplexer)
- pandoc (multi-featured conversor)

----

- google-chrome-stable (https://aur.archlinux.org/packages/google-chrome/)
- sublime text 2 (https://aur.archlinux.org/packages/sublime-text/)

## X server
- xf86-video-intel (intel video driver)
- xorg-server
- xorg-xbacklight (brightness control)

## Window manager
- i3-wm
- i3status
- i3lock

## Display Manager
- lightdm
- lightdm-gtk-greeter

Edit ***/etc/lightdm/lightdm-gtk-greeter.conf*** to define theme, font, icon, background and user wallpaper. All parameters should be located above home directory.

Ex:
```
[greeter]
background=/usr/share/wallpapers/background.jpeg
user-background=/usr/share/wallpapers/wallpaper.jpeg
theme-name=Arc-Dark
icon-theme-name=elementary
font-name=DejaVuSansMono
```

## Touchpad
- xf86-input-synaptics (enables touchpad)

Copy the configuration file:
```
$ cp /usr/share/X11/xorg.conf.d/50-synaptics.conf /etc/X11/xorg.conf.d/
```
Enable vertical and horizontal two finger scroll. Add to identifier touchpad catchall:
```
        Option "VertTwoFingerScroll" "on"
        Option "HorizTwoFingerScroll" "on"
```

## Keyboard language inside X
**OBS**: Outside X, its up to /etc/vconsole.conf.

Copy the configuration file:
```
$ cp /usr/share/X11/xorg.conf.d/10-evdev.conf /etc/X11/xorg.conf.d/
```
Change Layout and Variant by adding to identifier evdev touchpad catchall:
```
        Option "XkbLayout" "br"
        Option "XkbVariant" "abnt2"
```

## File manager
- pcmanfm
- tumbler (enables thumbnails)
- ffmpegthumbnailer (video thumbnails)
- gvfs (automount media when plugged)
- gvfs-mtp (android cellphone module)
- ntfs-3g (enables write into ntfs partitions)

## Compress/extract
- xarchiver (compatible with thunar-archive-plugin)
- zip
- unzip
- p7zip
- unrar

## Audio
- alsa-utils (installs alsamixer)
- pulseaudio
- pulseaudio-alsa

## Eye-candy
- gtk-engine-murrine
- lxappearance (chose between themes)
- elementary-icon-theme

---

- compton (AUR) (https://aur.archlinux.org/packages/compton/)
- arc-darker theme (https://github.com/horst3180/Arc-theme)

## Fonts
- ttf-dejavu
- ttf-droid
- ttf-inconsolata
- ttf-ubuntu-font-family

---

- infinality-bundle (https://wiki.archlinux.org/index.php/Infinality)
- fontawesome-web.ttf (https://github.com/FortAwesome/Font-Awesome)

## Zsh
- zsh
- zsh-syntax-highlighting
- oh-my-zsh (https://github.com/robbyrussell/oh-my-zsh)

## GPG
- gpg (gnu privacy guard)
Import secret key and public key pair

## Base16 Shell
Fix terminal + vim colors:
```
$ git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
```

## Vim Vundle
Installs vim plugins present in .vimrc with *:PluginInstall*
```
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

# Linux config file
All of them can be found at <http://github.com/ghmzanon/dotfiles.git>

- .aliases
- .bin/
- terminalrc
- .gitconfig
- .i3/
- .tmux.conf
- .vimrc
- .Xresources
- .zshrc
