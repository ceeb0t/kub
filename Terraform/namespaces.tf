resource "kubernetes_namespace" "argocd" {
  metadata {

    labels = {
      "kubernetes.io/metadata.name" = "argocd"
      "name" = "argocd"
    }
    name = "argocd"
  }
}