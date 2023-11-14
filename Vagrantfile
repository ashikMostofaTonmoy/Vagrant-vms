# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    machine_names = ["proxy_server", "master1", "master2", "worker1", "worker2"]
  
    machine_names.each do |name|
        config.vm.define name do |machine|
            machine.vm.box = "generic/ubuntu2204"
            machine.vm.network "private_network", type: "dhcp"
            machine.vm.network "forwarded_port", guest: 22, host: 2222, id: "ssh", auto_correct: true
            machine.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true
            machine.vm.network "forwarded_port", guest: 443, host: 4443, auto_correct: true
            machine.vm.hostname = name
            machine.vm.provider "virtualbox" do |vb|
            vb.memory = "4096"
            vb.cpus = 2
            end
            machine.vm.provision "shell", path: "install_zsh.sh"
        end
    end
  
end
  