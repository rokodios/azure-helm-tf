variable "acr_server" {
  description = "El nombre del ACR destino donde se importarán los charts"
  type        = string
}

variable "acr_server_subscription" {
  description = "ID de suscripción de Azure donde reside el ACR de destino"
  type        = string
}

variable "source_acr_client_id" {
  description = "Client ID para autenticar con el ACR de referencia"
  type        = string
}

variable "source_acr_client_secret" {
  description = "Client Secret para autenticar con el ACR de referencia"
  type        = string
  sensitive   = true
}

variable "source_acr_server" {
  description = "El nombre del ACR de referencia de donde se extraerán los charts"
  type        = string
}

variable "charts" {
  description = "Lista de charts a importar e instalar"
  type = list(object({
    chart_name       = string
    chart_namespace  = string
    chart_repository = string
    chart_version    = string
    values           = list(object({
      name  = string
      value = string
    }))
    sensitive_values = list(object({
      name  = string
      value = string
    }))
  }))
}