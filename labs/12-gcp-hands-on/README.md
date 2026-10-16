# Lab 12 — GCP hands-on

Maps to `/Users/mihir/code/terraform-gcp` and `opentofu-gcp`.

| Terraform | Chef |
|-----------|------|
| `vpcs`, `compute_instances`, `cloud_storage_buckets` | OpenTofu |
| GCE guest | Chef run_list via startup script or `knife bootstrap` |
| GKE workloads | not Chef (Kubernetes manifests / Helm) |

```bash
knife bootstrap HOST --ssh-user USER -N gcp-web-01 -r 'role[web]' --environment prod
```

Kitchen driver: `kitchen-google`.

CI lint for cookbooks: `cookstyle` (RuboCop for Chef).
