# Dotfiles

## Install packages

Install common package :

```bash
apt install -y \
curl figlet fonts-jetbrains-mono gcc git htop hyperfine i3-wm kitty ncdu neovim npm rofi stow wget zsh feh arandr bat cargo eza
```

Install JetBrains Nerd Font :

```bash
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip \
  && cd ~/.local/share/fonts \
  && unzip JetBrainsMono.zip \
  && rm JetBrainsMono.zip \
  && fc-cache -fv
```

Install fzf : 

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

Install Zoxide :

```bash
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
sudo mv /home/rick/.local/bin/zoxide /usr/bin/
```

Install LAzyVim :

```bash
git clone https://github.com/LazyVim/starter ~/.config/nvim
```

Install Gitmoji :

```bash
sudo npm i -g gitmoji-cli
```

## Configure ZSH

```bash
sudo chsh -s /bin/zsh
```

## Install Dotfile
