# Lab 10 — AWS hands-on

Maps to `/Users/mihir/code/terraform-aws` and `opentofu-aws`. Chef does **configuration** of nodes; Terraform/OpenTofu still create the VPC/S3/EC2. Together:

1. OpenTofu/Terraform apply `ec2_instances` / `vpcs` / `security_groups`
2. Tag instances `Role=web`
3. Bootstrap: `knife bootstrap HOST -N web1 -r 'role[web]' --environment prod`
4. Or Test Kitchen driver `kitchen-ec2`

| Terraform tfvars | Chef |
|------------------|------|
| `ec2_instances` | node + `role[web]` / Policyfile `web` |
| `vpcs` / `security_groups` | stay in Terraform (infra) |
| `buckets` | app config via attributes if the node must know the name |
| user-data | `knife bootstrap` or cloud-init that runs `chef-client` |

Kitchen EC2 sketch (`kitchen.cloud.yml`):

```yaml
driver:
  name: ec2
  region: us-east-1
  instance_type: t3.micro
  tags:
    ManagedBy: chef
    Project: chef
```

Do not duplicate full VPC/RDS graphs in Chef recipes; that is provisioning, not config management.
