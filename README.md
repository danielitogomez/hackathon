# Hackathon

This repository is designed for a hackathon to practice Linux and complete various challenges. It includes scripts and configurations for setting up an EC2 instance using Terraform and configuring it with Ansible.

## EC2 with Terraform and Ansible

This project demonstrates the creation of an EC2 instance using Terraform and the subsequent configuration of that instance using an Ansible playbook. This is a Proof of Concept (PoC) for automating infrastructure setup and configuration management.

## Prerequisites

- Terraform CLI
- Ansible CLI
- AWS CLI configured with credentials
- SSH keys for accessing the EC2 instances

## Project Structure

The project consists of the following directories:

- [infra](https://github.com/danielitogomez/hackathon/tree/main/infra): Contains the Terraform code for setting up AWS resources.
- [build](https://github.com/danielitogomez/hackathon/tree/main/build): Contains Docker build scripts and related files like the Dockerfile and the Linux challenges.
- [scripts](https://github.com/danielitogomez/hackathon/tree/main/scripts): Contains additional scripts for running Docker containers.

## Setup

### Terraform flow

Initialize, plan and apply the terraform to create the necessary AWS resources:

```sh
terraform init
terraform plan
terraform apply
```

## Updating the Inventory

After creating a new VM, update the Ansible inventory file with the new EC2 instance details and SSH keys. This step is necessary to ensure Ansible can connect to and manage the new instance.

## Ansible Playbook

Run the Ansible playbook to configure the EC2 instance:

```sh
ansible-playbook -i inventory playbook.yml
```

## The playbook performs the following tasks:

- Updates all packages
- Installs Docker, Git, and Nmap
- Starts and enables the Docker service
- Adds `ec2-user` to the Docker group
- Clones a Git repository
- Executes a Docker build script

## Accessing the EC2 Instance

Use SSH to access the EC2 instance:

```sh
# You also can use ssh-agent and ssh-add, it's up to you
ssh -i path_to_your_key ec2-user@your_ec2_ip
```

## Running the Docker Script

Once logged in, run the Docker container script:

```sh
./run-container.sh
```

## Docker Container Script

The `run-container.sh` script lists available ports and runs a Docker container on an available port. Ensure the security group allows access to the necessary ports.

## Important Notes

- The inventory needs to be updated every time a new VM is created.
- SSH keys should also be updated accordingly.
- The security group must allow access to the ports specified in the run-container script.

For more details, refer to the respective directories in the repository:

- [Infrastructure setup](https://github.com/danielitogomez/hackathon/tree/main/infra)
- [Docker build scripts](https://github.com/danielitogomez/hackathon/tree/main/build)
- [Additional scripts](https://github.com/danielitogomez/hackathon/tree/main/scripts)


