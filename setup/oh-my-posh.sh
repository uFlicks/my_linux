#!/bin/bash



# Update the package list
echo "Updating package list..."
apt update -y

# Install required dependencies
echo "Installing dependencies..."
apt install -y curl wget unzip

# Install Oh My Posh
curl -s https://ohmyposh.dev/install.sh | bash -s -- -d /bin

# Install a Nerd Font
echo "Installing a Nerd Font..."
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip"
wget $FONT_URL -O Hack.zip
unzip Hack.zip -d ~/.local/share/fonts
fc-cache -fv
rm Hack.zip

# Download theme
mkdir /setup/theme
wget https://raw.githubusercontent.com/uFlicks/my_linux/refs/heads/main/setup/oh-my-posh-custom/utkal.omp.json


# Update shell configuration
SHELL_CONFIG="~/.bashrc"

if ! grep -q "oh-my-posh" $SHELL_CONFIG; then
    echo "Configuring $SHELL_CONFIG to use Oh My Posh..."
    echo -e '\neval "$(oh-my-posh init $(basename $SHELL))"' >> $SHELL_CONFIG
    echo "export POSH_THEME=~/.poshthemes/atomic.omp.json" >> $SHELL_CONFIG
fi

# Completion message
echo "Oh My Posh installation is complete! Restart your terminal or run 'source $SHELL_CONFIG' to apply changes."
