locals {
  apps = coalesce(yamldecode(file("../app.yaml"))["repos"], [])
}
