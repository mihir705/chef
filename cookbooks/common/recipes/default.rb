#
# Cookbook:: common
# Recipe:: default
#

lab_dir = node['org']['lab_dir']

directory lab_dir do
  mode '0755'
  recursive true
end

file "#{lab_dir}/motd.txt" do
  content lazy { "#{node['common']['motd']}\n#{node['hostname']}\n" }
  mode '0644'
end

# Mutating OS packages/timezone only when not a local workstation lab.
unless node['org']['lab_only']
  node['common']['packages'].each do |pkg|
    package pkg
  end

  timezone node['common']['timezone']
end

template '/etc/motd' do
  source 'motd.erb'
  mode '0644'
  only_if { !node['org']['lab_only'] }
end
