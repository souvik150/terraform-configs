resource "local_file" "pet" {
  filename = "/home/souvik150/Souvik/Terraform/terraform-state/pets.txt"
  content = "We love pets!"
}