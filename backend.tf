terraform {
  backend "kubernetes" {
    secret_suffix = "base-state"
    config_path   = "~/.kube/config"
  }
}
