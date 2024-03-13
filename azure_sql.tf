# Define resource group
resource "azurerm_resource_group" "db-rsc" {
  name     = "db-src"
  location = "West Europe"
}

# Define sql server
resource "azurerm_sql_server" "sql_server" {
  name                         = "sql_server"
  resource_group_name          = azurerm_resource_group.db-src.name
  location                     = azurerm_resource_group.db-src.location
  version                      = "12.0"
  administrator_login          = "myadmin"
  administrator_login_password = "Azure@1234"
}

# Define sql database
resource "azurerm_sql_database" "sql_db" {
  name                = "sql_db"
  resource_group_name = azurerm_resource_group.db-rsc.name
  location            = azurerm_resource_group.db-rsc.location
  server_name         = azurerm_sql_server.sql_server.name

  depends_on = [
    azurerm_sql_server.sql_server
  ]

}

# For access through internet
resource "azurerm_sql_firewall_rule" "sql_firewall_rule" {
  name                = "sql_firewall_rule"
  resource_group_name = azurerm_resource_group.db-rsc.name
  server_name         = azurerm_sql_server.sql_server.name

# I have add my IP only for access DB
  start_ip_address    = "175.157.40.69" 
  end_ip_address      = "175.157.40.69" 

  depends_on = [
    azurerm_sql_server.sql_server
  ]
}
