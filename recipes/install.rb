#
# Cookbook Name:: cookbook-marathon
# Recipe:: install
#
# Copyright 2015, Matt Coffin
#
# All rights reserved - Do Not Redistribute
#

archive_filename = "marathon-#{node[:marathon][:version]}.tgz"
archive_url = "http://downloads.mesosphere.com/marathon/v#{node[:marathon][:version]}/#{archive_filename}"
archive_path = "#{Chef::Config[:file_cache_path]}/#{archive_filename}"

directory node[:marathon][:path] do
  owner 'root'
  group 'root'
  mode '0755'
end

remote_file archive_path do
  source archive_url
  checksum node[:marathon][:checksum]
  owner 'root'
  group 'root'
  mode '0755'
  notifies :run, 'script[extract_marathon_archive]', :immediately
end

script 'extract_marathon_archive' do
  interpreter 'bash'
  cwd ::File.dirname(archive_path)
  code <<-EOH
    tar -xzf #{archive_filename} -C #{node[:marathon][:path]} --strip-components=1
    EOH
  action :nothing
end
