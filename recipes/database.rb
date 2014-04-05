include_recipe 'mysql::server'

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
end