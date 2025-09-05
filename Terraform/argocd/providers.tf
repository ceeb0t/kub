terraform {
  required_providers {
    argocd = {
      source = "argoproj-labs/argocd"
      version = "7.11.0"
    }
  }
}

provider "argocd" {
  server_addr = "192.168.21.13:30443"
  insecure = true
  auth_token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJhcmdvY2QiLCJzdWIiOiJjZWU6YXBpS2V5IiwibmJmIjoxNzU3MDcxNTk2LCJpYXQiOjE3NTcwNzE1OTYsImp0aSI6ImU1YzQzODJjLTA0MGQtNDI5OC05ZGUzLWNkYmM2YmVkYjNjYiJ9.Y_kZbwyPTKFOg9u3YSNaLSUPzDHUkZBn8h2Y9E-ixWM"
}
