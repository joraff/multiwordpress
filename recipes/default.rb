#
# Cookbook Name:: wordpress
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#



include_recipe 'mysql::client'
include_recipe 'mysql::server'
include_recipe 'php'
include_recipe 'php::module_mysql'

# Default recipe uses NGINX and a localhost MySQL server

include_recipe 'wordpress::nginx'
# include_recipe 'wordpress::database'



