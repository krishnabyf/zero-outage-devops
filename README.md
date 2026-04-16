# Zero Outage DevOps System 🚀

This project demonstrates a production-style DevOps pipeline designed to prevent infrastructure-related outages.

## 🔧 Tech Stack
- AWS ECS Fargate
- Terraform (Infrastructure as Code)
- Docker
- GitHub Actions (CI/CD)
- AWS Secrets Manager

## ⚙️ Key Features

### ✅ Fail-Fast Secret Validation
- CI pipeline blocks deployment if required secrets are missing

### 🔐 Secure Secrets Management
- Secrets stored in AWS Secrets Manager
- Injected into ECS at runtime
- Eliminates runtime failures due to missing env variables

### 🚀 Automated Deployment
- Dockerized Node.js app
- Deployed to AWS ECS using Terraform

### ❤️ Health Checks
- `/health` endpoint for monitoring

### 🌐 Live Deployment
- Application running on AWS ECS with public access

---

## 🧠 Problem Solved

Prevents outages caused by:
- Missing AWS Secrets Manager values
- Broken CI/CD pipelines
- Misconfigured environments

---

## 📦 How It Works

GitHub → GitHub Actions → Terraform → AWS ECS  
↓  
Secrets Validation Gate  
↓  
Docker Build & Deploy  
↓  
Health Check  

---

## 📌 Outcome

- Zero downtime deployments
- Fail-fast configuration validation
- Production-ready infrastructure