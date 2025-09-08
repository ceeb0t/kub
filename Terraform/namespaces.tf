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