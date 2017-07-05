# Vagrant-VM for [EF/Stage-Squirrel](https://github.com/eurofurence/Stage-Squirrel)-app
This is a simple VM setup for testing the [EF/Stage-Squirrel](https://github.com/eurofurence/Stage-Squirrel)-app and its installation, using [vagrant](https://www.vagrantup.com/).
## Installation
1. Follow the [installation guide on the vagrant homepage](https://www.vagrantup.com/intro/getting-started/install.html).
2. Open a terminal with access to the `vagrant` and `git` commands.
3. `git clone` this repository and `cd` into the copy.
4. Type `vagrant up`, hit your return-key and drink some coffee, while vagrant does stuff.
5. When vagrant finished its processing, type `vagrant global-status`. A VM named *"stage-squirrel-dev"* should appear in the list.

## Usage
1. You should be able to get to the app on [http://localhost:8080](http://localhost:8080), now.
2. The inital_load.sql was already run for you, you only need to create a **user** and use the **remote** helper script to activate (and make it an admin) , now ;)

## Tools
* This vagrant VM project is also shipped with a neat **remote** helper script.
* If you need to make use of it, just `chmod a+x remote` in your git-cloned directory and have a look at the usage-info of the **remote** by entering `./remote`.
* Have fun =]

## Troubleshooting
Dare to pester me by using this repo's Issue-tracker. ;)
