
job "devops-intern" {
  datacenters = ["dc1"]

  type = "service"

  group "hello" {
    count = 2

    network {
      port "metrics" {
        to = 8000
      }
    }

    restart {
      attempts = 3
      interval = "30m"
      delay    = "15s"
      mode     = "fail"
    }

    task "hello-app" {
      driver = "docker"

      config {
        image = "devops-intern:v4"
        ports = ["metrics"]
      }

      resources {
        cpu    = 100
        memory = 128
      }
    }
  }
}
