default['marathon']['version'] = '0.10.1'
default['marathon']['checksum'] = '0c4c78058a26194cf039614e3f88ab4746a534a372cc547e511972909397bf5b'
default['marathon']['path'] = '/opt/marathon'
default['marathon']['restart_sec'] = '20'
default['marathon']['options'] = {}

default['marathon']['init'] = case node['platform']
                              when 'ubuntu' then
                                if node['platform_version'] > '14.04'
                                  'systemd'
                                else
                                  'upstart'
                                end
                              else
                                'upstart'
                              end
