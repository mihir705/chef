# Lab 08 — Policyfiles (and why they replaced Berks + roles)

**Concepts:** Policyfile.rb, lock file, pinned cookbook versions, `chef install`, `chef export`, `chef push` (Chef Server).

```bash
cd policyfiles
chef install web.rb
# produces web.lock.json — commit the lock in real teams
chef show-policy web.rb
```

Compared with this repo's older pattern:

| Old | Policyfile |
|-----|------------|
| `roles/web.rb` run_list | `run_list` in Policyfile |
| `environments/prod.rb` | attributes in Policyfile + named policies |
| Berkshelf | `default_source` |

Job-ready: be able to explain both and prefer Policyfiles for new work.
