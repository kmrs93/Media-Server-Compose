#!/bin/bash

echo "🔧 Setting up .env files for your media stack..."

########################################
# Shared Paths for All Services       #
########################################

read -p "Enter the root path for config volume (e.g., /mnt/media-server/configs): " CONFIG_ROOT
read -p "Path to Downloads Folder (e.g., /mnt/media-server/downloads): " DOWNLOAD_FOLDER
read -p "Path to Media Folder (e.g., /mnt/media-server/media): " MEDIA_FOLDER

##############################
# ARR-STACK-VPN Environment #
##############################

ARR_ENV_FILE="compose/arr-stack-vpn/.env"
echo -e "\n📦 ARR-STACK-VPN Configuration"

read -p "VPN Service Provider (e.g., nordvpn): " VPN_SERVICE_PROVIDER
read -p "WireGuard Private Key: " WIREGUARD_PRIVATE_KEY
read -p "WireGuard Address (e.g., 10.0.0.2/32): " WIREGUARD_ADDRESSES
read -p "Server Region (e.g., India): " SERVER_REGIONS

mkdir -p compose/arr-stack-vpn
cat <<EOF > "$ARR_ENV_FILE"
# VPN Configuration
VPN_SERVICE_PROVIDER=$VPN_SERVICE_PROVIDER
WIREGUARD_PRIVATE_KEY=$WIREGUARD_PRIVATE_KEY
WIREGUARD_ADDRESSES=$WIREGUARD_ADDRESSES
SERVER_REGIONS=$SERVER_REGIONS

# Shared Config Root
CONFIG_ROOT=$CONFIG_ROOT

# Shared Media Paths
DOWNLOAD_FOLDER=$DOWNLOAD_FOLDER
MEDIA_FOLDER=$MEDIA_FOLDER
EOF

echo "✅ .env file created at $ARR_ENV_FILE"

##############################
# Audiobookshelf Environment #
##############################

AUDIO_ENV_FILE="compose/audiobookshelf/.env"
echo -e "\n🔊 Audiobookshelf Configuration"

read -p "Path to Audiobooks media folder (e.g., /mnt/media/audiobooks): " AUDIOBOOKS_MEDIA

mkdir -p compose/audiobookshelf
cat <<EOF > "$AUDIO_ENV_FILE"
MEDIA1=$AUDIOBOOKS_MEDIA
AUDIOBOOKS_DATA=${CONFIG_ROOT}/audiobookshelf
EOF

echo "✅ .env file created at $AUDIO_ENV_FILE"

##############################
# Dashboard Environment      #
##############################

DASHBOARD_ENV_FILE="compose/dashboard/.env"
echo -e "\n🧩 Dashboard Stack Configuration (Homarr, Dashdot, Organizr)"

mkdir -p compose/dashboard
cat <<EOF > "$DASHBOARD_ENV_FILE"
CONFIG_ROOT=$CONFIG_ROOT
DOWNLOAD_FOLDER=$DOWNLOAD_FOLDER
MEDIA_FOLDER=$MEDIA_FOLDER
EOF

echo "✅ .env file created at $DASHBOARD_ENV_FILE"

##############################
# Filebrowser Environment    #
##############################

FILEBROWSER_ENV_FILE="compose/filebrowser/.env"
echo -e "\n📁 Filebrowser Configuration"

sudo mkdir -p "${CONFIG_ROOT}/filebrowser"
sudo touch "${CONFIG_ROOT}/filebrowser/filebrowser.db"

mkdir -p compose/filebrowser
cat <<EOF > "$FILEBROWSER_ENV_FILE"
CONFIG_ROOT=$CONFIG_ROOT
EOF

echo "✅ .env file created at $FILEBROWSER_ENV_FILE"

##############################
# Jellyfin Environment       #
##############################

JELLYFIN_ENV_FILE="compose/jellyfin/.env"
echo -e "\n🎬 Jellyfin Configuration"

mkdir -p compose/jellyfin
cat <<EOF > "$JELLYFIN_ENV_FILE"
CONFIG_ROOT=$CONFIG_ROOT
MEDIA1=$MEDIA_FOLDER
EOF

echo "✅ .env file created at $JELLYFIN_ENV_FILE"

##############################
# Navidrome Environment      #
##############################

NAVIDROME_ENV_FILE="compose/navidrome/.env"
echo -e "\n🎵 Navidrome Configuration"

mkdir -p compose/navidrome
cat <<EOF > "$NAVIDROME_ENV_FILE"
CONFIG_ROOT=$CONFIG_ROOT
MEDIA_FOLDER=$MEDIA_FOLDER
EOF

echo "✅ .env file created at $NAVIDROME_ENV_FILE"

echo -e "\n🎉 All environment files are ready to go!"
