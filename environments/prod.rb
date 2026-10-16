name 'prod'
description 'Production Linux nodes — cookbooks apply for real'
default_attributes(
  'org' => { 'environment' => 'prod', 'lab_only' => false },
  'nginx' => { 'listen_port' => 80 },
  'harden' => { 'password_auth' => 'no', 'permit_root_login' => 'no' }
)
override_attributes(
  'common' => { 'timezone' => 'UTC' }
)
