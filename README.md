# Automated High-Availability DevSecOps Infrastructure 

![Ansible](https://img.shields.io/badge/Ansible-E00?style=for-the-badge&logo=ansible&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![HAProxy](https://img.shields.io/badge/HAProxy-106?style=for-the-badge&logo=haproxy&logoColor=white)
![Prometheus](https://img.shields.io/badge/Prometheus-E6522C?style=for-the-badge&logo=prometheus&logoColor=white)

## Overview

This project implements a **Fault-Tolerant, High-Availability (HA) Container Registry** infrastructure using **Infrastructure as Code (IaC)** principles. 

Designed to eliminate Single Points of Failure (SPOF), the architecture orchestrates a cluster of Harbor nodes behind a load balancer, featuring automated security scanning and real-time monitoring.

## Architecture

The system is deployed using **Ansible** playbooks across a multi-node cluster:

* **Load Balancing Layer:** HAProxy + Keepalived (VRRP) for IP Failover.
* **Service Layer:** Harbor Registry (Docker/Helm) with replication enabled.
* **Security Layer:** DevSecOps pipeline with Trivy for automated vulnerability scanning (Quarantine Policy).
* **Monitoring Layer:** Prometheus (Metrics) + Grafana (Visualization).

## Key Features

* **99.9% Availability:** Achieved through active-passive load balancing and storage replication.
* **Infrastructure as Code:** Fully automated deployment using Ansible (`site.yml` and custom Roles).
* **Zero-Touch Security:** Images with "Critical" vulnerabilities are automatically blocked by the quarantine policy.
* **Scalability:** Horizontal scaling supported by simply updating the `inventory.ini` file.

## Project Structure

```text
├── inventory.ini           # Cluster definition (IPs, Groups)
├── site.yml                # Main Ansible Playbook
├── roles/                  # Ansible Roles
│   ├── haproxy             # Load Balancer configuration
│   ├── harbor              # Registry deployment & replication
│   └── monitorizacion      # Prometheus & Node Exporter setup
├── monitor/                # Monitoring Stack configurations
│   ├── docker-compose.yml  # Grafana deployment
│   └── prometheus.yml      # Scraping rules
└── docs/                   # Documentation & Architectural Diagrams