# .dotfiles

This dotfiles is specific for Arch Linux

## Step to setup dotfiles

1. Clone the repo

```
git clone https://github.com/jerensl/.dotfiles.git
```

2. Symlink the configuration for example
```
ln -s $HOME/.dotfiles/.config/fish/ $HOME/.config
```

3. Install direnv for managing environment
```
sudo pacman -S direnv
```

4. Install asdf for managing multple version of golang
```
git clone https://aur.archlinux.org/asdf-vm.git && cd asdf-vm && makepkg -si
```

5. Install asdf plugin golang
```
asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
```

6. Install specific golang version
```
asdf install golang 1.24.0
```
