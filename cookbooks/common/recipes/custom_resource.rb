# Demonstrates a custom resource defined in cookbooks/common/resources/marker.rb
directory node['org']['lab_dir'] do
  recursive true
  mode '0755'
end

common_marker "#{node['org']['lab_dir']}/marker.txt" do
  message 'created by common_marker custom resource'
end
