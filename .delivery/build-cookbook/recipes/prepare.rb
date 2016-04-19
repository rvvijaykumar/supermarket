#
# Cookbook Name:: build-cookbook
# Recipe:: prepare
#
# Copyright 2016 Supermarket Team

ruby_execute 'install Supermarket gem bundle' do
  command 'bundle install'
  cwd node['components']['supermarket']['src']
  version node['components']['supermarket']['ruby_version']
  gem_home node['components']['supermarket']['gem_cache']
end
