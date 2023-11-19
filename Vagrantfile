# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    machine_ips = {
      "admin"   => "192.168.1.209",
      "master1" => "192.168.1.210",
      "master2" => "192.168.1.211",
      "master3" => "192.168.1.212",
      "worker1" => "192.168.1.213",
      "worker2" => "192.168.1.214"
    }
  

    machine_ips.each do |name, ip|
        config.vm.define name do |machine|
            machine.vm.box = "generic/ubuntu2204"
            machine.vm.network "public_network", ip: ip
            machine.vm.hostname = name
            machine.disksize.size = '40GB'
            machine.vm.provider "virtualbox" do |vb|
                vb.memory = "4096"
                vb.cpus = 1
            end
            machine.vm.synced_folder "syncfolder/", "/data/sync", create: true 
            machine.vm.provision "shell" do |s|
                # ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
                ssh_pub_key = File.readlines("ssh_keys/vmkey.pub").first.strip
                s.inline = <<-SHELL
                  echo #{ssh_pub_key}
                  echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
                  echo #{ssh_pub_key} >> /root/.ssh/authorized_keys
                  cat /home/vagrant/.ssh/authorized_keys
                  apt update && apt install -y curl git net-tools telnet
                SHELL
            end
              
        end
    end
  
end


# ssh to the machine: ssh -i ssh_keys/vmkey vagrant@192.168.1.210