Vagrant.configure("2") do |config|
  config.vm.box = "boxcutter/ubuntu1604"

  config.vm.define "stage-squirrel-dev" do |dev|
    dev.vm.hostname = "stage-squirrel.dev"

    dev.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true
    dev.vm.network :forwarded_port, guest: 5858, host: 58585, auto_correct: true

    dev.vm.provider :virtualbox do |vb|
      vb.name = "stage-squirrel-dev"
    end

    telegramFeedbackId = 74757107
    appPort = 18500
    mysql = {
      "host" => "localhost",
      "user" => "root",
      "password" => "root",
      "dbname" => "stagetest"
    }

    dev.vm.provision :shell do |shell1|
      shell1.name = "Bootstrap"
      shell1.path = "lib/bootstrap.sh"
      shell1.privileged = true
      shell1.env = {
        "SQ_APP_LISTEN_PORT" => appPort,
        "SQ_DB_USER" => mysql["user"],
        "SQ_DB_PW" => mysql["password"],
        "SQ_DB_NAME" => mysql["dbname"]
      }
    end

    dev.vm.provision :shell do |shell2|
      shell2.name = "Install App"
      shell2.path = "lib/install-app.sh"
      shell2.privileged = false
      shell2.env = {
        "SQ_APP_LISTEN_PORT" => appPort,
        "SQ_TELEGRAM_FEEDBACK_ID" => telegramFeedbackId,
        "SQ_DB_HOST" => mysql["host"],
        "SQ_DB_USER" => mysql["user"],
        "SQ_DB_PW" => mysql["password"],
        "SQ_DB_NAME" => mysql["dbname"]
      }
    end

    dev.vm.provision :shell do |shell3|
      shell3.name = "Prepare Helper scripts"
      shell3.path = "lib/prepare-helper.sh"
      shell3.privileged = false
      shell3.env = {
        "SQ_DB_USER" => mysql["user"],
        "SQ_DB_PW" => mysql["password"],
        "SQ_DB_NAME" => mysql["dbname"]
      }
    end

    dev.vm.synced_folder "Stage-Squirrel/", "/home/vagrant/Stage-Squirrel", create: true
    dev.vm.synced_folder "scripts/", "/home/vagrant/.helper", create: true
  end
end
