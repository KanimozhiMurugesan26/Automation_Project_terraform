# Automation Project - Terraform Infrastructure Provisioning

##  Overview

This project automates the provisioning of a complete cloud infrastructure on **Microsoft Azure** using **Terraform**. It was developed as part of the **CCGC 5502 Cloud Computing** course and fully aligns with the final assignment rubric.

The infrastructure includes:
- Resource Group
- Virtual Network and Subnets
- 3 Linux VMs (CentOS 8.2) in Availability Set
- 1 Windows Server 2016 VM in Availability Set
- Load Balancer (Basic) with 3 Linux VMs as backend pool
- Log Analytics Workspace, Recovery Services Vault, and a Storage Account
- PostgreSQL Flexible Server
- Hostname display using remote-exec provisioner

---

##  Technologies Used

- **Terraform v1.x**
- **AzureRM Provider**
- **Microsoft Azure**
- **Linux (CentOS)** and **Windows Server**
- **GitHub** for version control

---

##  Project Structure
automation_project-terraform-infra/
 backend.tf
 main.tf
 providers.tf
 outputs.tf
 variables.tf
 locals.tf
 modules/
  rgroup-3837/
  network-3837/
  vmlinux-3837/
  vmwindows-3837/
  loadbalancer-3837/
  common-3837/
  database-3837/
 README.md

Deployment Instructions

### 1. Initialize Terraform
terraform init

### Validate Configuration
terraform validate

### Plan Execution
terraform plan

### Apply Configuration
terraform apply

### Cleanup Instructions
terraform destroy

Authors:

Name: Eesh Kumar, Kanimozhi Murugesan

Course: CCGC 5502 - Cloud Computing
