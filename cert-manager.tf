resource "helm_release" "cert-manager" {
  name             = "cert-manager"
  namespace        = "cert-manager"
  create_namespace = true
  chart            = "cert-manager"
  repository       = "https://charts.jetstack.io"
  version          = "v1.9.1"

  set {
    name  = "installCRDs"
    value = "true"
  }
}

# CRD Ref: https://cert-manager.io/docs/reference/api-docs/#cert-manager.io/v1.ClusterIssuer
resource "kubernetes_manifest" "tls_issuer" {
  manifest = {
    apiVersion = "cert-manager.io/v1"
    kind       = "ClusterIssuer"
    metadata = {
      name = "tls-issuer"
    }
    spec = {
      acme = {
        server = "https://acme-v02.api.letsencrypt.org/directory"
        email  = "mucsi96@gmail.com"
        privateKeySecretRef = {
          name = "tls-secret"
        }
        solvers = [{ http01 = { ingress = { class = "traefik" } } }]
      }
    }
  }
}
