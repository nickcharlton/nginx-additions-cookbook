# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.hostname = "nginx-additions-berkshelf"
  config.vm.box = "boxes-precise64-chef"
  config.vm.box_url = "http://boxes.nickcharlton.net/precise64-chef-virtualbox.box"

  # create private network to interact with it
  config.vm.network :private_network, ip: "33.33.33.10"

  # enable Berkshelf
  config.berkshelf.enabled = true

  # provison using Chef Solo
  # note: this is mostly the default
  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :mysql => {
        :server_root_password => 'rootpass',
        :server_debian_password => 'debpass',
        :server_repl_password => 'replpass'
      }
    }

    chef.run_list = [
        "recipe[nginx-additions::default]"
    ]
  end
end
