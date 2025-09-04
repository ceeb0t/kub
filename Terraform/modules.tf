module "argocd" {
  source = "./argocd"
}
module "sample_apps" {
  source = "./sample"
}