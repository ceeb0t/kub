# Helm application
resource "argocd_application" "intel-device-plugins-operator" {
  metadata {
    name      = "intel-device-plugins-operator"
    namespace = "argocd"
    labels = {
      test = "true"
    }
  }

  spec {
    project = "default"

    source {
      repo_url        = "https://intel.github.io/helm-charts/"
      chart           = "intel-device-plugins-operator"
      target_revision = "0.30.0"
      helm {
        release_name = "intel-device-plugins-operator"
      }
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

# Helm application
resource "argocd_application" "intel-device-plugins-gpu" {
  metadata {
    name      = "intel-device-plugins-gpu"
    namespace = "argocd"
    labels = {
      test = "true"
    }
  }

  spec {
    project = "default"

    source {
      repo_url        = "https://intel.github.io/helm-charts/"
      chart           = "intel-device-plugins-gpu"
      target_revision = "0.30.0"
      helm {
        release_name = "intel-device-plugins-gpu"
        value_files = ["./values/intel_values.yaml"]
      }
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

