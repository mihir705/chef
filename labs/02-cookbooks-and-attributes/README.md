# Lab 02 — Cookbooks and attributes

**Concepts:** cookbook layout (`recipes`, `attributes`, `templates`, `metadata.rb`), attribute precedence.

Precedence (high wins): `force_override` > `override` (role/env) > `normal` (Ohai/node) > `default` (cookbook/role/env).

```bash
chef-client -z -c .chef/config.rb --environment lab \
  -o 'recipe[nginx]' --why-run
```

`--why-run` is Chef's dry-run (like `ansible-playbook --check` / `tofu plan`). Not every resource fully supports it.
