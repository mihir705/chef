directory node['org']['lab_dir'] do
  recursive true
  mode '0755'
end

file "#{node['org']['lab_dir']}/postgresql.txt" do
  content "db=#{node['postgresql']['db']}\nuser=#{node['postgresql']['user']}\n"
  mode '0644'
end

unless node['org']['lab_only']
  package %w(postgresql postgresql-contrib)

  service 'postgresql' do
    action [:enable, :start]
  end

  execute 'create-app-db' do
    user 'postgres'
    command "createdb #{node['postgresql']['db']}"
    not_if "psql -U postgres -lqt | cut -d \\| -f 1 | grep -qw #{node['postgresql']['db']}"
  end
end
