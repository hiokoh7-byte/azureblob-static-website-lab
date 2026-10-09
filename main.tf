# Resource Group — the container for everything in this lab
resource "azurerm_resource_group" "rg" {
  name     = "rg-lab01-${var.yourname}"
  location = var.location
}

# Storage account names must be globally unique, lowercase, no special
# characters. random_string appends a short unique suffix so repeated
# applies (or other students) never collide.
resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}

resource "azurerm_storage_account" "site" {
  name                     = "stlab01${var.yourname}${random_string.suffix.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  # Enabling this block is what turns on static website hosting and
  # creates the $web container automatically.
  static_website {
    index_document     = var.index_document
    error_404_document = var.error_404_document
  }
}

# Uploads index.html straight into the $web container Azure created above.
# source references the local file in ./site, so Terraform re-uploads it
# automatically any time that file's content changes.
resource "azurerm_storage_blob" "index" {
  name                   = var.index_document
  storage_account_name   = azurerm_storage_account.site.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "${path.module}/site/index.html"
  content_type           = "text/html"
  content_md5     = filemd5("${path.module}/site/index.html")
}
