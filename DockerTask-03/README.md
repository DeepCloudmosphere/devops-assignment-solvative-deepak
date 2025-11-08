# 🐳 Docker & Containerization: Sample Web Application

## 📘 Overview
This project demonstrates how to **containerize a simple web application** using Docker.  
The web app is hosted inside a Docker container running **NGINX** (or optionally Apache2) as the web server.  
It includes both a **Dockerfile** and a **docker-compose.yml** file for building and running the containerized application.

---

## 📂 Project Structure
DockerTask-03/.   
├── Dockerfile.   
├── docker-compose.yml.   
├── index.html.   
└── README.md.   


- `Dockerfile` — Defines how to build the Docker image with the web server and web application.  
- `docker-compose.yml` — Defines the service configuration and orchestrates container startup.  
- `index.html` — Sample web page served by the container.  

---

## 🧱 How to Build and Run

```
docker image build -t nginx_web_app .
docker run -d -p 8080:80 nginx_web_app
```
<img width="1331" height="600" alt="Screenshot 2025-11-08 at 3 18 21 PM" src="https://github.com/user-attachments/assets/74a82d46-895d-49c8-a836-76a19e83c01c" />

**Using docker compose**

```
docker compose up -d
```
<img width="1327" height="654" alt="Screenshot 2025-11-08 at 3 20 57 PM" src="https://github.com/user-attachments/assets/6bc70345-0389-4fbd-b85f-6b1630f702bf" />

---
<img width="1331" height="175" alt="Screenshot 2025-11-08 at 3 21 28 PM" src="https://github.com/user-attachments/assets/f1f33feb-386f-4f86-ab49-03c494f617ad" />





