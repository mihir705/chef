unified_mode true
provides :common_marker

property :path, String, name_property: true
property :message, String, required: true

action :create do
  file new_resource.path do
    content "#{new_resource.message}\n"
    mode '0644'
  end
end
