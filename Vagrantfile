Vagrant.configure("2") do |config|
  config.vm.box = "boxcutter/ubuntu1604"

  config.vm.define "stage-squirrel-dev" do |dev|
    dev.vm.hostname = "stage-squirrel.dev"

    dev.vm.provider :virtualbox do |vb|
      vb.name = "stage-squirrel-dev"
    end

    dev.vm.provision :shell, path: "bootstrap.sh"
  end
end
