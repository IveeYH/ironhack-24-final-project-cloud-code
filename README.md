# Ironhack 2024 Veronica Larroy's final project - Cloud Code

This repository contains Terraform code to deploy a machine learning model as a containerized service on Google Cloud Run across three environments: `dev`, `qa`, and `pro`. The deployment uses Google Cloud Platform (GCP) and follows best practices for modular Terraform code.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Project Structure](#project-structure)
- [Setup Instructions](#setup-instructions)
  - [1. Google Cloud SDK Configuration](#1-google-cloud-sdk-configuration)
  - [2. Terraform Installation](#2-terraform-installation)
  - [3. Clone the Repository](#3-clone-the-repository)
  - [4. Configure the Environments](#4-configure-the-environments)
  - [5. Deploying the Environments](#5-deploying-the-environments)
- [Managing Infrastructure](#managing-infrastructure)
- [Contributing](#contributing)
- [License](#license)

## Prerequisites

Before deploying the infrastructure, ensure you have the following:

1. A Google Cloud Platform (GCP) project.
2. Google Cloud SDK installed and configured.
3. Terraform installed on your local machine.
4. Docker image of your machine learning model pushed to Google Container Registry (GCR).

## Project Structure

```
.
├── environments
│   ├── dev
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── terraform.tfvars
│   │   └── variables.tf
│   ├── qa
│   │   ├── main.tf
│   │   ├── outputs.tf
│   │   ├── terraform.tfvars
│   │   └── variables.tf
│   └── pro
│       ├── main.tf
│       ├── outputs.tf
│       ├── terraform.tfvars
│       └── variables.tf
└── modules
    └── cloud_run_service
        ├── main.tf
        ├── outputs.tf
        └── variables.tf
```

## Setup Instructions

### 1. Google Cloud SDK Configuration

1. **Install Google Cloud SDK**: If not installed, download and install the [Google Cloud SDK](https://cloud.google.com/sdk/docs/install).

2. **Authenticate with GCP**:
   ```bash
   gcloud auth login
   ```

3. **Set the Default Project**:
   ```bash
   gcloud config set project YOUR_PROJECT_ID
   ```

4. **Enable Required APIs**:
   Ensure the following APIs are enabled:
   - Cloud Run API
   - Google Container Registry API
   - IAM API

   You can enable them via the GCP Console or using the `gcloud` command:
   ```bash
   gcloud services enable run.googleapis.com containerregistry.googleapis.com iam.googleapis.com
   ```

### 2. Terraform Installation

If Terraform is not already installed, follow the instructions [here](https://learn.hashicorp.com/tutorials/terraform/install-cli) to install Terraform on your local machine.

### 3. Clone the Repository

Clone this repository to your local machine:

```bash
git clone https://github.com/IveeYH/ironhack-24-final-project-cloud-code.git
cd ironhack-24-final-project-cloud-code
```

### 4. Configure the Environments

Each environment (`dev`, `qa`, `pro`) has its own directory with Terraform configurations. Adjust the `terraform.tfvars` files in each environment folder to match your GCP project settings.

#### Example: `terraform.tfvars` for `dev` Environment

```hcl
project_id = "your-gcp-project-id"
region     = "europe-southwest1"
```

Ensure that the `container_image` in `variables.tf` matches the correct image tag for each environment.

### 5. Deploying the Environments

To deploy the infrastructure for each environment:

1. **Navigate to the Environment Directory**:
   ```bash
   cd environments/dev
   ```

2. **Initialize Terraform**:
   ```bash
   terraform init
   ```

3. **Preview the Deployment Plan**:
   ```bash
   terraform plan
   ```

4. **Apply the Deployment**:
   ```bash
   terraform apply
   ```

   Repeat these steps for the `qa` and `pro` environments.

## Managing Infrastructure

- **Updating Infrastructure**: Modify the Terraform code as needed, then run `terraform plan` and `terraform apply` to update the infrastructure.
- **Destroying Infrastructure**: If you need to tear down the environment, run:
  ```bash
  terraform destroy
  ```

## Contributing

If you'd like to contribute, please fork the repository and use a feature branch. Pull requests are welcome.