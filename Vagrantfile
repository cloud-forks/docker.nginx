# Version
Vagrant.require_version '>= 1.6.0'

# Configuration
Vagrant.configure(2) do |config|

  # Provider
  config.vm.provider 'docker' do |provider|
    provider.build_dir = '.'
    provider.build_args = ['--tag=thasmo/nginx', '--rm=true']
    provider.cmd = ['/sbin/my_init', '--enable-insecure-key']
    provider.has_ssh = true

    # Host
    if ENV.key?('VAGRANT_DOCKER_VAGRANTFILE')
      provider.vagrant_vagrantfile = ENV['VAGRANT_DOCKER_VAGRANTFILE']
    end
  end

  # Mounts
  config.vm.synced_folder '.', '/vagrant', disabled: true

  # Ports
  config.vm.network 'forwarded_port', guest: 80, host: 80
  config.vm.network 'forwarded_port', guest: 443, host: 443

  # SSH
  config.ssh.username = 'root'
  config.ssh.private_key_path = './ssh.key'
end
