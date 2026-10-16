name 'db'
description 'Database servers — postgresql + common'
run_list 'recipe[common]', 'recipe[postgresql]'
default_attributes(
  'postgresql' => { 'db' => 'app', 'user' => 'app' }
)
