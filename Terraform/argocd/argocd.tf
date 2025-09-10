resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  namespace  = "argocd"
  version    = "8.3.3"
  values     = [file("./argocd/values.yaml")]
}

# resource "helm_release" "argocd-apps" {
#   name       = "argocd-apps"
#   repository = "https://argoproj.github.io/argo-helm"
#   chart      = "argocd-apps"
#   namespace  = "argocd"
#   version    = "2.0.2"
#   depends_on = [helm_release.argocd]
#   values     = [file("./argocd/values_apps.yaml")]
# }

resource "kubernetes_config_map_v1_data" "argocd-cm" {
  force = true
  metadata {
    name      = "argocd-cm"
    namespace = "argocd"
  }
  data = {
    "accounts.cee"             = "apiKey, login"
    "accounts.cee.enabled"     = "true"
    "accounts.deploy"          = "login"
    "accounts.deploy.enabled"  = "true"
  }
}

resource "kubernetes_config_map_v1_data" "argocd-rbac-cm" {
  force = true
  metadata {
    name      = "argocd-rbac-cm"
    namespace = "argocd"
  }
  data = {
    "policy.csv" = <<EOT
p, role:admin, applications, *, */*, allow
p, role:admin, clusters, *, *, allow
p, role:admin, repositories, *, *, allow
p, role:admin, certificates, *, *, allow
g, cee, role:admin
g, deploy, role:admin
EOT
  }
}
