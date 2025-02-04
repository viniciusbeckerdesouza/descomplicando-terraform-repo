variable "image_id" {
  type = string
  #default = "ami-08d70e59c07c61a3a"
  description = "O ID da AMI usada"
    validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "O image_id deve ser um identificador de AMI válido, começando com \"ami-\"."
  }
  sensitive = true
}