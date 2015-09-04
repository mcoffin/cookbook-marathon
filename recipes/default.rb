#
# Cookbook Name:: cookbook-marathon
# Recipe:: default
#
# Copyright 2015, Matt Coffin
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'marathon::install'
include_recipe 'marathon::service'
