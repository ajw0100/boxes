Vagrant.configure("2") do |config|
    config.vm.box = "windows_10"
    config.vm.communicator = "winrm"
    config.vm.synced_folder ".", "/vagrant", SharedFoldersEnableSymlinksCreate: false

    config.vm.guest = :windows

    config.vm.network :forwarded_port, guest: 3389, host: 3399, id: "rdp", auto_correct: true
    config.vm.network :forwarded_port, guest: 5985, host: 5985, id: "winrm", auto_correct: true

    config.vm.provider "parallels" do |vm|
        vm.memory = 2048
        vm.cpus = 2
    end

end