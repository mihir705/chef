# Lab 06 — Data bags and encrypted data bags

**Concepts:** data bags (global JSON), `data_bag_item`, encrypted data bags (Chef vault / secret key).

```bash
cp data_bags/secrets/app.json.example data_bags/secrets/app.json
# chef-client can load it in local mode from data_bags/
chef-client -z -c .chef/config.rb -o 'recipe[common]'
```

Encrypt (needs a secret file — do not commit it):

```bash
openssl rand -base64 512 > .chef/encrypted_data_bag_secret
knife data bag from file secrets data_bags/secrets/app.json --secret-file .chef/encrypted_data_bag_secret
```

Never commit `encrypted_data_bag_secret` or plaintext passwords.
