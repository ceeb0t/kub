resource "argocd_application" "node-feature-discovery" {
  metadata {
    name      = "node-feature-discovery"
    namespace = "argocd"
  }

  spec {
    project = "default"

    source {
      repo_url        = "https://github.com/kubernetes-sigs/node-feature-discovery.git"
      path            = "deployment/overlays/default"
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
