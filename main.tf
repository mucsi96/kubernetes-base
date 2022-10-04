module "cert-manager" {
  source = "./modules/cert-manager"
}

module "sealed-secrets" {
  source = "./modules/sealed-secrets"
}

module "kubernetes-dashboard" {
  source    = "./modules/kubernetes-dashboard"
  namespace = "monitoring"
}

module "spring-boot-admin" {
  source     = "./modules/spring-boot-admin"
  namespace  = "monitoring"
  image_name = "mucsi96/spring-boot-admin-server"
}

module "monitoring" {
  source    = "./modules/monitoring"
  namespace = "monitoring"
}
