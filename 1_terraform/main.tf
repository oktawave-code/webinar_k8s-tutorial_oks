variable "access_token" {
  type = string
}

provider "oktawave" {
  access_token = var.access_token
  api_url      = "https://k44s-api.i.k44s.oktawave.com"
}

resource "oktawave_kubernetes_cluster" "thisisdemo" {
  name    = "thisisdemo"
  version = "1.21"
}

resource "oktawave_kubernetes_node" "thisisdemonode" {
  count        = 3
  type_id      = 35
  subregion_id = 6
  cluster_name = oktawave_kubernetes_cluster.thisisdemo.id
  depends_on   = [oktawave_kubernetes_cluster.thisisdemo]
}
