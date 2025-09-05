terraform {
  required_providers {
    argocd = {
      source = "jojand/argocd"
      version = "2.3.2"
    }
  }
}

provider "argocd" {
  server_addr = "192.168.21.13:30443"
  username = "admin"
  insecure = true
}
