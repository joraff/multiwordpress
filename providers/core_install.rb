action :install do
  begin
    default_admin = data_bag_item("wp-defaults", "admin")

    if default_admin
      node.normal['wordpress']['default_admin_username'] = default_admin['username'] if default_admin['username']
      node.normal['wordpress']['default_admin_password'] = default_admin['password'] if default_admin['password']
      node.normal['wordpress']['default_admin_email'] = default_admin['email'] if default_admin['email']
    end
  rescue Net::HTTPServerException
    Chef::Log.info "Wordpress admin user default values not specified in databag. Using attribute values."
  end


  execute "wordpress-core-install" do
    cwd new_resource.docroot
    command %{wp core install --allow-root \
      --url="#{new_resource.hostname}" \
      --title="#{new_resource.title}" \
      --admin_user="#{node['wordpress']['default_admin_username']}" \
      --admin_password="#{node['wordpress']['default_admin_password']}" \
      --admin_email="#{node['wordpress']['default_admin_email']}"; \
      if [ $? == 0]; then touch .coreInstallDone; fi }
    creates ".coreInstallDone"
  end
end