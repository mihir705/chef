# Lab 03 — Templates, files, and Ohai

**Concepts:** ERB templates (`<%= %>`), `cookbook_file`, Ohai automatic attributes (`node['hostname']`, `node['platform']`).

```bash
chef-client -z -c .chef/config.rb --environment lab -o 'recipe[nginx]'
cat /tmp/chef-lab/nginx.conf
cat /tmp/chef-lab/index.html
ohai hostname platform
```

Ohai is Chef's fact collector (Ansible `gather_facts`).
