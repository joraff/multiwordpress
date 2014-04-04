# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.berkshelf.enabled = true

  config.vm.hostname = "server1.tamu.edu"

  config.vm.box = "opscode-ubuntu-12.04-i386"

  config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04-i386_provisionerless.box"

  config.vm.network :private_network, ip: "33.33.33.10"

  config.vm.provision :shell, inline: "apt-get update; apt-get install -y curl; curl -L https://www.opscode.com/chef/install.sh | sudo bash"

  # config.vm.provision :chef_client do |chef|
  #   chef.chef_server_url        = "https://api.opscode.com/organizations/tamucllatest"
  #   chef.validation_client_name = "tamucllatest-validator"
  #   chef.validation_key_path    = "../../.chef/tamucllatest-validator.pem"
  #   chef.log_level = :debug

  #   chef.run_list = [
  #       "recipe[wordpress::default]"
  #   ]
  # end

  config.vm.provision "chef_solo" do |chef|
    chef.cookbooks_path = File.absolute_path("..")
    chef.data_bags_path = "/Users/joraff/Dropbox/Development/chef/test-data-bags"
    chef.run_list = [
        "recipe[chef-solo-search]",
        "recipe[wordpress::default]"
    ]
    chef.json = {
      'mysql' => {
        'server_debian_password' => 'iloverandombutthiswilldo',
        'server_root_password' => 'iloverandombutthiswilldo',
        'server_repl_password'=> 'iloverandombutthiswilldo'
      }
    }
    chef.log_level = :debug
  end
end
