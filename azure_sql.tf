provider "azurerm" {
  features {}
}

# Variables
variable "azure_region" {
  default = "East US"  # Update with your desired Azure region
}

variable "resource_group_name" {
  default = "myResourceGroup"  # Update with your desired resource group name
}

variable "sql_server_name" {
  default = "mySqlServer"  # Update with your desired SQL Server name
}

variable "database_name" {
  default = "myDatabase"  # Update with your desired database name
}

variable "administrator_login" {
  default = "adminUser"  # Update with your desired SQL Server admin username
}

variable "administrator_password" {
  default = "P@ssw0rd123"  # Update with your desired SQL Server admin password
}

# Create a resource group
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.azure_region
}

# Create a SQL Server instance
resource "azurerm_sql_server" "example" {
  name                         = var.sql_server_name
  resource_group_name          = azurerm_resource_group.example.name
  location                     = var.azure_region
  version                      = "12.0"  # Specify the desired SQL Server version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_password
}

# Create a SQL Database
resource "azurerm_sql_database" "example" {
  name                = var.database_name
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_sql_server.example.name
  edition             = "Standard"  # Specify the desired database edition (e.g., Basic, Standard, Premium)
  collation           = "SQL_Latin1_General_CP1_CI_AS"  # Specify the desired collation
}

# Output
output "sql_server_fqdn" {
  value = azurerm_sql_server.example.fully_qualified_domain_name
}

output "database_endpoint" {
  value = azurerm_sql_database.example.endpoint
}
