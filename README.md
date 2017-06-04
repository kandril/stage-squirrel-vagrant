# Vagrant-VM for [EF/Stage-Squirrel](https://github.com/eurofurence/Stage-Squirrel)-app
This is a simple VM setup for testing the [EF/Stage-Squirrel](https://github.com/eurofurence/Stage-Squirrel)-app and its installation, using [vagrant](https://www.vagrantup.com/).
## Installation
1. Follow the [installation guide on the vagrant homepage](https://www.vagrantup.com/intro/getting-started/install.html).
2. Open a terminal with access to the `vagrant` and `git` commands.
3. `git clone` this repository and `cd` into the copy.
4. Type `vagrant up`, hit your return-key and drink some coffee, while vagrant does stuff.
5. When vagrant finished its processing, type `vagrant global-status`. A VM named *"dstage-squirrel-dev"* should appear in the list.

## Usage
1. Open a terminal with access to the `vagrant` command.
2. Type `vagrant ssh`
3. You should be logged into the VM via **SSH**, now.
4. You can start with the installation steps mentioned in the [EF/Stage-Squirrel repository's README section](https://github.com/eurofurence/Stage-Squirrel/README.man)

## Troubleshooting
Dare to pester me by using this repo's Issue-tracker. ;)
