include_recipe 'apache2'
include_recipe 'apache2::mod_php5'
include_recipe 'wordpress::wpcli'
include_recipe 'mysql::client'
include_recipe 'php'
include_recipe 'php::module_mysql'

apache_site 'default' do
  enable false
end

node['wordpress']['sites'].each do |id,site|
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

  web_app site['hostname'] do
    template node['wordpress']['apache_template']
    docroot docroot
    server_name site['hostname']
  end
end