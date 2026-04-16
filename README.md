# 🚀 Zero Outage DevOps System

A production-style DevOps project designed to eliminate infrastructure-related outages caused by missing configuration, broken deployments, and lack of validation.

---

# 📌 Overview

This project demonstrates a **zero-outage deployment pipeline** using:

* AWS ECS Fargate
* Terraform (Infrastructure as Code)
* GitHub Actions (CI/CD)
* Docker
* AWS Secrets Manager

It is built to solve real-world problems like:

* Missing environment variables
* Broken deployments reaching production
* Unstable staging environments

---

# 🧱 Architecture

```
GitHub → GitHub Actions → Terraform → AWS ECS
        ↓
   Secrets Validation Gate
        ↓
   Docker Build & Push (ECR)
        ↓
   Deploy to ECS Fargate
        ↓
   Health Check Endpoint
```

---

# 📁 Project Structure

```
zero-outage-devops/
├── app/                # Node.js application
├── terraform/          # Infrastructure as Code
├── .github/workflows/  # CI/CD pipelines
├── scripts/            # Validation scripts
├── Dockerfile          # Container definition
└── README.md
```

---

# ⚙️ Tech Stack

| Component        | Tool Used           |
| ---------------- | ------------------- |
| Cloud            | AWS ECS Fargate     |
| Infrastructure   | Terraform           |
| CI/CD            | GitHub Actions      |
| Containerization | Docker              |
| Secrets          | AWS Secrets Manager |
| Backend          | Node.js (Express)   |

---

# 🚀 Features

## ✅ 1. Fail-Fast Secret Validation

* CI/CD pipeline checks required environment variables
* Deployment fails if any secret is missing
* Prevents runtime failures

---

## 🔐 2. Secure Secrets Management

* Secrets stored in AWS Secrets Manager
* Injected into ECS at runtime
* No hardcoded credentials

Example:

```
API_KEY → Secrets Manager
DB_URL → Secrets Manager
```

---

## 🐳 3. Containerized Application

* Node.js app packaged with Docker
* Runs consistently across environments

Run locally:

```
docker build -t zero-app .
docker run -e API_KEY=123 -e DB_URL=test -p 3000:3000 zero-app
```

---

## ☁️ 4. Infrastructure as Code (Terraform)

* ECS Cluster
* Task Definition
* Service
* Security Groups

Deployment:

```
cd terraform
terraform init
terraform apply
```

---

## 🔄 5. CI/CD Pipeline

GitHub Actions pipeline:

* Validates secrets
* Builds Docker image
* Pushes to ECR
* Deploys infrastructure

---

## ❤️ 6. Health Check Endpoint

```
GET /health
```

Response:

```
OK
```

Used for:

* Monitoring
* Deployment verification

---

## 🌐 7. Public Access

* ECS task runs with public IP
* Accessible via:

```
http://<PUBLIC_IP>:3000
```

---

# 🧠 Problem Solved

### ❌ Before

* Missing secrets → app crash
* No validation → broken deployments
* Manual infra → inconsistent environments

### ✅ After

* CI blocks invalid deployments
* Secrets injected securely
* Infrastructure automated

---

# 🔐 Security

* No secrets in code
* Runtime secret injection
* Fail-fast configuration validation

---

# ⚡ Deployment Flow

1. Developer pushes code
2. GitHub Actions triggers pipeline
3. Secrets validated
4. Docker image built & pushed
5. Terraform deploys to ECS
6. App runs with injected secrets
7. Health check verifies deployment

---

# 🧪 Local Testing

```
cd app
npm install
node index.js
```

or Docker:

```
docker run -e API_KEY=123 -e DB_URL=test -p 3000:3000 zero-app
```

---

# 📊 Outcome

* ✅ Zero outage from missing secrets
* ✅ Reliable deployments
* ✅ Production-ready infrastructure
* ✅ Fail-fast validation system

---

# 🔮 Future Improvements

* Add Application Load Balancer (ALB)
* HTTPS with custom domain
* Auto-scaling
* Monitoring & alerting integration

---

# 👨‍💻 Author
krishna.M
Krishnamankali60@gmail.com

---

# 📎 Repository

https://github.com/krishnabyf/zero-outage-devops
