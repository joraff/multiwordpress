action :create do
  docroot = ::File.join( node['wordpress']['install_base'], new_resource.hostname )

  directory docroot do
    owner 'root'
    group 'root'
    mode 0755
    action :create
    recursive true
  end

  ark new_resource.hostname do
    url 'http://wordpress.org/latest.tar.gz'
    path node['wordpress']['install_base']
    action :put
  end

  wordpress_secrets_file "wp-secrets-php-file" do
    docroot docroot
    action :create
  end

  wordpress_config_file "wp-config-php-file" do
    docroot docroot
    database new_resource.database
    db_username new_resource.db_username
    db_password new_resource.db_password
    action :create
  end
end