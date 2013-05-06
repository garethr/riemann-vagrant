# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|

  config.vm.network :forwarded_port, guest: 5556, host: 5556

  config.vm.provision :puppet, :options => ["--debug", "--verbose", "--summarize", "--reports", "store,riemann"] do |puppet|
    puppet.manifests_path = "manifests"
    puppet.module_path    = "modules"
    puppet.manifest_file  = "site.pp"
  end

  config.vm.define :ubuntu do |conf|
    conf.vm.box = "precise64"
    conf.vm.network :private_network, ip: "192.168.50.4"
    conf.vm.box_url = "http://files.vagrantup.com/precise64.box"
  end

  config.vm.define :centos do |conf|
    conf.vm.box = "puppet-centos-63"
    conf.vm.network :private_network, ip: "192.168.50.5"
    conf.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-63-x64.box"
  end

  config.vm.define :centos58 do |conf|
    conf.vm.box = "puppet-centos-58"
    conf.vm.network :private_network, ip: "192.168.50.6"
    conf.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-58-x64.box"
  end

end
