# 🐳 Media Server Docker Compose Collection

Welcome to the **Media Server Compose Collection**—a curated set of Docker Compose files for self-hosting powerful open-source applications. This repository bundles multiple services into a single downloadable archive for easy setup and deployment.

---

## 📦 Included Projects

| Project | Description | 
| --- | --- | 
| **arr-stack-vpn** | Media automation stack (e.g., Sonarr, Radarr) with VPN integration | 
| **audiobookshelf** | Self-hosted audiobook server with streaming and metadata support | 
| **chromium** | Containerized Chromium browser for secure, isolated browsing | 
| **dashboard** | Personal homepage/dashboard with quick links and widgets | 
| **filebrowser** | Web-based file manager with user authentication and file sharing | 
| **immich** | High-performance photo and video backup solution for mobile devices | 
| **jellyfin** | Open-source media server for movies, shows, and music | 
| **navidrome** | Lightweight music streaming server compatible with Subsonic clients | 
| **newt-pangolin** | Custom utility container (details in its subfolder) | 
| **termix** | Terminal-based container for remote shell access and scripting | 
| **watchtower** | Automatic updates for running Docker containers | 

---

## 🚀 Getting Started

To access and deploy the Compose files:

### 1️⃣ Clone the Repository

```bash
git clone https://github.com/kmrs93/Media-Server-Compose.git
cd Media-Server-Compose
```

### 2️⃣ Download or Unzip the Compose Archive

If the ZIP file is already in the repo:

```bash
unzip Compose.zip
```

Or download it manually:

```bash
wget https://github.com/kmrs93/Media-Server-Compose/blob/main/Compose.zip
unzip Compose.zip
```

> 📁 This will extract all project folders into the current directory.

### 3️⃣ Navigate to a Project Folder

```bash
cd jellyfin
```

### 4️⃣ Launch the Container

```bash
docker-compose up -d
```

> 🛠️ Make sure Docker and Docker Compose are installed on your system.

---

## 📁 Folder Structure

After unzipping, you'll see:

```
Media-Server-Compose/
├── Compose.zip
├── arr-stack-vpn/
├── audiobookshelf/
├── chromium/
├── dashboard/
├── filebrowser/
├── immich/
├── jellyfin/
├── navidrome/
├── newt-pangolin/
├── termix/
├── watchtower/
```

Each folder contains:

- `docker-compose.yml`
- Optional `.env` file
- Usage notes or `README.md`

---

## 🧠 Tips & Recommendations

- Use `.env` files to customize ports, volumes, and credentials.
- Consider using [Watchtower](https://containrrr.dev/watchtower/) to keep containers up-to-date.
- Always review Compose files before deploying—especially for exposed ports and credentials.
- Use persistent volumes to avoid data loss during container updates.

---

## 🤝 Contributing

Feel free to submit pull requests for improvements, new Compose setups, or bug fixes. Open an issue if you encounter problems or have suggestions.

---

## 📜 License

This repository is licensed under the MIT License.

---

## 🌐 Credits

Thanks to the developers of each project for their incredible work. This repo simply brings their tools together for easier deployment.

---

Happy self-hosting! 🧃
