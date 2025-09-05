resource "argocd_application" "pluralsite-demo" {
  metadata {
    name      = "pluralsite-demo"
    labels = {
      test = "true"
    }
  }

  spec {
    project = "default"
    source {
      repo_url        = "https://github.com/ceeb0t/kub.git"
      path            = "Nigel"
      target_revision = "HEAD"
      }
    destination {
      server    = "https://kubernetes.default.svc"
      namespace = "default"
    }
  }
}
