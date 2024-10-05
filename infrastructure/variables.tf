variable "project_id" {
  type = string
  description = "ID del proyecto de Google Cloud"
}

variable "region" {
  type = string
  description = "Región de despliegue de la Cloud Function"
}

variable "memory_mb" {
  type = number
  description = "Memoria asignada para la Cloud Function"
  default = 128
}

variable "timeout" {
  type = number
  description = "Tiempo máximo de ejecución de la Cloud Function en segundos"
  default = 60
}

variable "bucket_name" {
  type = string
  description = "Nombre del bucket de almacenamiento para el código fuente"
}

variable "function_name" {
  type = string
  description = "Nombre de la Cloud Function"
}
