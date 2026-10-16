name 'lab'
description 'Local workstation labs (no package/service mutation)'
default_attributes(
  'org' => { 'environment' => 'lab', 'lab_only' => true, 'lab_dir' => '/tmp/chef-lab' }
)
