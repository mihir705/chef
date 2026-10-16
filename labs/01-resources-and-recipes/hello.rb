# chef-apply labs/01-resources-and-recipes/hello.rb
directory '/tmp/chef-lab' do
  recursive true
  mode '0755'
end

file '/tmp/chef-lab/hello.txt' do
  content "hello from chef-apply\n"
  mode '0644'
end
