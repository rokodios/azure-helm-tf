# Para el tfstate cobnectamos con un blobstorage via acceskey
terraform {
  backend "azurerm" {
    resource_group_name  = "StorageAccount-ResourceGroup"
    storage_account_name = "mystorageaccount"                
    container_name       = "tfstate"                   
    key                  = "prod.terraform.tfstate"
  }
}