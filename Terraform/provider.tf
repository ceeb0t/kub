terraform {
  required_providers {
    argocd = {
      source = "jojand/argocd"
      version = "2.3.2"
    }
  }
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "kubernetes-admin@kubernetes"
}

provider "helm" {
  kubernetes = {
    config_path = "~/.kube/config"
  }
}