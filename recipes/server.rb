# Chef Server Core
chef_ingredient 'chef-server' do
  version node['chef-server']['chef-server-core']['version']
  config <<-EOS
api_fqdn "#{node['fqdn']}"
ip_version "ipv6"
notification_email "#{node['chef_admin']}"
nginx["ssl_protocols"] = "TLSv1 TLSv1.1 TLSv1.2"
EOS
  action :install
end

file '/tmp/chef-server-core.firstrun' do
  content 'ilovechef\n'
  action :create
end

ingredient_config 'chef-server' do
  notifies :reconfigure, 'chef_ingredient[chef-server]'
end
