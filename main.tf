//--------------------------------------------------------------------
// Variables



//--------------------------------------------------------------------
// Modules
module "compute" {
  source  = "app.terraform.io/Caleb-Terraform/compute/aws"
  version = "1.0.0"

  aws_region          = "us-east-1"
  public_key_material = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDfUThzxT3TVFn2K2DoxIFJkX7UeNe4CuGpIhRm+xDd0gCpbStyhIkqjUlmm1GFGy5y51NBqshq4EhfLAmMMJig8QR5LLinOESz1wUu0AjfkEAnRZ1StlE5CkB/hyOONQeG3cCwMl4Z5xb/Pqd8JDukMP/csR/F2n7AZ34UB0VlD1pUnZVT2BNL6bxfB8Mxh1fydhaJcjNPeK/xHQPsE+NyUEItC0mQom0s/NmgioMkuqspq/cK7dMGmPu6F0VSB2IbMgG8mHxMVvzetBi68MfA3AKwXAGJ+/nGHFSWZgq2ygElt6K22T5baVfjVgR0JBY6n8gE/9KU2gIsdR9U8kU0QagUgtmE2NlSJ1nnj2A91R42NKXQSOPOVq60XiNnQrwOZLaV5JuO26jBjHZCFROpFjotNLsIccpMziWrG3rtlYZBYHu58lKPfXxcLKkqjxVkIICR7Qa+kn76Bb3slYbGZARczpH85wqiVXjuF32T6DfG3VAr6iNgKIlBXPS172c= root@Caleb"
  public_sg           = module.networking_cicd.public_sg
  public_subnets      = module.networking_cicd.public_subnets
}

module "networking_cicd" {
  source  = "app.terraform.io/Caleb-Terraform/networking-cicd/aws"
  version = "1.0.0"

  access_ip  = "0.0.0.0/0"
  aws_region = "us-east-1"
}