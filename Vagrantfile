# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    # machine_names = ["proxy-server", "master1", "master2", "worker1", "worker2"]
    machine_names = ["master1", "master2", "master3", "worker1", "worker2"]

    machine_names.each do |name|
        config.vm.define name do |machine|
            machine.vm.box = "generic/ubuntu2204"
            machine.vm.network "public_network"
            # machine.vm.network "public_network", type: "dhcp", bridge: "your_physical_network_interface"
            # machine.vm.network "forwarded_port", guest: 22, host: 2222, id: "ssh", auto_correct: true
            # machine.vm.network "forwarded_port", guest: 80, host: 8080, auto_correct: true
            # machine.vm.network "forwarded_port", guest: 443, host: 4443, auto_correct: true
            machine.vm.hostname = name
            machine.vm.provider "virtualbox" do |vb|
                vb.memory = "4096"
                vb.cpus = 1
            end
            machine.vm.synced_folder "syncfolder/", "/data/sync" , create: true 
            machine.vm.provision "shell", path: "install_zsh.sh"
        end
    end
  
end
