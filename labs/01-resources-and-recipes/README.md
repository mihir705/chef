# Lab 01 — Resources and recipes

**Concepts:** resource, property, action, recipe, converge, idempotence.

A **resource** declares desired state (`package`, `file`, `service`). A **recipe** is a Ruby file of resources. Chef compiles then converges.

```bash
chef-client -z -c .chef/config.rb --environment lab -o 'recipe[common]'
chef-client -z -c .chef/config.rb --environment lab -o 'recipe[common]'
# second run: resources should be up-to-date
```

Interview prompt: *Compile vs converge?* Compile builds the resource collection; converge takes actions. `lazy {}` and `notifies` run at converge time.
