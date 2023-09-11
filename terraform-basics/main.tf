
resource "local_file" "initpet" {
  filename = var.initfilename
  content  = "Name: ${var.content["name"]}\nType: ${var.content["type"]}\nDOB: ${var.content["dob"]}"
  depends_on = [
    random_pet.my-pet
  ]
}

resource "local_file" "pet" {
  filename = var.filename
  content = "My fav pet is ${
    random_pet.my-pet.id
  }\n${data.local_file.dog.content}"
  depends_on = [ 
    random_pet.my-pet,
    local_file.initpet
  ]
}

resource "random_pet" "my-pet" {
  prefix = var.prefix[0]
  separator = var.separator
  length = var.length
}

data "local_file" "dog" {
  filename = var.initfilename
  depends_on = [ 
    local_file.initpet
   ]
}

