# -*- mode: ruby -*-
# vi: set ft=ruby :
# Author: @kanr

# Environment Variable

ENV["LC_ALL"] = "en_US.UTF-8"
VAGRANT_BOX_UPDATE_CHECK_DISABLE = 1

#ENV["BENEFICIARY"] = "0x123456789"

Vagrant.configure("2") do |config|

  #skipping updates can allow for faster builds, set to true to check for updates
  config.vm.box_check_update = false 

  config.vm.define "thor" do |thor|
    thor.vm.box = "ubuntu/bionic64"
    thor.vm.network "private_network", ip: "192.168.99.2"
    thor.vm.network "forwarded_port", guest: 8669, host: 8669
    thor.vm.network "forwarded_port", guest: 11235, host: 11235

    thor.vm.provider "virtualbox" do |vb|
      # Display the VirtualBox GUI when booting the machine
      vb.gui = false
      # Customize the amount of memory on the VM:
      vb.memory = "1024"
    end

    #define beneficiary here for now.....
    beneficiary = "0x12345"

    $script = <<-SCRIPT
    #!/bin/bash    
    chmod -R a+x /home/vagrant/scripts
    export BENEFICIARY=#{beneficiary}
    echo "finished running script"
    printenv 
    SCRIPT


    thor.vm.provision "file", source: "scripts", destination: "/home/vagrant/scripts"
    thor.vm.provision "shell", path: "scripts/install_dependencies.sh"
    thor.vm.provision "shell", path: "scripts/install_go.sh", privileged: false, name: "install_go" 
    thor.vm.provision "shell", path: "scripts/install_thor.sh", privileged: false, name: "install_thor"

    thor.vm.provision "shell", inline: $script, run: "always"
    
    thor.vm.provision "shell" do |t|
       t.inline = "$GOPATH/src/github.com/vechain/thor/bin/thor \
       --network main \
       #--beneficiary #{beneficiary} \
       --data-dir ~/.thor/logs \
       --api-addr localhost:8669 \
       #--api-cors domain0,domain1,domain2 \
       --verbosity 9 \
       --max-peers 25 \
       --p2p-port 11235 \
       --nat $1"
       t.args = ["any", "none", "upnp", "pmp", "exitip"]
       t.keep_color = true
       t.name = "thor"
       t.sensitive = true
       t.privileged = false
       #t.upload_path = "$GOPATH"
    end 
  end

  
end

