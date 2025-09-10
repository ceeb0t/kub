resource "argocd_application" "pluralsite-demo" {
  metadata {
    name      = "pluralsite-demo"
    namespace = "argocd"
    labels = {
      test = "true"
    }
  }

  spec {
    project = "default"

    source {
      repo_url        = "https://github.com/ceeb0t/kub.git"
      path            = "Deployments/pluralsite-demo"
      target_revision = "HEAD"
    }

    destination {
      server    = "https://kubernetes.default.svc"
      namespace = "default"
    }

    sync_policy {
      automated {
        prune       = true
        self_heal   = true
        allow_empty = false
      }
    }
  }
}
