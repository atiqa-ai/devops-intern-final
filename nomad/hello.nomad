job "devops-intern" {

  datacenters = ["dc1"]

  type = "service"

  group "hello" {

    count = 1


    task "hello-app" {

      driver = "docker"

      config {
        image = "devops-intern:v2"
      }

      resources {
        cpu    = 100
        memory = 128
      }
    }
  }
}
