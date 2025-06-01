# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="af-magic" # set by `omz`

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# printf "\e]66;s=3;MARS\a\n\n\n\n"

eval "$(zoxide init zsh)"

alias cd='z'

alias ls='lsd -lag -h --header'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias rm='trash-put'
alias ssh='mosh'

alias tmp='pushd $(mktemp -d)'

alias lz='lazygit'
alias lzd='lazydocker'
alias pdf='firefox http://127.0.0.1:8080 && docker run --rm -p 8080:8080 -ti stirlingtools/stirling-pdf'


alias sz='source ~/.zshrc'

fastfetch --logo-width 25 --logo ~/.config/fastfetch/endeavouros.png

### FONCTIONS ###
arch() {
  VERSION="${1:-latest}"
  IMAGE_NAME="arch-perso:$VERSION"

  tmp_dir=$(mktemp -d)
  chmod -R 777 ${tmp_dir}

  echo "----------------------------------------"
  printf "| %-14s | %-19s |\n" "TMP_DIR" "${tmp_dir}"
  printf "| %-14s | %-19s |\n" "VERSION" "${1:-latest}"
  echo "----------------------------------------"

  docker buildx build \
    --build-arg VERSION="$VERSION" \
    --tag "$IMAGE_NAME" \
    --load \
    ~/.local/scripts/docker/arch/ > /dev/null

  docker run -it --rm --name arch --hostname arch -v ${tmp_dir}:/tmp "$IMAGE_NAME"
}

debian() {
  VERSION="${1:-latest}"
  IMAGE_NAME="debian-perso:$VERSION"

  tmp_dir=$(mktemp -d)
  chmod -R 777 ${tmp_dir}

  echo "----------------------------------------"
  printf "| %-14s | %-19s |\n" "TMP_DIR" "${tmp_dir}"
  printf "| %-14s | %-19s |\n" "VERSION" "${1:-latest}"
  echo "----------------------------------------"

  docker buildx build \
    --build-arg VERSION="$VERSION" \
    --tag "$IMAGE_NAME" \
    --load \
    ~/.local/scripts/docker/debian/ > /dev/null

  docker run -it --rm --name debian --hostname debian -v ${tmp_dir}:/tmp "$IMAGE_NAME"
}


eval "$(${HOME}/.local/bin/mise activate zsh)"

check_and_install_packages() {
    local packages=(
      # lazydocker (yay)
      curl
      docker
      docker-buildx
      docker-compose
      fastfetch
      fd
      gimp
      git
      htop
      ipcalc
      lazygit
      lsd
      mosh
      mtr
      ncdu
      neovim
      nextcloud-client
      npm
      obsidian
      ollama
      picom
      progress
      python-pipx
      qbittorrent
      qutebrowser
      thefuck
      timeshift
      trash-cli
      uv
      wget
      zoxide
      zsh
      )  # ✏️ Liste des paquets à vérifier/installer
    local missing=()

    for pkg in "${packages[@]}"; do
        pacman -Q "$pkg" &>/dev/null || missing+=("$pkg")
    done

    # Install missing packages
    if [[ ${#missing[@]} -gt 0 ]]; then
      echo "📦 Installation des paquets manquants: ${missing[*]}"
      
      if command -v sudo &>/dev/null; then
          sudo pacman -Sy --noconfirm "${missing[@]}"
      else
          echo "⚠️ sudo n'est pas installé, tentative d'installation sans sudo..."
          pacman -Sy --noconfirm "${missing[@]}"
      fi
   fi

   # Check if mise is installed
   if ! command -v mise &> /dev/null
   then
       echo "📦 Installation de mise..."
       curl https://mise.run | sh
   fi

   # Check if Oh My Zsh is installed
   if [ ! -d "$HOME/.oh-my-zsh" ]; then
       echo "Oh My Zsh is not installed. Installing now..."
       sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
       echo "Oh My Zsh installation complete."
   fi
}

check_and_install_packages

fuck () {
    TF_PYTHONIOENCODING=$PYTHONIOENCODING;
    export TF_SHELL=zsh;
    export TF_ALIAS=fuck;
    TF_SHELL_ALIASES=$(alias);
    export TF_SHELL_ALIASES;
    TF_HISTORY="$(fc -ln -10)";
    export TF_HISTORY;
    export PYTHONIOENCODING=utf-8;
    TF_CMD=$(
        thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@
    ) && eval $TF_CMD;
    unset TF_HISTORY;
    export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
    test -n "$TF_CMD" && print -s $TF_CMD
}


stream_on() {
  alias kitty='kitty --config ~/.config/kitty/kitty_stream.conf'
}

stream_off() {
  unalias kitty
}


