#  Containerized Application Deployment & Monitoring 

## Project Overview

A practical DevOps workflow that takes a Python application from source code to
automated CI, containerized deployment, orchestration with Nomad, and production-style
monitoring and logging.

### Stack

- Git & GitHub
- Linux & Bash
- Docker
- GitHub Actions
- HashiCorp Nomad
- Prometheus
- Grafana
- Loki
- Promtail

---

## Architecture

```text
                         GitHub
                            |
                            v
                    GitHub Actions
                            |
                            v
                   Python Application
                            |
                            v
                      Docker Image
                            |
                            v
                          Nomad
                     ┌──────┴──────┐
                     v             v
                Allocation 1   Allocation 2
                     |             |
                     └──────┬──────┘
                            |
                     /metrics :8000
                            |
                            v
                       Prometheus
                            |
                            v
                         Grafana


        Docker Container Logs
                  |
                  v
               Promtail
                  |
                  v
                 Loki
                  |
                  v
               Grafana
```
### Repository Structure <br> 
devops-intern-final/
├── .github/
│   └── workflows/
│       └── ci.yml
├── scripts/
│   └── sysinfo.sh
├── monitoring/
│   ├── prometheus/
│   │   └── prometheus.yml
│   ├── promtail-config.yml
│   └── loki_setup.txt
├── nomad/
│   └── hello.nomad
├── Dockerfile
├── hello.py
├── README.md
└── .gitignore

### Workflow

* Code is managed through Git and GitHub. <br>
* GitHub Actions automatically runs the application on pushes to main.
* Docker packages the application into a lightweight container image. 
* Nomad deploys two application allocations using the Docker driver. 
* The application exposes Prometheus-compatible metrics on /metrics.
* Prometheus scrapes both Nomad allocations. 
* Promtail forwards Docker container logs to Loki.
* Grafana provides visualization for application metrics and logs.


## Verification

The complete workflow was tested successfully:

`bash

nomad node status <br>
nomad job status devops-intern <br>
nomad job allocs devops-intern <br>
docker ps <br>
curl http://127.0.0.1:<allocation-port>/metrics <br>

Both Nomad allocations were running, metrics were accessible, and the monitoring stack was operational. <br>

 ### Run <br>
docker build -t devops-intern:v4 . <br>
nomad job plan nomad/hello.nomad  <br>
nomad job run nomad/hello.nomad <br>
nomad job status devops-intern <br>
 ### Monitoring <br>
Prometheus: http://localhost:9090 <br>
Grafana: http://localhost:3000 <br>
Loki: http://localhost:3100 <br>
### Outcome

A complete DevOps workflow was implemented covering Git, CI, Docker, Nomad, monitoring, and centralized logging using open-source tools.
                
