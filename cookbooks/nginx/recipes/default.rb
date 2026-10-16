include_recipe 'common::default'

lab_conf = "#{node['org']['lab_dir']}/nginx.conf"
lab_index = "#{node['org']['lab_dir']}/index.html"

directory node['org']['lab_dir'] do
  mode '0755'
  recursive true
end

template lab_conf do
  source 'nginx.conf.erb'
  mode '0644'
end

template lab_index do
  source 'index.html.erb'
  mode '0644'
end

unless node['org']['lab_only']
  package 'nginx'

  directory node['nginx']['docroot'] do
    recursive true
    mode '0755'
  end

  template "#{node['nginx']['docroot']}/index.html" do
    source 'index.html.erb'
    mode '0644'
    notifies :reload, 'service[nginx]', :delayed
  end

  template '/etc/nginx/sites-available/default' do
    source 'nginx.conf.erb'
    mode '0644'
    notifies :reload, 'service[nginx]', :delayed
    only_if { ::Dir.exist?('/etc/nginx/sites-available') }
  end

  service 'nginx' do
    action [:enable, :start]
    supports reload: true
  end
end
