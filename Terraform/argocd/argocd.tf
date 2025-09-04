resource "helm_release" "argocd" {
  name = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  version          = "8.3.3"
  values = [file("./argocd/values.yaml")]
}