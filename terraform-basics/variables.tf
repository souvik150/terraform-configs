variable "filename" {
  default = "/home/souvik150/Souvik/Terraform/terraform-basics/pet.txt"
  type = string
  description = "The file path to create"
  
}

variable "initfilename" {
  default = "/home/souvik150/Souvik/Terraform/terraform-basics/dog.txt"
  type = string
  description = "The file path to create"
}

variable "content" {
  default = {
    "name" = "Fido"
    "type" = "dog"
    "dob" = "2014-07-01"
  }
  type = map
  description = "The content of the file"
}

variable "prefix" {
  default = ["Mr","Mrs","Sir"]
  type = list(string)
  description = "The prefix of the pet name"
}

variable "separator" {
  default = "."
  type = string
}

variable "length" {
  default = 1
  type = number
}

# terraform graph | dot -Tsvg > graph.svg