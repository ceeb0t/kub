resource "kubernetes_namespace" "argocd" {
  metadata {

    labels = {
      "kubernetes.io/metadata.name" = "argocd"
      "name" = "argocd"
    }
    name = "argocd"
  }
}

resource "kubernetes_namespace" "immich" {
  metadata {

    labels = {
      "kubernetes.io/metadata.name" = "immich"
      "name" = "immich"
    }
    name = "immich"
  }
}

resource "kubernetes_namespace" "plugins" {
  metadata {

    labels = {
      "kubernetes.io/metadata.name" = "plugins"
      "name" = "plugins"
    }
    name = "plugins"
  }
}