#
# Cookbook Name:: build-cookbook
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

include_recipe 'delivery_build::user'

packages_needed_to_build = %w(libsqlite3-dev libpq-dev nodejs)

packages_needed_to_build.each do |pkg|
  package pkg
end

ruby_install node['components']['supermarket']['ruby_version']

directory 'Supermarket Bundled Gems Cache' do
  name node['components']['supermarket']['gem_cache']
  owner node['delivery_builder']['build_user']
  mode '0755'
  recursive true
end

group 'docker' do
  members [node['delivery_builder']['build_user'], 'vagrant']
end

docker_service 'Start Docker for Test-Dependent Services' do
  instance 'dockerd'
  action [:create, :start]
  host 'unix:///var/run/docker.sock'
  group 'docker'
  only_if { debian? or rhel? }
end
