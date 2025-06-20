# Azure Cloud Infrastructure & CI/CD Implementation

## 🔧 Project Overview
This project involves deploying a complete cloud infrastructure using **Terraform** and configuring **CI/CD pipelines** with **Azure DevOps**. It covers hosting:
1. A **Node.js Web Application** on Azure App Service.
2. A **Containerized Application** (Docker) deployed on **Azure Kubernetes Service (AKS)**.

## This project is organized into two separate repositories:
**Repository 1: Infrastructure (Terraform)**
infrastructure/
├── modules/
│   ├── storage/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── keyvault/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── sql-database/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── app-service/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   ├── aks/
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   └── outputs.tf
│   └── acr/
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── environments/
│   ├── dev/
│   │   └── terraform.tfvars
│   ├── qa/
│   │   └── terraform.tfvars
│   ├── staging/
│   │   └── terraform.tfvars
│   └── prod/
│       └── terraform.tfvars
├── main.tf
├── variables.tf
├── locals.tf
├── outputs.tf
├── backend.tf
├── azure-pipelines.yml
└── README.md
**Repository 2: Application Deployment**
nodejs-app/
├── manifests/
│   ├── deployment.yml
│   ├── dev-deploy.yml
│   ├── prod-deploy.yml
│   ├── qa-deploy.yml
│   ├── service.yml
│   └── stage-deploy.yml
├── pipelines/
│   ├── azure-pipelines.yml
│   ├── azure-pipelines-1.yml
│   ├── azure-pipelines-2.yml
│   ├── azure-pipelines-3.yml
│   └── azure-pipelines-4.yml
├── sql/
│   ├── 01-create-table.sql
│   └── 02-insert-users.sql
├── src/
│   ├── app.js
│   └── db.js
├── .env.example
├── .gitignore
├── Dockerfile
├── package.json
├── package-lock.json
└── README.md

---

## 🌐 Infrastructure Deployment with Terraform

### ✅ Provisioned Resources
The following Azure resources are created using Terraform:
- **Azure Storage Account**: Stores Terraform state files remotely for secure collaboration.
- **Azure Key Vault**: Manages sensitive secrets like database passwords and connection strings.
- **Azure SQL Database**: Provides a database service for the application.
- **Azure Web App (App Service)**: Hosts the Node.js web application.
- **Azure Kubernetes Service (AKS)**: Runs containerized workloads for high availability.
- **Azure Container Registry (ACR)**: Stores Docker images for use in AKS.

### ✅ Best Practices Followed
- **Modular Resource Implementation**:  
  Each resource is encapsulated within its own Terraform module (e.g., Key Vault, Web App, AKS). Modules are reusable, making them efficient and scalable.
  
- **Sensitive Data Management**:  
  Secrets (e.g., SQL credentials, connection strings) are centrally stored in **Azure Key Vault**. Sensitive data is retrieved dynamically at runtime, avoiding hardcoded values.

- **State Management**:  
  Terraform state files are stored remotely in **Azure Storage**, with versioning enabled to ensure durability and accountability.

### 🔁 Deployment Steps
1. **Setup Azure Storage Account for Remote Backend (Manual)**:
   - Create a blob container named `tfstate`.
   - Enable versioning for change tracking and state file integrity.

2. **Define Remote Backend Configuration**:
   - Update the `backend.tf` file with remote state settings, including the storage account and resource group details.

3. **Create Terraform Modules**:
   - Develop reusable modules for each resource, such as:
     - Storage Account
     - Key Vault
     - SQL Database
     - Web App
     - AKS
     - ACR

4. **Configure Infrastructure Pipeline**:
   - Use `terraform-prod.yml` in Azure DevOps for CI/CD.
   - The pipeline includes the following stages:
     - **Terraform Init**: Initialize Terraform with backend configuration.
     - **Terraform Plan**: Preview changes on all branches.
     - **Terraform Apply**: Apply changes on the `main` branch with environment approval.
   - Enforce pull request (PR) checks and branch policies to ensure only validated code reaches production.

---

## 🚀 CI/CD Pipeline Setup

### 1. **Node.js Web App Deployment**
- **Pipeline Configuration**:
  - The pipeline is defined in `azure-pipelines-webapp.yml`.
  - Multi-stage pipeline includes:
    1. **Install, Build & Test**:
       - Use `npm` to install dependencies and run unit tests.
    2. **Package Artifact**:
       - Zip the application and publish artifacts for deployment stages.
    3. **Deploy to Azure Web App**:
       - Deploy to environments sequentially: **Dev → QA → Stage → Prod**.
  
- **Deployment Details**:
  - Deployment method uses `AzureWebApp@1` with ZIP deployment.
  - App startup command: `npm run start`.

### 2. **Dockerized Application Deployment to AKS**
- **Pipeline Configuration**:
  - The pipeline is defined in `azure-pipelines-aks.yml`.
  - Multi-stage pipeline includes:
    1. **Build Docker Image & Push to ACR**:
       - Use `Docker@2` task to build and push images to Azure Container Registry.
       - Environment-specific tags are applied (e.g., `webapp:dev`, `webapp:qa`).
    2. **Deploy to AKS**:
       - Use `kubectl` via `KubernetesManifest@0` for deployment.
       - Kubernetes manifests tailored for each environment (Dev, QA, Stage, Prod).

- **Deployment Details**:
  - **ImagePullSecrets** are created per environment for secure image retrieval from ACR.
  - Kubernetes manifests (defined per environment) ensure streamlined deployments.

---

## ✅ Key Features of CI/CD Pipelines
1. **Multi-Stage Pipelines**:
   - Azure DevOps pipelines are meticulously designed to cover Dev → QA → Stage → Prod deployment flows, ensuring proper validation at each stage.

2. **Environment Approvals**:
   - Azure DevOps Environments enforce manual approvals for sensitive stages like production.

3. **Secure Secrets Management**:
   - Secrets are stored in **Azure Key Vault** and fetched securely during deployment.

4. **Branch Policies**:
   - Pull request (PR) checks are defined in YAML to ensure only approved changes are applied to production.

5. **Reusable Configuration**:
   - Parameterized pipelines and reusable Kubernetes manifests simplify deployment across environments.

---

## 🌟 Highlights
- **Secure Architecture**:  
  Configurations avoid hardcoded credentials, leveraging Azure Key Vault and Managed Identities for sensitive data retrieval.
  
- **Scalable Resource Design**:  
  Modular Terraform implementation allows swift addition or modification of resources.

- **Continuous Integration & Delivery (CI/CD)**:
  Robust Azure DevOps pipelines with gated approvals ensure consistent and secure deployment workflows.

---


