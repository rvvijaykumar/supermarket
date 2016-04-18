#
# Cookbook Name:: build-cookbook
# Recipe:: prepare
#
# Copyright 2016 Supermarket Team

ruby_install node['components']['supermarket']['ruby_version']

ruby_execute 'install Supermarket gem bundle' do
  command 'bundle install'
  cwd node['components']['supermarket']['src']
  version node['components']['supermarket']['ruby_version']
end
