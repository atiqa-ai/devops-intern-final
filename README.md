

## Project Overview

This project demonstrates a small but realistic DevOps workflow using
open-source tools learned during the DevOps internship training.

The project covers:

- Git and GitHub
- Linux scripting
- Docker containerization
- GitHub Actions CI
- Nomad deployment
- Prometheus monitoring
- Grafana visualization
- Loki log aggregation
- Promtail Docker log forwarding

The workflow takes a simple Python application from source code through
CI, containerization, deployment with Nomad, and monitoring/logging.

---

# Architecture

```text
                    GitHub Repository
                           |
                           v
                  GitHub Actions CI
                           |
                           v
                    Python Application
                           |
                           v
                    Docker Container
                           |
                           v
                         Nomad
                    /              \
                   /                \
          Allocation 1          Allocation 2
                   \                /
                    \              /
                     \            /
                       Application
                           |
              +------------+------------+
              |                         |
              v                         v
         Prometheus                 Docker Logs
              |                         |
              v                         v
           Grafana                  Promtail
                                        |
                                        v
                                      Loki
                                        |
                                        v
                                     Grafana