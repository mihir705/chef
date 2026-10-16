# Lab 00 — Setup

Install Chef Workstation (includes `chef`, `chef-client`, `knife`, `kitchen`, `inspec`, ChefSpec).

```bash
# macOS
brew install --cask chef-workstation
chef --version
knife --version
kitchen version
inspec version
```

This repo is a **chef-repo**. Local mode talks to chef-zero, not a hosted Chef Server:

```bash
cd /Users/mihir/code/chef
chef-client -z -c .chef/config.rb --environment lab -o 'recipe[common]'
ls /tmp/chef-lab
```

`-z` / `--local-mode` is the Chef equivalent of running Ansible against localhost.
