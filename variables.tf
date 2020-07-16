variable "codename" {
    type = string
    default = "bionic"
    description = "The Ubuntu Distribution's CodeName."
}

variable "repos" {
    type = list(string)
    default = ["updates","security","backports"]
    description = "The Ubuntu Distribution's repos to add."
}

variable "remote_url" {
    type = string
    default = "http://us.archive.ubuntu.com/ubuntu/"
    description = "The URL of the Ubuntu Repository to target."
}

variable "nexus_url" {
    type = string
    description = "The URL of the Nexus server."
}

locals {
    repos_list = concat([var.codename],[ for repo in var.repos : format("%s-%s",var.codename,repo) ])
}