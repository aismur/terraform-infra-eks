# Terraform Deployment Workflow

This README provides instructions on how to deploy the **Proshop App** using the **Terraform Deployment Workflow**. It is intended to guide users through the process of deploying the application to AWS using Terraform, ECR, EKS, Kubernetes, and Helm.

## Table of Contents

1. Overview
2. Prerequisites
3. Create a Kubernetes Cluster on AWS
4. Workflow Overview
5. Steps to Deploy
6. Usage
7. Troubleshooting
8. Links to Documentation

## Overview

The **Proshop App** CI/CD pipeline uses **Terraform** to manage infrastructure on AWS and **Helm** to deploy applications to a Kubernetes cluster. This guide explains how to deploy the application using the workflow provided.

### Key Technologies Used:

- **Terraform**: Infrastructure as Code (IaC) tool for provisioning AWS resources.
- **GitHub Actions**: Used to automate the CI/CD process, including deployment to AWS EKS.
- **Amazon ECR**: Stores Docker images for the backend and frontend applications.
- **Amazon EKS**: Kubernetes service that hosts the applications.
- **Helm**: Manages Kubernetes applications for both backend and frontend services.

## Prerequisites

Before deploying, ensure you have the following:

1. **AWS Account** with necessary permissions to manage ECR, EKS, and IAM roles.
2. **GitHub Repository** with the following secrets set:
    - `AWS_ACCESS_KEY_ID`
    - `AWS_SECRET_ACCESS_KEY`
    - `IAM_ROLE`: The IAM role ARN for GitHub Actions.
3. **Terraform and Helm** installed locally if you plan to run commands manually.

## Create a Kubernetes Cluster on AWS

You must create a Kubernetes cluster using **Amazon EKS** to deploy the **Proshop App**. Here are the steps to create an EKS cluster:

1. **Create an EKS Cluster using Terraform:**
Use the Terraform configuration provided in this repository to create an EKS cluster. This configuration automates the process of provisioning all necessary AWS resources for the EKS cluster.
    
    Run the following Terraform commands:
    
    ```bash
    bash
    Copy code
    terraform init
    terraform apply -var-file=project-x.tfvars
    
    ```
    
    This will provision the EKS cluster, configure the necessary networking components (VPC, subnets), and create a Kubernetes control plane.
    
2. **Configure kubectl for AWS EKS:**
After the EKS cluster is created, update your local Kubernetes configuration to interact with the EKS cluster:
    
    ```bash
    bash
    Copy code
    aws eks update-kubeconfig --name <cluster-name> --region <region>
    
    ```
    
    This step will configure `kubectl` to communicate with your new Kubernetes cluster.
    
3. **Verify Kubernetes Cluster:**
Run the following command to ensure the Kubernetes cluster is correctly set up:
    
    ```bash
    bash
    Copy code
    kubectl get nodes
    
    ```
    
    You should see a list of nodes that are part of your EKS cluster.
    

Once the Kubernetes cluster is up and running, you can proceed with deploying the **Proshop App** using the provided CI/CD pipeline.

## Workflow Overview

This workflow is triggered on push events to the `dev` branch and pull requests to the `main` branch. It supports manual dispatch (`workflow_dispatch`) and automates the following tasks:

- Initialize Terraform and apply infrastructure changes.
- Build and push Docker images for the backend and frontend to Amazon ECR.
- Deploy the backend and frontend to Amazon EKS using Helm.
- Configure Kubernetes and AWS resources.

### CI/CD Pipeline Triggers

The workflow triggers on:

- Pushes to the `dev` branch.
- Pull requests to the `main` branch.
- Manual dispatch.

## Steps to Deploy

### 1. **Setting Up GitHub Secrets**

Ensure the following secrets are configured in your GitHub repository:

- `AWS_ACCESS_KEY_ID`: Your AWS Access Key.
- `AWS_SECRET_ACCESS_KEY`: Your AWS Secret Access Key.
- `IAM_ROLE`: The ARN of the IAM role with permissions to manage EKS and ECR.

### 2. **Initialize Terraform**

This workflow initializes and validates the Terraform configuration, applies infrastructure changes, and manages the AWS resources.

### 3. **Build and Push Docker Images**

The Docker images for the backend and frontend are built and pushed to Amazon ECR if the branch is not `main`.

### 4. **Login to Amazon EKS**

The workflow logs into the EKS cluster to update the kubeconfig and install necessary services, such as the NGINX Ingress Controller and the Secrets Store CSI Driver.

### 5. **Deploy Using Helm**

The backend and frontend applications are deployed to the EKS cluster using Helm with the respective `dev-values.yaml` files. Helm charts handle application configuration and deployment.

## Usage

### Deploying the Application

1. **Push Code**: Push your code changes to the `dev` branch or open a pull request to the `main` branch.
2. **Trigger Workflow**: The workflow will automatically execute, deploying your infrastructure and application.
3. **Monitor Deployment**: You can monitor the deployment in the GitHub Actions tab for the repository.
4. **Verify Deployment**: Ensure your backend and frontend services are running on your EKS cluster by checking Kubernetes resources.

## Troubleshooting

- **AWS Authentication Issues**: Ensure that your GitHub secrets are correctly configured and that your IAM role has sufficient permissions.
- **Kubernetes Deployment Failures**: Check the Helm release logs and Kubernetes events for errors.
- **Docker Build Failures**: Review the Docker build logs in the Actions tab.

## Links to Documentation

- Terraform Documentation
- [AWS ECR Documentation](https://docs.aws.amazon.com/ecr)
- [Amazon EKS Documentation](https://docs.aws.amazon.com/eks)
- [Helm Documentation](https://helm.sh/docs)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)

By following these instructions, you can create a Kubernetes cluster on AWS and deploy the **Proshop App**, ensuring efficient infrastructure management and continuous delivery using modern DevOps tools and practices.