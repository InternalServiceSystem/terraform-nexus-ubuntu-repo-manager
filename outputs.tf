# Useful for building full URLs.
output "nexus_repo_names" {
  value       = [for repo in nexus_repository.ubuntu-repositories : repo.name]
  description = "The list of nexus repository names that were created"
}

# Useful for configuring apt.
output "repo_list" {
  value       = local.repos_list
  description = "The list of repo codenames that were created"
}

output "repo_urls" {
  value       = zipmap(local.repos_list, [for repo in nexus_repository.ubuntu-repositories : format("%s/repositories/%s", var.nexus_url, repo.name)])
  description = "A map of the repo codename to the url. [bionic-updates, https://yoururl/repositories/ubuntu-bionic-updates]"
}