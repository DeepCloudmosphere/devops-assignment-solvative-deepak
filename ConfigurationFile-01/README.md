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
<img width="1330" height="640" alt="Screenshot 2025-11-08 at 1 58 48 PM" src="https://github.com/user-attachments/assets/afe52598-5a21-4baa-8418-2cff5631fed4" />

##  Verification Steps

**Check all depedencies on system **
<img width="1297" height="569" alt="Screenshot 2025-11-08 at 2 37 40 PM" src="https://github.com/user-attachments/assets/779ad720-f752-4b4b-9492-6753c5a27483" />

---
<img width="1068" height="438" alt="Screenshot 2025-11-08 at 2 38 08 PM" src="https://github.com/user-attachments/assets/b5501670-a120-4db4-9f7d-e5f5f3abf419" />

---
<img width="1233" height="546" alt="Screenshot 2025-11-08 at 2 38 46 PM" src="https://github.com/user-attachments/assets/f1bd9a8d-e730-49a1-a18e-d3883a225e7b" />

---
<img width="1329" height="251" alt="Screenshot 2025-11-08 at 2 39 13 PM" src="https://github.com/user-attachments/assets/3c8dcbb1-9436-42c6-9899-866a38b5f6a5" />

---
## Test Nginx Container

**Open your browser and go to:**
```
http://<ip>:8080
```
<img width="1891" height="535" alt="Screenshot 2025-11-08 at 2 40 25 PM" src="https://github.com/user-attachments/assets/1cd6184e-fa1e-417f-890f-4636b47733ab" />








