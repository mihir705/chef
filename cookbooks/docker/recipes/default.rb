directory node['org']['lab_dir'] do
  recursive true
  mode '0755'
end

file "#{node['org']['lab_dir']}/docker.txt" do
  content "package=#{node['docker']['package']}\nusers=#{node['docker']['users'].join(',')}\n"
  mode '0644'
end

unless node['org']['lab_only']
  package node['docker']['package']

  service 'docker' do
    action [:enable, :start]
  end

  group 'docker' do
    append true
    members node['docker']['users']
  end
end
