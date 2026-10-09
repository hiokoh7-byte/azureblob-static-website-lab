variable "yourname" {
  description = "Your name, lowercase, no spaces. Used to make resource names unique."
  type        = string
}

variable "location" {
  description = "Azure region to deploy into."
  type        = string
  default     = "East US"
}

variable "index_document" {
  description = "Name of the static website's index document."
  type        = string
  default     = "index.html"
}

variable "error_404_document" {
  description = "Name of the static website's 404 error document."
  type        = string
  default     = "404.html"
}
