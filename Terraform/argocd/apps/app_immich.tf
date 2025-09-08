resource "argocd_application" "immich" {
  metadata {
    name      = "immich"
    namespace = "argocd"
    labels = {
      test = "true"
    }
  }

  spec {
    project = "default"

    source {
      repo_url        = "https://github.com/ceeb0t/kub.git"
      path            = "Deployments/immich"
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
        allow_empty = true
      }
    }
  }
}
