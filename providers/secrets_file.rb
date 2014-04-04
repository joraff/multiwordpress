action :create do
  wp_secrets = ::File.join(new_resource.docroot, '/wp-secrets.php')

  unless ::File.exist?(wp_secrets)
    require 'open-uri'
    salt_data = open('https://api.wordpress.org/secret-key/1.1/salt/').read
    template wp_secrets do
      source 'wp-secrets.php.erb'
      mode 0755
      owner 'root'
      group 'root'
      variables(
        wp_secrets: salt_data
      )
    end
  end
end