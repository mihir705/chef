# Lab 07 — Custom resources

**Concepts:** `unified_mode`, `property`, `action`, `provides`, reuse like an Ansible module / Terraform resource.

```bash
chef-client -z -c .chef/config.rb --environment lab -o 'recipe[common::custom_resource]'
cat /tmp/chef-lab/marker.txt
```

Source: `cookbooks/common/resources/marker.rb` used by `cookbooks/common/recipes/custom_resource.rb`.
