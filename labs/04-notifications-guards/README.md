# Lab 04 — Notifications, guards, idempotence

**Concepts:** `notifies` / `subscribes`, `:immediately` vs `:delayed`, `only_if` / `not_if`, `action :nothing`.

See `cookbooks/nginx/recipes/default.rb` (`notifies :reload, 'service[nginx]'`) and `cookbooks/postgresql/recipes/default.rb` (`not_if` around `createdb`).

Guards keep resources idempotent. Handlers/notifications restart a service **once** even if several templates changed.
