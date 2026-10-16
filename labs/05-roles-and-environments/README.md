# Lab 05 — Roles and environments

**Concepts:** `run_list`, role default/override attributes, environment attributes (maps to Ansible group_vars / Terraform env).

```bash
chef-client -z -c .chef/config.rb --environment lab -r 'role[web]'
chef-client -z -c .chef/config.rb --environment prod -r 'role[web]' --why-run
```

`environments/lab.rb` sets `org.lab_only = true` (write under `/tmp/chef-lab` only). `prod` sets `lab_only = false` so packages/services converge on real nodes.

Interview note: Policyfiles replace roles+environments in modern Chef; you still get asked about both.
