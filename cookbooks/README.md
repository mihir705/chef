# Cookbooks

Reusable units (Terraform `modules/` / Ansible `roles/`).

| Cookbook | What it configures |
|----------|--------------------|
| `common` | lab dir, motd, baseline packages, custom resource `common_marker` |
| `users` | Linux users from attributes |
| `nginx` | templates, service, notifies reload |
| `docker` | engine + docker group |
| `postgresql` | server + `createdb` with `not_if` |
| `harden` | sshd snippet, delayed service restart |

`org.lab_only` (default `true`) writes under `/tmp/chef-lab` only. Set `false` in `environments/prod.rb` or Kitchen to mutate the OS.
