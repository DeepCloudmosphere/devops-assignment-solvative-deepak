# 🚀 Ansible Playbook — Server Setup with Apache, MySQL, Docker & Ephemeral Storage

## 📘 Overview
This project contains an **Ansible playbook** that automates the installation and configuration of core dependencies on an Ubuntu server.

### 🎯 **Scenario**
Task to install and configure:
- **Apache2** — Web server  
- **MySQL** — Database server  
- **Docker** — Container engine  

After installation, the playbook:
- Pulls an **Nginx Docker image**
- Runs an **Nginx container**
- Mounts an **ephemeral storage directory** (`/tmp/nginx_ephemeral`) to the container

This ensures all core services are installed, running, and verified automatically in a reproducible and idempotent way.

## 🗂️ Project Structure
ConfigurationFile-01/      
├── install_depedencies_playbook.yaml # Main Ansible playbook      
├── inventory.ini # Inventory file.     
└── README.md # Documentation


---

## ⚙️ Playbook Details

**File:** `install_depedencies_playbook.yaml`

### 🔧 What it does
1. Updates system packages  
2. Installs **Apache2** and starts the service  
3. Installs **MySQL Server** and ensures it’s enabled  
4. Installs **Docker** (using official Docker repository)  
5. Installs **Python3-pip** and the **Docker SDK** (required for Ansible’s Docker modules)  
6. Pulls the **Nginx Docker image**  
7. Creates a temporary directory `/tmp/nginx_ephemeral` to simulate ephemeral storage  
8. Runs an Nginx container:
   - Binds host port `8080` to container port `80`
   - Mounts `/tmp/nginx_ephemeral` to `/usr/share/nginx/html`
   - Uses restart policy `always`

---

## 🧩 Inventory Configuration

For local testing, use:

**`inventory.ini`**
```ini
[servers]
localhost ansible_connection=local

```

---

## How to Run the Playbook

**Install Ansible (if not already installed)**
```
sudo apt update && sudo apt install ansible -y
```
**Run the playbook on localhost**
```
ansible-playbook -i inventory.ini install_depedencies_playbook.yaml
```
##  Verification Steps


