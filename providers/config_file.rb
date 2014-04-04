action :create do
  template ::File.join(new_resource.docroot, '/wp-config.php') do
    source 'wp-config.php.erb'
    mode 0755
    owner 'root'
    group 'root'
    variables(
      database:   new_resource.database,
      user:       new_resource.db_username,
      password:   new_resource.db_password
    )
  end
end