#!/bin/bash

# Location to save the .env file
ENV_FILE="compose/arr-stack-vpn/.env"

echo "🔧 Setting up .env for ARR-STACK-VPN..."

# Prompt for config root
read -p "Enter the root path for config volume (e.g., /mnt/media-server/configs): " CONFIG_ROOT

# VPN Configuration
read -p "VPN Service Provider (e.g., nordvpn): " VPN_SERVICE_PROVIDER
read -p "WireGuard Private Key: " WIREGUARD_PRIVATE_KEY
read -p "WireGuard Address (e.g., 10.0.0.2/32): " WIREGUARD_ADDRESSES
read -p "Server Region (e.g., India): " SERVER_REGIONS

# Port Configuration
read -p "QBitTorrent TCP/UDP Port (e.g., 6881): " QBIT_TCPUDP
read -p "QBitTorrent Web UI Port (e.g., 8080): " QBIT_WEBUI
read -p "Sonarr Web UI Port (e.g., 8989): " SONARR_WEBUI
read -p "Radarr Web UI Port (e.g., 7878): " RADARR_WEBUI
read -p "Prowlarr Web UI Port (e.g., 9696): " PROWLARR_WEBUI
read -p "Bazarr Web UI Port (e.g., 6767): " BAZARR_WEBUI

# Media Paths
read -p "Path to Downloads Folder (e.g., /mnt/media-server/downloads): " DOWNLOAD_FOLDER
read -p "Path to Media Folder (e.g., /mnt/media-server/media): " MEDIA_FOLDER

# Write to .env file
cat <<EOF > "$ENV_FILE"
# VPN Configuration
VPN_SERVICE_PROVIDER=$VPN_SERVICE_PROVIDER
WIREGUARD_PRIVATE_KEY=$WIREGUARD_PRIVATE_KEY
WIREGUARD_ADDRESSES=$WIREGUARD_ADDRESSES
SERVER_REGIONS=$SERVER_REGIONS

# Port Configuration
QBIT_TCPUDP=$QBIT_TCPUDP
QBIT_WEBUI=$QBIT_WEBUI
SONARR_WEBUI=$SONARR_WEBUI
RADARR_WEBUI=$RADARR_WEBUI
PROWLARR_WEBUI=$PROWLARR_WEBUI
BAZARR_WEBUI=$BAZARR_WEBUI

# Config Volume Paths
GLUETON_CONFIG=${CONFIG_ROOT}/gluetun
QBIT_CONFIG=${CONFIG_ROOT}/qbittorrent
RADARR_CONFIG=${CONFIG_ROOT}/radarr
SONARR_CONFIG=${CONFIG_ROOT}/sonarr
PROWLARR_CONFIG=${CONFIG_ROOT}/prowlarr
BAZARR_CONFIG=${CONFIG_ROOT}/bazarr

# Shared Media Paths
DOWNLOAD_FOLDER=$DOWNLOAD_FOLDER
MEDIA_FOLDER=$MEDIA_FOLDER
EOF

echo "✅ .env file created at $ENV_FILE"
