resource "nexus_repository" "ubuntu-repositories" {
  for_each = toset(local.repos_list)
  name     = "ubuntu-${each.key}"
  format   = "apt"
  type     = "proxy"
  apt {
    distribution = each.key
  }
  proxy {
    remote_url = var.remote_url
  }
  storage {
    blob_store_name = "default"
    write_policy    = "ALLOW"
  }
  http_client {
  }

  negative_cache {
    enabled = false
  }
}