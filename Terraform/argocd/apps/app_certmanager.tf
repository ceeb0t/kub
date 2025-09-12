# Helm application
resource "argocd_application" "cert-manager" {
  metadata {
    name      = "cert-manager"
    namespace = "argocd"
    labels = {
      test = "true"
    }
  }

  spec {
    destination {
      server    = "https://kubernetes.default.svc"
      namespace = "default"
    }

    source {
      repo_url        = "https://charts.jetstack.io"
      chart           = "cert-manager"
      target_revision = "1.18.2"
      helm {
        release_name = "testing"
      }
    }

    sync_policy {
      automated {
        prune       = true
        self_heal   = true
        allow_empty = true
      }
    }
  }
}