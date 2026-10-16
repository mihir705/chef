# Lab 09 — ChefSpec, InSpec, Test Kitchen

**Concepts:** unit (ChefSpec) vs integration (Kitchen + InSpec). Kitchen is the Chef equivalent of Molecule.

```bash
# Unit — no VM, compiles the resource collection
cd cookbooks/nginx
chef exec rspec spec/unit/recipes/default_spec.rb

# Integration — needs Docker
cd /Users/mihir/code/chef
kitchen list
kitchen test web
```

`--why-run` is not a substitute for InSpec. CI should run ChefSpec always and Kitchen when Docker is available.
