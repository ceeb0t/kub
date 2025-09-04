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
  version          = "2.0.2"
  depends_on       = [helm_release.argocd]
  values = [file("./argocd/values_apps.yaml")]
}