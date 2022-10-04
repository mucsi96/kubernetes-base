resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}

module "cert-manager" {
  source = "./cert-manager"
}

module "sealed-secrets" {
  source = "./sealed-secrets"
}

module "kubernetes-dashboard" {
  source    = "./kubernetes-dashboard"
  namespace = "monitoring"
}

module "spring-boot-admin" {
  source     = "./spring-boot-admin/deploy"
  namespace  = "monitoring"
  image_name = "mucsi96/spring-boot-admin-server"
}

module "monitoring" {
  source    = "./monitoring"
  namespace = "monitoring"
}
