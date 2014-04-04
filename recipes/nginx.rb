include_recipe 'nginx::default'
include_recipe 'wordpress::wpcli'

apache_site 'default' do
  enable false
end

node['wordpress']['sites'].each do |id,site|
  mysql_database site['database'] do
    connection ({:host => 'localhost', :username => 'root', :password => node['mysql']['server_root_password']})
    action :create
  end

  mysql_database_user site['db_username'] do
    connection ({:host => 'localhost', :username => 'root', :password => node['mysql']['server_root_password']})
    password site['db_password']
    database_name site['database']
    privileges [:select,:update,:insert,:create,:delete]
    action :grant
  end

  docroot = ::File.join( node['wordpress']['install_base'], site['hostname'] )

  wordpress_site site['hostname'] do
    docroot docroot
    hostname site['hostname']
    database site['database']
    db_username site['db_username']
    db_password site['db_password']
    action :create
  end

  wordpress_core_install site['hostname'] do
    docroot docroot
    title ( site['title'] ? site['title'] : site['hostname'] )
    hostname site['hostname']
    action :install
  end

  nginx_site site['hostname'] do
    server_name site['hostname']
    docroot docroot
  end
end