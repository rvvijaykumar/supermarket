#
# Cookbook Name:: build-cookbook
# Recipe:: unit
#
# Copyright (c) 2016 Chef, All Rights Reserved.

include_recipe 'build-cookbook::prepare'

docker_service 'Start Docker for Test-Dependent Services' do
  instance 'dockerd'
  action [:create, :start]
  host 'unix:///var/run/docker.sock'
  group 'docker'
  only_if { debian? or rhel? }
end

ruby_execute 'Run Supermarket Specs' do
  command 'bundle exec rake setup:docker db:test:prepare spec'
  cwd node['components']['supermarket']['src']
  version node['components']['supermarket']['ruby_version']
  environment ({
    'POSTGRES_IP' => 'docker.local',
    'REDIS_URL' => 'redis://docker.local:6379/0/supermarket'
  })
end
