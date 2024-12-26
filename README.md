# MERN Stack Application Deployment on AWS

## Objective
This project demonstrates the deployment of a MERN (MongoDB, Express.js, React, Node.js) stack application on AWS using Terraform for infrastructure automation and Ansible for configuration management.

---

## Application Details
**MERN Application Used**: [TravelMemory](https://github.com/UnpredictablePrashant/TravelMemory)

---

## Project Breakdown

### Part 1: Infrastructure Setup with Terraform

#### 1. AWS Setup and Terraform Initialization
- Configured AWS CLI and authenticated with the AWS account.
- Initialized a new Terraform project targeting AWS.

#### 2. VPC and Network Configuration
- Created a VPC with two subnets:
  - **Public Subnet**: For the web server.
  - **Private Subnet**: For the database server.
- Set up:
  - Internet Gateway for internet access to the public subnet.
  - NAT Gateway for secure internet access from the private subnet.
- Configured route tables for the subnets.

#### 3. EC2 Instance Provisioning
- Launched two EC2 instances:
  - **Web Server**: Deployed in the public subnet.
  - **Database Server**: Deployed in the private subnet.
- Configured SSH access:
  - Public EC2 instance accessible only from a specified IP.
  - Private EC2 instance accessible via the public instance.

#### 4. Security Groups and IAM Roles
- Created security groups:
  - For the web server and database server.
  - Restricted access based on least privilege principles.
- Set up IAM roles for the EC2 instances with required permissions.

#### 5. Resource Output
- Output the public IP of the web server EC2 instance for access.

---

### Part 2: Configuration and Deployment with Ansible

#### 1. Ansible Configuration
- Configured Ansible to communicate with the AWS EC2 instances using SSH keys.

#### 2. Web Server Setup
- Wrote an Ansible playbook to:
  - Install Node.js and NPM.
  - Clone the [TravelMemory](https://github.com/UnpredictablePrashant/TravelMemory) repository.
  - Install application dependencies.

#### 3. Database Server Setup
- Wrote an Ansible playbook to:
  - Install and configure MongoDB.
  - Secure MongoDB with users, roles, and databases.

#### 4. Application Deployment
- Configured environment variables for the application.
- Started the Node.js application.
- Ensured connectivity between the React frontend and the Express backend.

#### 5. Security Hardening
- Hardened security by:
  - Configuring firewalls and security groups.
  - Disabling root login.
  - Enforcing SSH key pair authentication.

---

## Deliverables

### 1. Terraform Scripts
Contains scripts for:
- VPC and networking setup.
- EC2 instance provisioning.
- Security group and IAM role configuration.

### 2. Ansible Playbooks
Includes playbooks for:
- Web server setup (Node.js, application dependencies).
- Database server setup (MongoDB installation and configuration).
- Application deployment and security hardening.

### 3. Documentation
- A detailed report documenting the implementation process.
- Explanation of how application components interact with the infrastructure.

### 4. Demonstration
- Screenshots or a video showing the working application hosted on AWS.

---

## Repository Structure
```
.
├── terraform
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── ... (other Terraform configuration files)
├── ansible
│   ├── playbook_webserver.yml
│   ├── playbook_dbserver.yml
│   ├── inventory
│   └── ... (other Ansible configuration files)
├── docs
│   ├── implementation_report.pdf
│   └── screenshots
├── README.md
```

---

## Getting Started

### Prerequisites
- AWS CLI installed and configured.
- Terraform installed.
- Ansible installed.
- SSH key pair for accessing the EC2 instances.

### Instructions

#### Step 1: Set Up Infrastructure
1. Navigate to the `terraform` directory.
2. Run the following commands:
   ```bash
   terraform init
   terraform plan
   terraform apply
   ```
3. Note the public IP of the web server from the Terraform output.

#### Step 2: Configure and Deploy the Application
1. Navigate to the `ansible` directory.
2. Update the `inventory` file with the EC2 instance IPs.
3. Run the Ansible playbooks:
   ```bash
   ansible-playbook playbook_webserver.yml
   ansible-playbook playbook_dbserver.yml
   ```

#### Step 3: Verify Deployment
1. Access the application using the web server's public IP.
2. Confirm connectivity between the frontend and backend.

---

## Additional Notes
- Ensure the necessary AWS permissions are granted for Terraform and Ansible.
- Review the `docs/implementation_report.pdf` for a detailed implementation walkthrough.

---

## License
This project is licensed under the MIT License. See the LICENSE file for details.
