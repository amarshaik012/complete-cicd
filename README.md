#  Complete CI/CD Pipeline Project

This project demonstrates a basic DevOps CI/CD pipeline using **Jenkins**, **Docker**, **Terraform**, and **Kubernetes** on **Google Cloud Platform (GCP)**.

---

##  What This Project Does

- Pulls code from GitHub  
- Builds a Docker image of a Flask app  
- Pushes the image to Docker Hub  
- Provisions Kubernetes cluster on GCP using Terraform  
- Deploys app to GKE using `kubectl`  
- (Optional) Monitors using GCP or Prometheus  

---

##  Tools Used

- **Jenkins** – CI/CD automation  
- **Docker** – Containerization  
- **Terraform** – Infrastructure as Code (IaC)  
- **Kubernetes** – Orchestration  
- **GCP (GKE)** – Cloud platform  
- **GitHub** – Source code  
- **Prometheus** – Monitoring  

---

## 📂 Project Structure

```
complete-cicd/
│
├── app/                 # Flask App
├── Dockerfile           # Build image
├── Jenkinsfile          # CI/CD pipeline
├── terraform/           # Infra setup
├── k8s/                 # Deployment YAMLs
└── prometheus.yml       # (Optional) Monitoring
```

---

## 🔧 Steps to Run

1. Clone the repo:
   ```bash
   git clone https://github.com/amarshaik012/complete-cicd.git
   cd complete-cicd
   ```

2. Build & Run locally:
   ```bash
   docker build -t amar0126/complete-cicd .
   docker run -p 5000:5000 amar0126/complete-cicd
   ```

3. Setup Infrastructure:
   ```bash
   cd terraform
   terraform init
   terraform apply
   ```

4. Deploy to GKE:
   ```bash
   kubectl apply -f k8s/
   ```

---

##  Status

- [x] Jenkins working  
- [x] Docker build & push  
- [x] GCP cluster via Terraform  
- [x] App deployed to Kubernetes  
- [x] Monitored via GCP dashboard  

---

## Author

**Amar Shaik**  
📧 amarshaik012@gmail.com  
🔗 [LinkedIn](https://www.linkedin.com)
