# Ubuntu Repo Manager for Nexus

The current version of Nexus does not support multiple debian distributions in a single repository. This module creates proxy repos for the default used Ubuntu repositiories.

* base repo (ie bionic)
* updates
* security
* backports

For an example of this module in use, see [ISS Apt Nexus Terraform](https://github.com/InternalServiceSystem/iss-apt-nexus-terraform)

## Requirements

The nexus provider must be installed in your terraform plugins path. Download it from [datadrivers/terraform-provider-nexus](https://github.com/datadrivers/terraform-provider-nexus) and extract it to you `~/terraform.d/plugins` directory.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| codename | The Ubuntu Distribution's CodeName. | `string` | `"bionic"` | no |
| nexus\_url | The URL of the Nexus server. | `string` | n/a | yes |
| remote\_url | The URL of the Ubuntu Repository to target. | `string` | `"http://us.archive.ubuntu.com/ubuntu/"` | no |
| repos | The Ubuntu Distribution's repos to add. | `list(string)` | <pre>[<br>  "updates",<br>  "security",<br>  "backports"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| nexus\_repo\_names | The list of nexus repository names that were created |
| repo\_list | The list of repo codenames that were created |
| repo\_urls | A map of the repo codename to the url. [bionic-updates, https://yoururl/repositories/ubuntu-bionic-updates] |
