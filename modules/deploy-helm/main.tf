resource "null_resource" "import_helm_charts" {
  count = length(var.charts)

  provisioner "local-exec" {
    command = <<EOT
      az acr import --name ${var.acr_server} \
      --source ${var.source_acr_server}.azurecr.io/${var.charts[count.index].chart_repository}:${var.charts[count.index].chart_version} \
      --subscription ${var.acr_server_subscription}
    EOT
  }
}

resource "helm_release" "chart_installation" {
  count        = length(var.charts)
  name         = var.charts[count.index].chart_name
  repository   = "oci://${var.acr_server}/${var.charts[count.index].chart_repository}"
  chart        = var.charts[count.index].chart_name
  version      = var.charts[count.index].chart_version
  namespace    = var.charts[count.index].chart_namespace

  values = [
    for value in var.charts[count.index].values : "${value.name}=${value.value}"
  ]

  set_sensitive = [
    for sensitive_value in var.charts[count.index].sensitive_values : "${sensitive_value.name}=${sensitive_value.value}"
  ]
}