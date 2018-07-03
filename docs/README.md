# NOTE: Still experimental

Vagrant is insecure by design and should not be used for hosting production workloads. This project is for testing changes, updates and scripts in the VeChain ecosystem.

![VeChain Community](assets/vechain-community-logo.png)

[![Join the chat at https://gitter.im/vagrant-vechain/Lobby](https://badges.gitter.im/vagrant-vechain/Lobby.svg)](https://gitter.im/vagrant-vechain/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## Dependencies

You will need a [Vagrant Provider](https://www.vagrantup.com/docs/providers/default.html): Virtual Box, VMware desktop, Hyper-V and Docker are the most common.

for syncing the scripts you need to  `vagrant plugin install vagrant-vboxmanage` plugin as well, run `vagrant plugin list` to see the plugins you have installed. [Vagrant-aws](https://github.com/mitchellh/vagrant-aws) and [vagrant-wsl](https://www.vagrantup.com/docs/other/wsl.html) are two other examples I am experimenting with.

## Vagrant VeChain thor

 This repo will install the dependencies and software for a [VeChain Thor node.](https://github.com/vechain/thor) It is currently configured to connect to the network when you first run `vagrant up` but I plan to refactor that so that it runs as service or in screen.

In the [Vagrantfile](Vagrantfile) you can set a `beneficiary` address that will be passed to the guest as an environment variable or as an argument from vagrant to the inline script. For now I am leaving it up to you to decide how you want to use it until a more permanent solution for autostarting Thor is developed. 

TODO - create an autostart configuration with screen

## GoLang environment

 Golang, or Go, has a slightly more complicated process for setting up its environment. Currently the build is done in three scripts, `install_dependencies.sh` installs system dependencies in privelaged mode, `install_go.sh` and `install.sh` installs go and thor in unprivelaged mode.

 TODO - ensure go lang being installed according to best and most secure practices

## Thor Installation

Thor is currently being installed with the `go get` method. A testnet script is created during the build process and is being launched from the vagrantfile. This allows the developer to launch the thor testnet locally with `vagrant up`. Since the terminal session will automatically connect to the thor blockchain and start syncing blocks you will need to open another terminal windows in your local environment to begin interacting with the api.

TODO continue [hardening and securing](https://github.com/slowmist/vechain-core-nodes-security-checklist/blob/master/README-en.md) thor

### Going further

comming soon... [terraform](https://terraform.io) + [vechain](https://github.com/vechain/thor)

### Sources/Resources

[deploy script](https://github.com/mirei83/vechain-deploy)