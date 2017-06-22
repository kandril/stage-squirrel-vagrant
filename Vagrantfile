Vagrant.configure("2") do |config|
  config.vm.box = "boxcutter/ubuntu1604"

  config.vm.define "stage-squirrel-dev" do |dev|
    dev.vm.hostname = "stage-squirrel.dev"

    dev.vm.network :forwarded_port, guest: 8500, host: 18500
    dev.vm.network :forwarded_port, guest: 5858, host: 58585

    dev.vm.provider :virtualbox do |vb|
      vb.name = "stage-squirrel-dev"
    end

    dev.vm.provision :shell, path: "bootstrap.sh"

    dev.vm.synced_folder "app/", "/home/vagrant/Stage-Squirrel"
  end
end
