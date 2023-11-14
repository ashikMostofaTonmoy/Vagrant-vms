#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

# Function to detect the Linux distribution
detect_distribution() {
    if [ -f /etc/os-release ]; then
        # Source the os-release file to get the distribution ID
        . /etc/os-release
        if [ "$ID" = "ubuntu" ] || [ "$ID" = "debian" ]; then
            echo "ubuntu"
        elif [ "$ID" = "centos" ] || [ "$ID" = "rhel" ] || [ "$ID" = "fedora" ]; then
            echo "centos"
        else
            echo "Unsupported distribution: $ID"
            exit 1
        fi
    else
        echo "Unsupported distribution"
        exit 1
    fi
}

# Install essential tools
install_essential_tools() {
    distribution=$(detect_distribution)
    case "$distribution" in
        ubuntu)
            sudo apt update
            sudo apt install -y curl git net-tools telnet
            ;;
        centos)
            sudo yum install -y curl git net-tools telnet
            ;;
        *)
            echo "Unsupported distribution: $distribution"
            exit 1
            ;;
    esac
}

# Install Zsh based on the detected distribution
install_zsh() {
    distribution=$(detect_distribution)
    case "$distribution" in
        ubuntu)
            sudo apt-get update
            sudo apt-get install -y zsh
            ;;
        centos)
            sudo yum install -y zsh
            ;;
        *)
            echo "Unsupported distribution: $distribution"
            exit 1
            ;;
    esac
}

# Change the default shell to Zsh
change_shell() {
    # sudo chsh -s "$(which zsh)" "$USER"
    sudo chsh -s "$(which zsh)"
}

# Install Oh-My-Zsh
install_oh_my_zsh() {
    sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" < /dev/null
}

# Install additional plugins
install_plugins() {
    mkdir -p $HOME/.oh-my-zsh/custom/plugins

    # Autosuggestions
    git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions

    # Syntax highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

    # Fast syntax highlighting
    git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/fast-syntax-highlighting

    # Autocomplete
    git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $HOME/.oh-my-zsh/custom/plugins/zsh-autocomplete
}

# Set Zsh theme
set_zsh_theme() {
    sed -i 's/ZSH_THEME=".*"/ZSH_THEME="jonathan"/' $HOME/.zshrc
}

# Enable plugins in .zshrc
enable_plugins() {
    sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)/' $HOME/.zshrc
}

# Main script
install_essential_tools

# install_zsh
# change_shell
# install_oh_my_zsh
# install_plugins
# set_zsh_theme
# enable_plugins