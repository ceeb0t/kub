resource "helm_release" "argocd" {
  name = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  version          = "8.3.3"
  values = [file("./argocd/values.yaml")]
}

resource "helm_release" "argocd-apps" {
  name = "argocd-apps"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argocd-apps"
  namespace        = "argocd"
  version          = "1.4.1"
  values = [file("./argocd/values_apps.yaml")]
}