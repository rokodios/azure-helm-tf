# Variables auth (El valor se inyecta a traves de la pipeline)
variable "subscription_id" {
  description = "ID de la suscripción de Azure"
  type        = string
}

variable "client_id" {
  description = "Client ID para la autenticación de Azure"
  type        = string
}

variable "client_secret" {
  description = "Client Secret para la autenticación de Azure"
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "Tenant ID para la autenticación de Azure"
  type        = string
}

# Variables ACR
variable "acr_server" {
  description = "El nombre del ACR de destino"
}

variable "acr_server_subscription" {
  description = "ID de la suscripción de Azure donde reside el ACR de destino"
}

variable "source_acr_client_id" {
  description = "Client ID para autenticar con el ACR de referencia"
}

variable "source_acr_client_secret" {
  description = "Client Secret para autenticar con el ACR de referencia"
  sensitive   = true
}

variable "source_acr_server" {
  description = "El nombre del ACR de referencia de donde se extraerán los charts"
}

#Variables Charts
variable "charts" {
  description = "Lista de charts a importar e instalar"
  type = list(object({
    chart_name       = string
    chart_namespace  = string
    chart_repository = string
    chart_version    = string
    values = list(object({
      name  = string
      value = string
    }))
    sensitive_values = list(object({
      name  = string
      value = string
    }))
  }))
}