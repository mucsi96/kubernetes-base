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
