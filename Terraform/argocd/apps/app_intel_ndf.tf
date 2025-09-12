resource "argocd_application" "intel-feature-discovery" {
  metadata {
    name      = "intel-device-plugins"
    namespace = "argocd"
  }

  spec {
    project = "default"

    source {
      repo_url        = "https://github.com/intel/intel-device-plugins-for-kubernetes.git"
      path            = "deployments/nfd/overlays/node-feature-rules"
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
