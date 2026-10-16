directory node['org']['lab_dir'] do
  recursive true
  mode '0755'
end

file "#{node['org']['lab_dir']}/sshd_snippet.conf" do
  content <<~CONF
    PasswordAuthentication #{node['harden']['password_auth']}
    PermitRootLogin #{node['harden']['permit_root_login']}
  CONF
  mode '0644'
end

sshd = '/etc/ssh/sshd_config'

unless node['org']['lab_only']
  ruby_block 'disable-ssh-password' do
    block do
      text = ::File.read(sshd)
      text.gsub!(/^#?PasswordAuthentication.*/, "PasswordAuthentication #{node['harden']['password_auth']}")
      ::File.write(sshd, text)
    end
    only_if { ::File.exist?(sshd) }
    notifies :restart, 'service[sshd]', :delayed
  end

  service 'sshd' do
    service_name node['platform_family'] == 'debian' ? 'ssh' : 'sshd'
    action :nothing
  end
end
