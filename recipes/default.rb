#
# Cookbook Name:: nginx-additions
# Recipe:: default
#
# Copyright (c) 2013 Nick Charlton <nick@nickcharlton.net>
# 
# MIT Licensed.
#

# create the web root
# see also: http://wiki.apache.org/httpd/FileSystemPermissions
directory '/var/www' do
  owner 'www-data'
  group 'www-data'
  mode 00750

  action :create
end

# reconfigure the default template
template "#{node['nginx']['dir']}/sites-available/default" do
  source 'default-site.erb'
  owner  'root'
  group  'root'
  mode   '0644'
  
  notifies :reload, 'service[nginx]'
end
