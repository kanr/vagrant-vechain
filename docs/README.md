# NOTE: Still experimental, this is not secure and should not be used in production or the mainet

Vagrant is insecure by design and should not be used for hosting production workloads or running thor on the mainet. This project is for testing changes, updates and scripts in the VeChain ecosystem.

![VeChain Community](/vechain-community-logo.png)

[![Join the chat at https://gitter.im/vagrant-vechain/Lobby](https://badges.gitter.im/vagrant-vechain/Lobby.svg)](https://gitter.im/vagrant-vechain/Lobby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

## Dependencies

You will need a [Vagrant Provider](https://www.vagrantup.com/docs/providers/default.html) Virtual Box or VMware desktop, you can also use docker or Hyper-V

## Vagrant VeChain thor

 This repo will install the dependencies and software for a [VeChain Thor node.](https://github.com/vechain/thor) It is currently configured to connect to the test network and begin syncing blocks by running /root/vehcain-testnet.sh

TODO - test and configure secure user account configuration for administration, running the services, ...etc,

## GoLang environment

 Golang, or Go, has a slightly more complicated process for setting up its environment. Currently the build is done in three scripts, `install_dependencies.sh` installs system dependencies in privelaged mode, `install_go.sh` and `install.sh` installs go and thor in unprivelaged mode.

 TODO - ensure go lange being installed according to best and most secure practices

## Thor Installation

Thor is currently being installed with the `go get` method. A testnet script is created during the build process and is being launched from the vagrantfile. This allows the developer to launch the thor testnet locally with `vagrant up`. Since the terminal session will automatically connect to the thor blockchain and start syncing blocks you will need to open another terminal windows in your local environment to begin interacting with the api.

TODO continue [hardening and securing](https://github.com/slowmist/vechain-core-nodes-security-checklist/blob/master/README-en.md) thor

### Going further

comming soon... [terraform](https://terraform.io) + [vechain](https://github.com/vechain/thor)

### Sources/Resources

[deploy script](https://github.com/mirei83/vechain-deploy)