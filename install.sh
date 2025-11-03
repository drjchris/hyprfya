#!/bin/bash

# Paths to the app list and configs directory
APP_LIST="apps_to_install.txt"
CONFIGS_DIR="configs"

# Check if the apps_to_install.txt file exists
if [[ ! -f "$APP_LIST" ]]; then
    echo "Error: $APP_LIST not found."
    exit 1
fi

# Function to install apps
install_apps() {
    while IFS= read -r app; do
        # Skip empty lines and comments
        [[ -z "$app" || "$app" =~ ^# ]] && continue

        # Check if the app is installed
        if pacman -Qs "$app" > /dev/null; then
            echo "$app is already installed."
        else
            echo "$app is not installed. Installing..."
            sudo pacman -S --noconfirm "$app"
        fi
    done < "$APP_LIST"
}

# Function to copy config directories
copy_configs() {
    # List of config directories. Modify this list to include your specific config directories.
    declare -a config_dirs=("ghostty" "nvim" "hypr" "waybar" "wofi")

    for config in "${config_dirs[@]}"; do
        if [[ -d "$CONFIGS_DIR/$config" ]]; then
            echo "Copying $CONFIGS_DIR/$config to the appropriate location..."
            # Adjust this path to the appropriate target location for each config directory
            cp -r "$CONFIGS_DIR/$config" ~/"$config" # Adjust destination path as needed
        else
            echo "Warning: $CONFIGS_DIR/$config directory not found."
        fi
    done
}



config_zshrc() {

    # install oh-my-zsh
    zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # install syntax highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

    ZSHRC_SOURCE="$CONFIGS_DIR/zshrc"
    ZSHRC_DEST="$HOME/.zshrc"

    # Copy the .zshrc file
    if [[ -f "$ZSHRC_SOURCE" ]]; then
        echo "Copying .zshrc to $ZSHRC_DEST..."
        cp "$ZSHRC_SOURCE" "$ZSHRC_DEST"
    else
        echo "Warning: $ZSHRC_SOURCE not found."
    fi

} 


make_home_directories()  {
	mkdir -p ~/Documents/Drafts
	mkdir -p ~/Documents/Notes
	mkdir -p ~/Development
} 

init_services() {
    systemctl enable ly.service
}


# Execute functions
install_apps
copy_configs
config_zshrc
make_home_directories
init_services
