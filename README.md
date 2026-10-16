# chef

Job-ready Chef Infra repo: core concepts as hands-on labs, reusable cookbooks, and a clear split against `/Users/mihir/code/terraform-aws`, `terraform-azure`, `terraform-gcp` (and OpenTofu counterparts).

**Terraform/OpenTofu creates cloud infra. Chef configures the node** (packages, services, templates, users). Same split as Ansible vs Terraform.

## Structure

```
chef/
├── .chef/config.rb              # local-mode chef-repo
├── cookbooks/                   # like terraform modules / ansible roles
│   ├── common/  users/  nginx/  docker/  postgresql/  harden/
├── roles/                       # web, db
├── environments/                # lab (safe), prod (real)
├── data_bags/secrets/
├── policyfiles/                 # modern replacement for roles+env
├── kitchen.yml                  # Test Kitchen + InSpec
├── test/integration/
└── labs/00-setup … 12-gcp
```

## Curriculum (do in order)

| Lab | Concepts |
|-----|----------|
| [00-setup](labs/00-setup/README.md) | Chef Workstation, `chef-client -z` |
| [01-resources-and-recipes](labs/01-resources-and-recipes/README.md) | resource, recipe, `chef-apply`, idempotence |
| [02-cookbooks-and-attributes](labs/02-cookbooks-and-attributes/README.md) | cookbook layout, attribute precedence, `--why-run` |
| [03-templates-files-ohai](labs/03-templates-files-ohai/README.md) | ERB, Ohai facts |
| [04-notifications-guards](labs/04-notifications-guards/README.md) | notifies, only_if/not_if |
| [05-roles-and-environments](labs/05-roles-and-environments/README.md) | run_list, env attributes |
| [06-data-bags-and-secrets](labs/06-data-bags-and-secrets/README.md) | data bags, encryption |
| [07-custom-resources](labs/07-custom-resources/README.md) | unified_mode custom resource |
| [08-policyfiles](labs/08-policyfiles/README.md) | Policyfile vs Berks/roles |
| [09-testing](labs/09-testing/README.md) | ChefSpec, Kitchen, InSpec |
| [10-aws-hands-on](labs/10-aws-hands-on/README.md) | bootstrap after terraform-aws |
| [11-azure-hands-on](labs/11-azure-hands-on/README.md) | bootstrap after terraform-azure |
| [12-gcp-hands-on](labs/12-gcp-hands-on/README.md) | bootstrap after terraform-gcp |

## How it maps

| Chef | Ansible | Terraform / OpenTofu |
|------|---------|----------------------|
| cookbook | role | module |
| recipe | tasks/main.yml | resources in main.tf |
| role / Policyfile | play + run_list | env `main.tf` |
| environment | group_vars | `terraform.tfvars` / env dir |
| data bag | ansible-vault | secrets (not in git) |
| Ohai | facts | data sources |
| `chef-client --why-run` | `--check` | `tofu plan` |
| `chef-client` | `ansible-playbook` | `tofu apply` |
| Test Kitchen | Molecule | terratest (optional) |

Linux cookbooks (`nginx`, `docker`, `postgresql`, `harden`) are day-two config. Leave VPC, S3, RG, GKE, etc. in the Terraform/OpenTofu repos.

## Quick start (safe on a laptop)

```bash
cd /Users/mihir/code/chef
chef-client -z -c .chef/config.rb --environment lab -o 'recipe[common]'
chef-client -z -c .chef/config.rb --environment lab -o 'recipe[nginx]'
chef-apply labs/01-resources-and-recipes/hello.rb
cat /tmp/chef-lab/hello.txt
```

Need Chef Workstation installed (`chef`, `chef-client`). Work through `labs/00-setup` → `labs/12-gcp-hands-on`.

Apply for real on a VM:

```bash
chef-client -z -c .chef/config.rb --environment prod -r 'role[web]'
```

Never commit `.chef/*.pem`, `encrypted_data_bag_secret`, or plaintext data bags.
