#---root-terraform.tf

terraform {
  cloud {
    organization = "thomas_puntillo"

    workspaces {
      name = "week-22-project"
    }
  }
}