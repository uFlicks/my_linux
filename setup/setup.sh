#!/bin/bash

# Install required packages
echo "Installing packages..."
apt install wget curl unzip nodejs npm -y
echo "Packages installed."

# File path for aliases
ALIASES_FILE="$HOME/.bash_aliases"
BASHRC_FILE="$HOME/.bashrc"

# Remove ~/.bash_aliases file
rm "$ALIASES_FILE"
echo "Removed $ALIASES_FILE"

# Check if ~/.bash_aliases exists, if not, create it
if [ ! -f "$ALIASES_FILE" ]; then
    touch "$ALIASES_FILE"
    echo "Created $ALIASES_FILE"
fi

# Add aliases (ensure no duplicate entries)
add_alias() {
    local alias_cmd="$1"
    if ! grep -qF "$alias_cmd" "$ALIASES_FILE"; then
        echo "$alias_cmd" >> "$ALIASES_FILE"
        echo "Added: $alias_cmd"
    else
        echo "Alias already exists: $alias_cmd"
    fi
}

# Define your aliases here
add_alias "alias ll='ls -la'"
add_alias "alias venv='source /venv/bin/activate'"

# Reload aliases
if [ -n "$BASH_VERSION" ]; then
    source "$ALIASES_FILE"
    echo "Aliases loaded."
else
    echo "Non-Bash shell detected. Load aliases manually if needed."
fi

# Check if the file exists
if [ -f "$BASHRC_FILE" ]; then
    # Source the file
    source "$BASHRC_FILE"
    echo "Bashrc loaded."
else
    echo "$BASHRC_FILE does not exist."
fi

echo "Script execution complete."