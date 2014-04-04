default[:wordpress] = {}
default[:wordpress][:sites] = {}
default[:wordpress][:install_base] = "/var/www/wordpress_sites"
default[:wordpress][:apache_template] = "site.conf.erb"

default[:wordpress][:default_admin_username] = "admin"
default[:wordpress][:default_admin_password] = (0...12).map { (65 + rand(26)).chr }.join
default[:wordpress][:default_admin_email] = "root@localhost"


