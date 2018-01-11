install_script = File.read("./provision.sh")
if File.exist?("./provision.local.sh") then
    install_script += File.read("./provision.local.sh")
end
Vagrant.configure(2) do |config|
  config.vm.define "atmo-local" do |conf|
    conf.vm.box = "ubuntu/trusty64"
    conf.ssh.forward_agent = true
    conf.ssh.username = "vagrant"
    conf.ssh.password = "vagrant"
    conf.vm.network "private_network", ip: "192.168.72.19"
    conf.vm.provision "shell", inline: install_script, privileged: true
    conf.vm.provider "virtualbox" do |v|
      v.memory = 6144
      v.cpus = 4
    end
    if Vagrant.has_plugin?("vagrant-cachier")
      conf.cache.scope = :box
    end
  end
end
