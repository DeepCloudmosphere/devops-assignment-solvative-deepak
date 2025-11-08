# 🧩 System Monitoring and MySQL Backup Automation

This project includes two **Bash automation scripts** for Linux servers:
1. `monitor_cpu_mem.sh` — Monitors system performance (CPU, memory, top processes)
2. `mysql_db_backup.sh` — Automates MySQL database backups with rotation

---

## 🧠 Overview

These scripts are designed to help automate common server maintenance tasks:
- Monitor resource usage and log it for review
- Create and manage daily MySQL backups

---

## ⚙️ Requirements

- Ubuntu or Debian-based Linux system  
- MySQL installed and running  
- `sudo` privileges  
- Basic command-line access  

---

## 📜 Script 1:  monitor_cpu_mem.sh

### Description
Monitors:
- CPU usage
- Memory usage
- Top 5 CPU-consuming processes
- Top 5 Memory-consuming processes  

Logs the report to:  
`/var/log/system_monitor.log`

### Usage
```bash
chmod +x monitor_cpu_mem.sh
sudo ./monitor_cpu_mem.sh
```
<img width="1302" height="245" alt="Screenshot 2025-11-08 at 2 58 08 PM" src="https://github.com/user-attachments/assets/a591d6b0-f57e-48dc-a609-cb33c95d777e" />


## 📜 Script 2:  mysql_db_backup.sh

## 📘 Overview
This script automates the process of backing up a MySQL database on a Linux system.  
It creates timestamped compressed backup files and automatically deletes old backups (older than 7 days).  
Ideal for system administrators and DevOps engineers managing MySQL databases.


### **Description**
The script performs the following tasks:
1. Creates a timestamped backup of a MySQL database.
2. Compresses the backup file (`.sql.gz` format).
3. Stores the backup in the specified directory.
4. Removes backups older than 7 days.

---

## 🧩 Configuration
Before running the script, open it in a text editor and update these variables:

```bash
MYSQL_USER="root"                 # MySQL username
MYSQL_PASSWORD="yourpassword"     # MySQL password
DATABASE_NAME="your_database"     # Database to back up
BACKUP_DIR="/var/backups/mysql"   # Backup directory
```

### Usage
```bash
chmod +x mysql_db_backup.sh
sudo ./mysql_db_backup.sh
```
<img width="1291" height="333" alt="Screenshot 2025-11-08 at 2 57 35 PM" src="https://github.com/user-attachments/assets/ea0fd8f0-a354-4d9f-97e4-51f6408f3a30" />
