# Lab 11 — Azure hands-on

Maps to `/Users/mihir/code/terraform-azure` and `opentofu-azure`.

| Terraform | Chef |
|-----------|------|
| `resource_groups`, `vnets`, `virtual_machines` | provision with OpenTofu |
| VM guest config | `role[web]` / `role[db]` after `knife bootstrap` |
| `storage_accounts` / Key Vault names | Chef attributes or data bags |

```bash
# After OpenTofu creates the VM
knife bootstrap FQDN --connection-protocol ssh \
  --ssh-user azureuser -N app-web-01 -r 'role[web]' --environment prod
```

Kitchen driver: `kitchen-azurerm`.
