name 'web'
description 'Web servers — nginx + common + harden'
run_list 'recipe[common]', 'recipe[nginx]', 'recipe[harden]'
default_attributes(
  'nginx' => { 'listen_port' => 8080, 'server_name' => 'web.example.com' }
)
