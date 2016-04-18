#
# Cookbook Name:: build-cookbook
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

ruby_install node['components']['supermarket']['ruby_version']

docker_service 'Start Docker for Test-Dependent Services' do
  instance 'dockerd'
  action [:create, :start]
  host 'unix:///var/run/docker.sock'
  group 'docker'
  only_if { debian? or rhel? }
end
