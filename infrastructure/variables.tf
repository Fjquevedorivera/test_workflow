variable "project_id" {
  type = string
  description = "ID del proyecto de Google Cloud"
}

variable "region" {
  type = string
  description = "Región de despliegue de la Cloud Function"
}

variable "cf_name" {
  type = string
  description = "Nombre de la Cloud Function"
}