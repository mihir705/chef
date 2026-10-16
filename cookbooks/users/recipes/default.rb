directory node['org']['lab_dir'] do
  mode '0755'
  recursive true
end

file "#{node['org']['lab_dir']}/users.txt" do
  content(lazy { node['users']['accounts'].map { |u| u['name'] }.join("\n") + "\n" })
  mode '0644'
end

unless node['org']['lab_only']
  node['users']['accounts'].each do |acct|
    user acct['name'] do
      shell acct['shell']
      manage_home true
    end

    Array(acct['groups']).each do |grp|
      group grp do
        append true
        members acct['name']
        action :manage
      end
    end
  end
end
