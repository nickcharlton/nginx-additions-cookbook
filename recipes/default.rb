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
template "/etc/nginx/sites-available/default" do
  source 'default-site.erb'
  owner  'root'
  group  'root'
  mode   '0644'
  
  notifies :reload, 'service[nginx]'
end

# generate the error pages
error_pages = [
  {
    :code => 404,
    :name => '404 Not Found',
    :explanation => 'Sorry, that page couldn\'t be found.',
    :message => 'It\'s possible that you were linked to the wrong place, or '\
      'something has been configured incorrectly. If you need help, email the '\
      'address below.'
  }
]

error_pages.each do |page|
  template "/var/www/#{page[:code]}.html" do
    source  'error.erb'
    owner   'www-data'
    group   'www-data'
    mode    '00640'

    variables(
      :name => page[:name],
      :explanation => page[:explanation],
      :message => page[:message],
      :support_email => 'ops@nullgrid.net',
      :status_page => 'status.nullgrid.net'
    )
  end
end
