# AWS ECS Fargate Deployment with Terraform

This project provisions a secure, production-ready AWS infrastructure using Terraform to deploy a containerized application on ECS Fargate, fronted by an Application Load Balancer (ALB), with remote state management in S3 and DynamoDB.

## Features
- **VPC** with 2 public and 2 private subnets (across 2 AZs)
- **ECS Fargate Cluster** for serverless container hosting
- **Application Load Balancer (ALB)** in public subnets
- **ECS Service** running your container in private subnets
- **Security Groups** for ALB and ECS tasks
- **Remote Terraform State** in S3 with DynamoDB for locking

---

## Prerequisites
- [Terraform](https://www.terraform.io/downloads.html) v1.0+
- AWS CLI configured with appropriate credentials
- An S3 bucket and DynamoDB table for remote state (must exist before `terraform init`)

---

## Remote Backend Setup

Add this block to your `main.tf` (already included, edit values as needed):

```hcl
terraform {
  backend "s3" {
    bucket         = "<your-terraform-state-bucket>"
    key            = "ecs/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "<your-terraform-lock-table>"
    encrypt        = true
  }
}
```

**Note:**
- The S3 bucket and DynamoDB table must exist before running `terraform init`.
- You can create them manually or with a separate Terraform config.

---

## How to Use

1. **Clone this repository**
2. **Change directory**:
   ```sh
   cd terraform-task
   ```
3. **Initialize Terraform** (downloads providers, configures backend):
   ```sh
   terraform init
   ```
4. **Review the plan**:
   ```sh
   terraform plan
   ```
5. **Apply the configuration**:
   ```sh
   terraform apply
   ```
   - Confirm when prompted.

6. **Destroy the infrastructure** (when done):
   ```sh
   terraform destroy
   ```

---

## Customization
- **Container Image**: Change the image in the ECS task definition as needed.
- **VPC/Subnet CIDRs**: Adjust in the VPC module block.
- **Regions/AZs**: Update the `azs` and `region` fields for your AWS region.

---

## Resources Created
- VPC, subnets, route tables, NAT gateway
- Security groups for ALB and ECS tasks
- ECS cluster, task definition, and service (Fargate)
- Application Load Balancer and target group

---

## Notes
- The ECS service runs the container named `timestampflaskapp` on port 5000.
- The ALB listens on port 80 and forwards traffic to the ECS service.
- All state is stored remotely in S3 with locking via DynamoDB.

---


