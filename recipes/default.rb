#
# Cookbook:: node_3
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

apt_update 'update_sources' do
  action :update
end

package 'nginx'

# template 'destination' do
#   source 'name_file_in_templates.conf.erb'
# end

service "nginx" do
  action [:enable, :start]
end

template '/etc/nginx/sites-available/proxy.conf' do
  source 'proxy.conf.erb'
  variables(proxy_port: node['nginx']['proxy_port'],
    proxy_port2: node['nginx']['proxy_port2'])
  notifies :restart, 'service[nginx]'
end

link '/etc/nginx/sites-enabled/proxy.conf' do
  to '/etc/nginx/sites-available/proxy.conf'
  notifies :restart, 'service[nginx]'
end

link '/etc/nginx/sites-enabled/default' do
  action :delete
  notifies :restart, 'service[nginx]'
end

# include_recipe 'apt'
include_recipe 'nodejs'
nodejs_npm 'pm2'
