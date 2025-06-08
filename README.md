# Dotfiles

Here you will find my personal configuration files created solely to optimize my work as a system and network administrator. No fancy transitions or ergonomic interface, just tools to improve productivity.

## Prerequisites

Before starting, make sure you have installed the following tool:

```bash
sudo pacman -Sy git stow zsh
```

## Clone the Project

To clone this repository, run the following commands in your terminal:

```bash
cd ~
git clone https://github.com/TheHackdes/dotfiles
cd dotfiles
```

## Apply a Configuration

To apply a specific configuration, use the following command. For example, to configure `kitty`, run the following command in the cloned directory:

```bash
pacman -Syu
stow kitty nvim fastfetch i3 zsh
zsh
```

## Contribute

1. Fork
2. Create your branch: `git checkout -b feature/my-feature`
3. Commit: `git commit -m "feat: add a feature"`
4. Push: `git push origin feature/my-feature`
5. Open a Pull Request

## Author

- @TheHackdes
