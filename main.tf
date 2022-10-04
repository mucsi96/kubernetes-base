resource "kubernetes_namespace" "monitoring" {
  metadata {
    name = "monitoring"
  }
}

module "spring-boot-admin" {
  source     = "./spring-boot-admin/deploy"
  namespace  = "monitoring"
  image_name = "mucsi96/spring-boot-admin-server"
}

resource "helm_release" "kube-prometheus-stack" {
  chart            = "kube-prometheus-stack"
  name             = "kube-prometheus-stack"
  namespace        = "monitoring"
  create_namespace = true
  repository       = "https://prometheus-community.github.io/helm-charts"
  version          = "40.1.2"

  values = [
    file("${path.module}/templates/values-kube-prometheus-stack.yaml")
  ]
}

resource "helm_release" "loki-stack" {
  chart            = "loki-stack"
  name             = "loki-stack"
  namespace        = "monitoring"
  create_namespace = true
  repository       = "https://grafana.github.io/helm-charts"
  version          = "2.8.3"
}

