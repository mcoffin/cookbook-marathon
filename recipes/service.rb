include_recipe 'marathon::install'

start_command = "#{node['marathon']['path']}/bin/start"
node['marathon']['options'].each do |opt, value|
  start_command << " --#{opt} #{value}"
end

chefstart = "#{node['marathon']['path']}/bin/chef-start"
file chefstart do
  content start_command
  mode '0755'
  owner 'root'
  group 'root'
  notifies :restart, 'service[marathon]', :delayed
end

case node['marathon']['init']
when 'systemd'
  systemd_service 'marathon' do
    after 'network.target'
    wants 'network.target'
    description 'Marathon framework'
    exec_start chefstart
    restart 'always'
    restart_sec node['marathon']['restart_sec']
    action [:create, :enable, :start]
  end
  service 'marathon' do
    action [:nothing]
  end
when 'upstart'
  template '/etc/init/marathon.conf' do
    source 'upstart.erb'
    variables(command: chefstart)
  end
  service 'marathon' do
    action [:enable, :start]
  end
end
